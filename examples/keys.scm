#!r6rs
(import (rnrs)
	(pffi)
	(ncurses))

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
;; https://tldp.org/HOWTO/NCURSES-Programming-HOWTO/keys.html

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
	  

(ncurses:initscr)
(ncurses:clear)
(ncurses:noecho)
(ncurses:cbreak)
(let* ((startx (div (- 80 width) 2))
       (starty (div (- 24 height) 2))
       (menu-win (ncurses:newwin height width startx starty)))
  (ncurses:keypad menu-win 1)
  (ncurses:mvprintw 0 0 "Use arrow keys to go up and down, Press entre to select a choice")
  (ncurses:refresh)
  (let ((highlight 1) (choice 0) (end? #f))
    (print-menu menu-win highlight)
    (do () (end?)
      (let ((c (ncurses:wgetch menu-win)))
	(cond ((eqv? c *ncurses:KEY_UP*)
	       (if (= highlight 1)
		   (set! highlight (vector-length choices))
		   (dec! highlight)))
	      ((eqv? c *ncurses:KEY_DOWN*)
	       (if (= highlight (vector-length choices))
		   (set! highlight 1)
		   (inc! highlight)))
	      ((eqv? c 10) (set! choice highlight))
	      (else
	       (ncurses:mvprintw 24 0 "Character pressed is %3d Hopefully it can be printed as '%c'" c c)
	       (ncurses:refresh))))
      (print-menu menu-win highlight)
      (unless (zero? choice) (set! end? #t)))
    (ncurses:mvprintw 23 0 "You chose choice %d with choice string %s\n"
		      choice (vector-ref choices (- choice 1))))
  (ncurses:clrtoeol)
  (ncurses:refresh)
  (ncurses:getch)
  (ncurses:endwin))
  
