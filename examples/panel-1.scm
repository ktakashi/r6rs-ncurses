#!r6rs
(import (rnrs)
	(ncurses)
	(ncurses panels))

;; For Chez...
(init-ncurses-binding)
(init-panels-binding)

;; From
;; https://tldp.org/HOWTO/NCURSES-Programming-HOWTO/panels.html
;; Example 14

(define lines 10)
(define cols 40)
(define y 2)
(define x 4)

(ncurses:initscr)
(ncurses:cbreak)
(ncurses:noecho)

(let ((my-wins (vector (ncurses:newwin lines cols y x)
		       (ncurses:newwin lines cols (+ y 1) (+ x 5))
		       (ncurses:newwin lines cols (+ y 2) (+ x 10)))))
  (vector-for-each (lambda (w) (ncurses:box w 0 0)) my-wins)
  (let ((my-panels (vector-map panels:new_panel my-wins)))
    (panels:update_panels)
    (ncurses:doupdate)
    (ncurses:getch)
    (ncurses:endwin)))
