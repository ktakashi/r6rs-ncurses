#!r6rs
(import (rnrs)
	(ncurses))

(init-ncurses-binding)

;; From
;; https://tldp.org/HOWTO/NCURSES-Programming-HOWTO/windows.html
;; Example 7

(define (create-newwin height width starty startx)
  (let ((local-win (ncurses:newwin height width starty startx)))
    (ncurses:box local-win 0 0)
    (ncurses:wrefresh local-win)
    local-win))

(define (destroy-win local-win)
  (define s (char->integer #\space)) ;; chtype is uint32_t, so must be integer...
  #| The parameters taken are 
   | 1. win: the window on which to operate
   | 2. ls: character to be used for the left side of the window 
   | 3. rs: character to be used for the right side of the window 
   | 4. ts: character to be used for the top side of the window 
   | 5. bs: character to be used for the bottom side of the window 
   | 6. tl: character to be used for the top left corner of the window 
   | 7. tr: character to be used for the top right corner of the window 
   | 8. bl: character to be used for the bottom left corner of the window 
   | 9. br: character to be used for the bottom right corner of the window
   |#
  (ncurses:wborder local-win s s s s s s s s)
  (ncurses:wrefresh local-win)
  (ncurses:delwin local-win))

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

(ncurses:initscr)
(ncurses:cbreak)
(ncurses:keypad *ncurses:stdscr* 1)

(let* ((height 3) (width 10)
       (starty (div (- *ncurses:LINES* height) 2))
       (startx (div (- *ncurses:COLS* width) 2)))
  (ncurses:printw "Press F1 to exist")
  (ncurses:refresh)

  (let ((my-win (create-newwin height width starty startx)))
    (do ((ch (ncurses:getch) (ncurses:getch)))
	((eqv? (ncurses:KEY_F 1) ch))
      (cond ((eqv? ch *ncurses:KEY_LEFT*)
	     (destroy-win my-win)
	     (set! my-win (create-newwin height width starty (dec! startx))))
	    ((eqv? ch *ncurses:KEY_RIGHT*)
	     (destroy-win my-win)
	     (set! my-win (create-newwin height width starty (inc! startx))))
	    ((eqv? ch *ncurses:KEY_UP*)
	     (destroy-win my-win)
	     (set! my-win (create-newwin height width (dec! starty) startx)))
	    ((eqv? ch *ncurses:KEY_DOWN*)
	     (destroy-win my-win)
	     (set! my-win (create-newwin height width (inc! starty) startx))))))
  (ncurses:endwin))
