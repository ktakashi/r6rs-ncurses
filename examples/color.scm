#!r6rs
(import (rnrs)
	(pffi)
	(ncurses))

(init-ncurses-binding)

;; From
;; https://tldp.org/HOWTO/NCURSES-Programming-HOWTO/color.html

(define (print-in-middle win starty startx width string)
  (let ((win (if (null-pointer? win)
		 *ncurses:stdscr*
		 win)))
    (let-values (((y x) (ncurses:getyx win)))
      (let ((x (if (zero? startx) x startx))
	    (y (if (zero? starty) y starty))
	    (width (if (zero? width) 80 width))
	    (length (string-length string)))
	(ncurses:mvwprintw win y
	  (+ x (div (- width length) 2))
	  "%s" string)))))

(ncurses:initscr)
(unless (ncurses:has_colors)
  (ncurses:endwin)
  (display "Your terminal does not support color") (newline)
  (exit 1))

(ncurses:start_color)
(ncurses:init_pair 1 *ncurses:COLOR_RED* *ncurses:COLOR_BLACK*)

(ncurses:attron (ncurses:COLOR_PAIR 1))
(print-in-middle *ncurses:stdscr* (div *ncurses:LINES* 2) 0 0
		 "Viola !!! In color ...")
(ncurses:attroff (ncurses:COLOR_PAIR 1))
(ncurses:getch)
(ncurses:endwin)
