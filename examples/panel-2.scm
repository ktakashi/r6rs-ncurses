#!r6rs
(import (rnrs)
	(pffi)
	(ncurses)
	(ncurses panels))

;; For Chez...
(init-ncurses-binding)
(init-panels-binding)

;; From
;; https://tldp.org/HOWTO/NCURSES-Programming-HOWTO/panelss.html
;; Example 15

(define nlines 10)
(define ncols 40)

(define (print-in-middle win starty startx width label color)
  (let ((win (if (null-pointer? win) *ncurses:stdscr* win)))
    (let-values (((y x) (ncurses:getyx win)))
      (let* ((y (if (zero? starty) y starty))
	     (w (if (zero? width) 80 width))
	     (length (string-length label))
	     (x (+ startx (div (- w length) 2))))
	(ncurses:wattron win color)
	(ncurses:mvwprintw win y x "%s" label)
	(ncurses:wattroff win color)
	(ncurses:refresh)))))

(define (win-show win label color)
  (let-values (((starty startx) (ncurses:getbegyx win))
	       ((height width) (ncurses:getmaxyx win)))
    (ncurses:box win 0 0)
    (ncurses:mvwaddch win 2 0 (ncurses:ACS_LTEE))
    (ncurses:mvwhline win 2 1 (ncurses:ACS_HLINE) (- width 2))
    (ncurses:mvwaddch win 2 (- width 1) (ncurses:ACS_RTEE))
    (print-in-middle win 1 0 width label (ncurses:COLOR_PAIR color))))

(define (init-wins n)
  (define r (make-vector n))
  (let loop ((i 0) (x 10) (y 2))
    (if (= i n)
	r
	(let ((win (ncurses:newwin nlines ncols y x))
	      (label (string-append "Windows Number " (number->string i))))
	  (win-show win label (+ i 1))
	  (vector-set! r i win)
	  (loop (+ i 1) (+ x 7) (+ y 3))))))
    
(ncurses:initscr)
(ncurses:start_color)
(ncurses:cbreak)
(ncurses:noecho)
(ncurses:keypad *ncurses:stdscr* #t)

(ncurses:init_pair 1 *ncurses:COLOR_RED* *ncurses:COLOR_BLACK*)
(ncurses:init_pair 2 *ncurses:COLOR_GREEN* *ncurses:COLOR_BLACK*)
(ncurses:init_pair 3 *ncurses:COLOR_BLUE* *ncurses:COLOR_BLACK*)
(ncurses:init_pair 4 *ncurses:COLOR_CYAN* *ncurses:COLOR_BLACK*) 

(let* ((my-wins (init-wins 3))
       (my-panels (vector-map panels:new_panel my-wins)))
  (do ((i 0 (+ i 1)))
      ((= i (vector-length my-panels)))
    (let ((p (vector-ref my-panels i))
	  (n (if (= (+ i 1) (vector-length my-panels)) 0 (+ i 1))))
      (panels:set_panel_userptr p (vector-ref my-panels n))))
  (panels:update_panels)
  (ncurses:attron (ncurses:COLOR_PAIR 4))
  (ncurses:mvprintw (- *ncurses:LINES* 2) 0
		    "Use tab to browse through the windows (F1 to Exist)")
  (ncurses:attroff (ncurses:COLOR_PAIR 4))
  (ncurses:doupdate)
  (let loop ((top (vector-ref my-panels 2)))
    (let ((c (ncurses:getch)))
      (cond ((eqv? c (ncurses:KEY_F 1)))
	    ((eqv? c 9)
	     (let ((top (panels:panel_userptr top)))
	       (panels:top_panel top)
	       (panels:update_panels)
	       (ncurses:doupdate)
	       (loop top)))
	    (else
	     (panels:update_panels)
	     (ncurses:doupdate)
	     (loop top)))))
  (ncurses:endwin))
