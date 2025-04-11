#!r6rs
(import (rnrs)
	(pffi)
	(ncurses)
	(ncurses mouse))

(init-ncurses-binding)

(define-syntax inc!
  (syntax-rules ()
    ((_ v)
     (begin
       (set! v (+ v 1))
       v))))
(define-syntax dec!
  (syntax-rules ()
    ((_ v)
     (begin
       (set! v (- v 1))
       v))))

;; From
;; https://tldp.org/HOWTO/NCURSES-Programming-HOWTO/mouse.html

(define width 30)
(define height 10)

(define choices '#("Choice 1" "Choice 2" "Choice 3" "Choice 4" "Exit"))

(define (print-menu menu-win highlight)
  (let ((x 2) (y 2))
    (ncurses:box menu-win 0 0)
    (do ((i 0 (+ i 1)))
	((= i (vector-length choices)))
      (if (= highlight (+ i 1))
	  (begin
	    (ncurses:wattron menu-win *ncurses:A_REVERSE*)
	    (ncurses:mvwprintw menu-win y x "%s" (vector-ref choices i))
	    (ncurses:wattroff menu-win *ncurses:A_REVERSE*))
	  (ncurses:mvwprintw menu-win y x "%s" (vector-ref choices i)))
      (inc! y))
    (ncurses:wrefresh menu-win)))
	  
;; (display "\x1b;[?1003h")
(ncurses:initscr)
(ncurses:clear)
(ncurses:noecho)
(ncurses:cbreak)
(let* ((startx (div (- 80 width) 2))
       (starty (div (- 24 height) 2))
       (menu-win (ncurses:newwin height width starty startx)))
  (define (report-choise mousex mousey)
    (define i (+ startx 2))
    (define j (+ starty 3))
    (let loop ( (choice 0))
      (cond ((= (vector-length choices) choice) -1)
	    ((and (= (+ j choice) mousey)
		  (>= mousex i)
		  (<= mounex (+ i (string-length (vector-ref choices i)))))
	     (if (= choice (- (vector-length choices) 1))
		 -1
		 (+ choice 1)))
	    (else (loop (+ choice 1))))))

  (ncurses:attron *ncurses:A_REVERSE*)
  ;; if has mounse == 1, then it works...
  (ncurses:mvprintw 23 1 "Click on Exit to quit (Works best in a virtual console)")
  (ncurses:refresh)
  (ncurses:attroff *ncurses:A_REVERSE*)
  
  (print-menu menu-win 1)
  (ncurses:mousemask *ncurses:ALL_MOUSE_EVENTS* (integer->pointer 0))
  
  (do ((end? #f) (event (ncurses:make-MEVENT)) (choice 0))
      (end?)
    (let ((c (ncurses:wgetch menu-win)))
      (cond ((eqv? c *ncurses:KEY_MOUSE*)
	     (cond ((and (= (ncurses:getmouse event) *ncurses:OK*)
			 (not (zero? (bitwise-and (ncurses:MEVENT-bstate event)
						  *ncurses:BUTTON1_PRESSED*))))
		    (set! choice (report-choise (+ (ncurses:MEVENT-x event) 1)
						(+ (ncurses:MEVENT-y event) 1)))
		    (if (= choice -1)
			(set! end #t)
			(begin
			  (ncurses:mvprintw 22 1 "Choice made is : %d String Chosen is \"%10s\"" choice (vector-ref choices (- choice 1)))
			  (ncurses:refresh)))))
	     (unless end? (print-menu menu-win choice)))
	    ;; ESC or ALT
	    ((eqv? c 27) (set! end? #t))))))
(ncurses:getch)
(ncurses:endwin)


      
  
