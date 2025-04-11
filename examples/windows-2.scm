#!r6rs
(import (rnrs)
	(pffi)
	(ncurses))

(init-ncurses-binding)

;; From
;; https://tldp.org/HOWTO/NCURSES-Programming-HOWTO/windows.html
;; Example 8

(define-foreign-struct WIN-BORDER
  (fields (int ls)
	  (int rs)
	  (int ts)
	  (int bs)
	  (int tl)
	  (int tr)
	  (int bl)
	  (int br)))

(define-foreign-struct WIN
  (fields (int startx)
	  (int starty)
	  (int height)
	  (int width)
	  (WIN-BORDER border)))

(define-syntax win.unary!
  (lambda (x)
    (define (->getter&setter k field)
      (define base (string-append "WIN-" (symbol->string (syntax->datum field))))
      (datum->syntax k (map string->symbol
			    (list base (string-append base "-set!")))))
    (syntax-case x ()
      ((k win field op)
       (with-syntax (((getter setter) (->getter&setter #'k #'field)))
	 #'(setter win (op (getter win) 1)))))))
(define-syntax win.dec!
  (syntax-rules ()
    ((_ win field) (win.unary! win field -))))
(define-syntax win.inc!
  (syntax-rules ()
    ((_ win field) (win.unary! win field +))))


(define (init-win-param)
  (define c char->integer)
  (let ((border (make-WIN-BORDER (c #\|) (c #\|) (c #\-) (c #\-)
				 (c #\+) (c #\+) (c #\+) (c #\+)))
	(height 3)
	(width 10))
    (make-WIN (div (- *ncurses:COLS* width) 2)
	      (div (- *ncurses:LINES* height) 2)
	      height width
	      border)))
(define (create-box win flag)
  (let ((h (WIN-height win))
	(w (WIN-width  win))
	(x (WIN-startx win))
	(y (WIN-starty win))
	(border (WIN-border win)))
    (if flag
	(begin
	  (ncurses:mvaddch y       x       (WIN-BORDER-tl border))
	  (ncurses:mvaddch y       (+ x w) (WIN-BORDER-tr border))
	  (ncurses:mvaddch (+ y h) x       (WIN-BORDER-bl border))
	  (ncurses:mvaddch (+ y h) (+ x w) (WIN-BORDER-br border))
	  (ncurses:mvhline y       (+ x 1) (WIN-BORDER-ts border) (- w 1))
	  (ncurses:mvhline (+ y h) (+ x 1) (WIN-BORDER-bs border) (- w 1))
	  (ncurses:mvvline (+ y 1) x       (WIN-BORDER-ls border) (- h 1))
	  (ncurses:mvvline (+ y 1) (+ x w) (WIN-BORDER-rs border) (- h 1)))
	(do ((j y (+ j 1)))
	    ((> j (+ y h)))
	  (do ((i x (+ i 1)))
	      ((> i (+ x w)))
	    (ncurses:mvaddch j i (char->integer #\space)))))))

(ncurses:initscr)
(ncurses:start_color)
(ncurses:cbreak)
(ncurses:keypad *ncurses:stdscr* #t)
(ncurses:noecho)
(ncurses:init_pair 1 *ncurses:COLOR_CYAN* *ncurses:COLOR_BLACK*)

(let ((win (init-win-param)))
  (ncurses:attron (ncurses:COLOR_PAIR 1))
  (ncurses:printw "Press F1 to exit")
  (ncurses:refresh)
  (ncurses:attroff (ncurses:COLOR_PAIR 1))

  (create-box win #t)
  (do ((ch (ncurses:getch) (ncurses:getch)))
      ((eqv? ch (ncurses:KEY_F 1)))
    (cond ((eqv? ch *ncurses:KEY_LEFT*)
	   (create-box win #f)
	   (win.dec! win startx)
	   (create-box win #t))
	  ((eqv? ch *ncurses:KEY_RIGHT*)
	   (create-box win #f)
	   (win.inc! win startx)
	   (create-box win #t))
	  ((eqv? ch *ncurses:KEY_UP*)
	   (create-box win #f)
	   (win.dec! win starty)
	   (create-box win #t))
	  ((eqv? ch *ncurses:KEY_DOWN*)
	   (create-box win #f)
	   (win.inc! win starty)
	   (create-box win #t))))
  (ncurses:endwin))

