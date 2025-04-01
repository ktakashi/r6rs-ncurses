#!r6rs
(import (rnrs)
	(ncurses))

(init-ncurses-binding)
;; From
;; https://tldp.org/HOWTO/NCURSES-Programming-HOWTO/init.html
(ncurses:initscr)			; start curses mode
(guard (e (else (display (condition-message e)) (newline)))
  (ncurses:raw)				; line buffering disabled
  (ncurses:keypad *ncurses:stdscr* 1)	; We get F1, F2 etc
  (ncurses:noecho)			; Don't echo() while we do getch
  
  (ncurses:printw "Type any character to see it in bold\n")
  (let ((ch (ncurses:getch)))
    (if (eqv? ch (ncurses:KEY_F 1))
	(ncurses:printw "F1 Key pressed")
	(begin
	  (ncurses:printw "The pressed key is ")
	  (ncurses:attron *ncurses:A_BOLD*)
	  (ncurses:printw "%c" ch)
	  (ncurses:attroff *ncurses:A_BOLD*)))))
(ncurses:refresh)
(ncurses:getch)
(ncurses:endwin)
