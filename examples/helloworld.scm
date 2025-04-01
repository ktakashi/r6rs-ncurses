#!r6rs
(import (rnrs)
	(ncurses))

(init-ncurses-binding) ;; for Chez
;; From
;; https://tldp.org/HOWTO/NCURSES-Programming-HOWTO/helloworld.html
(ncurses:initscr)
(guard (e (else (display (condition-message e)) (newline)))
  (ncurses:printw "Hello World !!!")
  (ncurses:refresh)
  (ncurses:getch))
(ncurses:endwin)
