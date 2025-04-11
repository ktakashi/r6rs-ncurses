#!r6rs
(import (rnrs)
	(pffi)
	(ncurses))

(init-ncurses-binding)

;; From
;; https://tldp.org/HOWTO/NCURSES-Programming-HOWTO/misc.html
;; Example 12

(ncurses:initscr)
(ncurses:printw "Hello World !!! (press any key)\n")
(ncurses:refresh)
(ncurses:getch)
(ncurses:def_prog_mode)
(ncurses:endwin)

(display "execute /bin/sh (press enter)") (newline)
(get-char (current-input-port))

(ncurses:reset_prog_mode)
(ncurses:refresh)
(ncurses:printw "Another String (press any key)\n")
(ncurses:refresh)
(ncurses:getch)
(ncurses:endwin)
