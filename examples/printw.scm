(import (rnrs)
	(ncurses))


(init-ncurses-binding) ;; for Chez
;; From
;; https://tldp.org/HOWTO/NCURSES-Programming-HOWTO/printw.html

(define mesg "Just a string")

(ncurses:initscr)
(let-values (((row col) (ncurses:getmaxyx *ncurses:stdscr*)))
  (ncurses:mvprintw (div row 2) (div (- col (string-length mesg)) 2) "%s" mesg)
  (ncurses:mvprintw (- row 2) 0 "This screen has %d rows and %d columns\n" row col))
(ncurses:refresh)
(ncurses:getch)
(ncurses:endwin)
