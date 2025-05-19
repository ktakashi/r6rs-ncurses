#!r6rs
(import (rnrs)
	(pffi)
	(ncurses)
	(ncurses mouse))

(init-ncurses-binding)

;; base on this Gist: https://gist.github.com/sylt/93d3f7b77e7f3a881603
(ncurses:initscr)
(ncurses:clear)
(ncurses:noecho)
(ncurses:cbreak)
(ncurses:keypad *ncurses:stdscr* #t)

(ncurses:mousemask (bitwise-ior *ncurses:ALL_MOUSE_EVENTS*
				*ncurses:REPORT_MOUSE_POSITION*)
		   (integer->pointer 0))

(display "\x1b;[?1003h\n")

(define (print-msg msg)
  (ncurses:mvprintw 0 0 msg)
  (ncurses:clrtoeol)
  (ncurses:refresh))

(define (pointer->string p)
  (let-values (((out e) (open-string-output-port)))
    (do ((c (pointer-ref-c-char p 0) (pointer-ref-c-char p (+ offset 1)))
	 (offset 0 (+ offset 1)))
	((= c 0) (e))
      (put-char out (integer->char c)))))

(do ((c (ncurses:wgetch *ncurses:stdscr*) (ncurses:wgetch *ncurses:stdscr*))
     (event (ncurses:make-MEVENT)))
    ((eqv? c (char->integer #\newline)))
  (cond ((eqv? c *ncurses:ERR*) (print-msg "Nothing happened."))
	((eqv? c *ncurses:KEY_MOUSE*)
	 (if (= (ncurses:getmouse event) *ncurses:OK*)
	     (print-msg (string-append "Mouse at row="
				       (number->string (ncurses:MEVENT-y event))
				       ", column="
				       (number->string (ncurses:MEVENT-x event))
				       ", bstate=0x"
				       (number->string (ncurses:MEVENT-bstate event) 16)))
	     (print-msg "Got bad mouse event.")))
	(else (print-msg (string-append "Pressed key "
					(number->string c)
					" ("
					(pointer->string (ncurses:keyname c))
					")")))))

(display "\x1b;[?1003l\n")
(ncurses:endwin)
