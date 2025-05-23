(import (rnrs)
	(ncurses curses)
	(ncurses forms))

(init-forms-binding)

(ncurses:initscr)
(ncurses:cbreak)
(ncurses:noecho)
(ncurses:keypad *ncurses:stdscr* #t)

(let ((fields (vector (forms:new_field 1 10 4 18 0 0)
		      (forms:new_field 1 10 6 18 0 0))))
  (vector-for-each (lambda (field)
		     (forms:set_field_back field *ncurses:A_UNDERLINE*)
		     (forms:field_opts_off field *forms:O_AUTOSKIP*))
		   fields)

  (let ((my-form (forms:new_form fields)))
    (forms:post_form my-form)
    (ncurses:refresh)

    (ncurses:mvprintw 4 10 "Value 1:")
    (ncurses:mvprintw 6 10 "Value 2:")
    (ncurses:refresh)
    (do ((ch (ncurses:getch) (ncurses:getch)))
	((eqv? ch (ncurses:KEY_F 1)))
      (cond ((eqv? ch *ncurses:KEY_DOWN*)
	     (forms:form_driver my-form *forms:REQ_NEXT_FIELD*)
	     (forms:form_driver my-form *forms:REQ_END_LINE*))
	    ((eqv? ch *ncurses:KEY_UP*)
	     (forms:form_driver my-form *forms:REQ_PREV_FIELD*)
	     (forms:form_driver my-form *forms:REQ_END_LINE*))
	    (else (forms:form_driver my-form ch))))
    (forms:unpost_form my-form)
    (forms:free_form my-form)
    (vector-for-each forms:free_field fields)))
(ncurses:endwin)
