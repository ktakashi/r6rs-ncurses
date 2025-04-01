(import (rnrs)
	(ncurses))


(init-ncurses-binding) ;; for Chez
;; From
;; https://tldp.org/HOWTO/NCURSES-Programming-HOWTO/scanw.html

(define mesg "Enter a string: ")

(ncurses:initscr)
(let-values (((row col) (ncurses:getmaxyx *ncurses:stdscr*)))
  (ncurses:mvprintw (div row 2) (div (- col (string-length mesg)) 2) "%s" mesg)
  (let ((str (make-bytevector 80 0)))
    (ncurses:getstr str)
    (ncurses:mvprintw (- *ncurses:lines* 2) 0 "You Entered: %s"
		      (utf8->string str))))

(ncurses:getch)
(ncurses:endwin)
