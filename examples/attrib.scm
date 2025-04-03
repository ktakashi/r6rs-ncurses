#!r6rs
(import (rnrs)
	(ncurses))

(init-ncurses-binding)
;; From
;; https://tldp.org/HOWTO/NCURSES-Programming-HOWTO/attrib.html
(unless (= (length (command-line)) 2)
  (display "Usage: ") (display (car (command-line)))
  (display " <a c file name>") (newline)
  (exit 1))

(let ((in (open-file-input-port (cadr (command-line)))))
  (ncurses:initscr)
  (let-values (((row col) (ncurses:getmaxyx *ncurses:stdscr*)))
    (do ((ch (get-u8 in) (get-u8 in)) (prev #f ch))
	((eof-object? ch) (close-input-port in))
      (let-values (((y x) (ncurses:getyx *ncurses:stdscr*)))
	(when (= y (- row 1))
	  (ncurses:printw "<- Press Any Key->")
	  (ncurses:getch)
	  (ncurses:clear)
	  (ncurses:move 0 0)))
      (cond ((and (eqv? prev (char->integer #\/))
		  (eqv? ch (char->integer #\*)))
	     (ncurses:attron *ncurses:A_BOLD*)
	     (let-values (((y x) (ncurses:getyx *ncurses:stdscr*)))
	       (ncurses:move y (- x 1))
	       (ncurses:printw "%c%c" (char->integer #\/) ch)))
	    (else
	     (ncurses:printw "%c" ch)))
      (ncurses:refresh)
      (when (and (eqv? prev (char->integer #\*))
		 (eqv? ch (char->integer #\/)))
	(ncurses:attroff *ncurses:A_BOLD*))))
  ;; the below calls are not in original source,
  ;; but otherwise we don't see anything
  (ncurses:printw "<- Press Any Key->")
  (ncurses:getch)
  (ncurses:endwin))
