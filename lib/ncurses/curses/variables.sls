;;; -*- mode:scheme; coding: utf-8; -*-
;;;
;;; ncurses/curses/variables.sls - variables in curses.h
;;;
;;;   Copyright (c) 2025  Takashi Kato  <ktakashi@ymail.com>
;;;
;;;   Redistribution and use in source and binary forms, with or without
;;;   modification, are permitted provided that the following conditions
;;;   are met:
;;;
;;;   1. Redistributions of source code must retain the above copyright
;;;      notice, this list of conditions and the following disclaimer.
;;;
;;;   2. Redistributions in binary form must reproduce the above copyright
;;;      notice, this list of conditions and the following disclaimer in the
;;;      documentation and/or other materials provided with the distribution.
;;;
;;;   THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS
;;;   "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT
;;;   LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR
;;;   A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT
;;;   OWNER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL,
;;;   SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED
;;;   TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR
;;;   PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF
;;;   LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING
;;;   NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS
;;;   SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.

#!r6rs
(library (ncurses curses variables)
    (export *ncurses:curscr*
	    *ncurses:newscr*
	    *ncurses:stdscr*
	    *ncurses:ttytype*
	    *ncurses:COLORS*
	    *ncurses:COLOR_PAIRS*
	    *ncurses:COLS*
	    *ncurses:ESCDELAY*
	    *ncurses:LINES*
	    *ncurses:TABSIZE*

	    ncurses:ACS_ULCORNER
	    ncurses:ACS_LLCORNER
	    ncurses:ACS_URCORNER
	    ncurses:ACS_LRCORNER
	    ncurses:ACS_LTEE
	    ncurses:ACS_RTEE
	    ncurses:ACS_BTEE
	    ncurses:ACS_TTEE
	    ncurses:ACS_HLINE
	    ncurses:ACS_VLINE
	    ncurses:ACS_PLUS
	    ncurses:ACS_S1
	    ncurses:ACS_S9
	    ncurses:ACS_DIAMOND
	    ncurses:ACS_CKBOARD
	    ncurses:ACS_DEGREE
	    ncurses:ACS_PLMINUS
	    ncurses:ACS_BULLET
	    ncurses:ACS_LARROW
	    ncurses:ACS_RARROW
	    ncurses:ACS_DARROW
	    ncurses:ACS_UARROW
	    ncurses:ACS_BOARD
	    ncurses:ACS_LANTERN
	    ncurses:ACS_BLOCK
	    ncurses:ACS_S3
	    ncurses:ACS_S7
	    ncurses:ACS_LEQUAL
	    ncurses:ACS_GEQUAL
	    ncurses:ACS_PI
	    ncurses:ACS_NEQUAL
	    ncurses:ACS_STERLING
	    ncurses:ACS_BSSB
	    ncurses:ACS_SSBB
	    ncurses:ACS_BBSS
	    ncurses:ACS_SBBS
	    ncurses:ACS_SBSS
	    ncurses:ACS_SSSB
	    ncurses:ACS_SSBS
	    ncurses:ACS_BSSS
	    ncurses:ACS_BSBS
	    ncurses:ACS_SBSB
	    ncurses:ACS_SSSS)
    (import (rnrs)
	    (pffi)
	    (ncurses runtime)
	    (ncurses curses types))
(define-syntax define-binding
  (lambda (x)
    (define (->name k name)
      (datum->syntax k
       (string->symbol
	(string-append "*ncurses:" (symbol->string (syntax->datum name)) "*"))))
    (syntax-case x ()
      ((k type name)
       (with-syntax ((binding-name (->name #'k #'name)))
	 #'(define-foreign-variable *ncurses:native-library*
	     type name binding-name))))))

(define-binding pointer curscr)  ;; WINDOW*
(define-binding pointer newscr)  ;; WINDOW*
(define-binding pointer stdscr)  ;; WINDOW*
(define-binding pointer ttytype) ;; char*
(define-binding int COLORS)
(define-binding int COLOR_PAIRS)
(define-binding int COLS)
(define-binding int ESCDELAY)
(define-binding int LINES)
(define-binding int TABSIZE)

;;; ACS variables
;; internal map
;;(define-binding pointer acs_map)
(define-binding (array uint32) acs_map)
(define-syntax ncurses-acs
  (syntax-rules ()
    ((_ c) (*ncurses:acs_map* (char->integer c)))))
;; We can't make them variables, as the map will be initialised
;; after the ncurses is initialised...
(define (ncurses:ACS_ULCORNER)	(ncurses-acs #\l)) ;; upper left corner
(define (ncurses:ACS_LLCORNER)	(ncurses-acs #\m)) ;; lower left corner
(define (ncurses:ACS_URCORNER)	(ncurses-acs #\k)) ;; upper right corner
(define (ncurses:ACS_LRCORNER)	(ncurses-acs #\j)) ;; lower right corner
(define (ncurses:ACS_LTEE)	(ncurses-acs #\t)) ;; tee pointing right
(define (ncurses:ACS_RTEE)	(ncurses-acs #\u)) ;; tee pointing left
(define (ncurses:ACS_BTEE)	(ncurses-acs #\v)) ;; tee pointing up
(define (ncurses:ACS_TTEE)	(ncurses-acs #\w)) ;; tee pointing down
(define (ncurses:ACS_HLINE)	(ncurses-acs #\q)) ;; horizontal line
(define (ncurses:ACS_VLINE)	(ncurses-acs #\x)) ;; vertical line
(define (ncurses:ACS_PLUS)	(ncurses-acs #\n)) ;; large plus or crossover
(define (ncurses:ACS_S1)	(ncurses-acs #\o)) ;; scan line 1
(define (ncurses:ACS_S9)	(ncurses-acs #\s)) ;; scan line 9
(define (ncurses:ACS_DIAMOND)	(ncurses-acs #\`)) ;; diamond
(define (ncurses:ACS_CKBOARD)	(ncurses-acs #\a)) ;; checker board (stipple)
(define (ncurses:ACS_DEGREE)	(ncurses-acs #\f)) ;; degree symbol
(define (ncurses:ACS_PLMINUS)	(ncurses-acs #\g)) ;; plus/minus
(define (ncurses:ACS_BULLET)	(ncurses-acs #\~)) ;; bullet
(define (ncurses:ACS_LARROW)	(ncurses-acs #\,)) ;; arrow pointing left
(define (ncurses:ACS_RARROW)	(ncurses-acs #\+)) ;; arrow pointing right
(define (ncurses:ACS_DARROW)	(ncurses-acs #\.)) ;; arrow pointing down
(define (ncurses:ACS_UARROW)	(ncurses-acs #\-)) ;; arrow pointing up
(define (ncurses:ACS_BOARD)	(ncurses-acs #\h)) ;; board of squares
(define (ncurses:ACS_LANTERN)	(ncurses-acs #\i)) ;; lantern symbol
(define (ncurses:ACS_BLOCK)	(ncurses-acs #\0)) ;; solid square block
(define (ncurses:ACS_S3)	(ncurses-acs #\p)) ;; scan line 3
(define (ncurses:ACS_S7)	(ncurses-acs #\r)) ;; scan line 7
(define (ncurses:ACS_LEQUAL)	(ncurses-acs #\y)) ;; less/equal
(define (ncurses:ACS_GEQUAL)	(ncurses-acs #\z)) ;; greater/equal
(define (ncurses:ACS_PI)	(ncurses-acs #\{)) ;; Pi
(define (ncurses:ACS_NEQUAL)	(ncurses-acs #\|)) ;; not equal
(define (ncurses:ACS_STERLING)	(ncurses-acs #\})) ;; UK pound sign
(define ncurses:ACS_BSSB	ncurses:ACS_ULCORNER)
(define ncurses:ACS_SSBB	ncurses:ACS_LLCORNER)
(define ncurses:ACS_BBSS	ncurses:ACS_URCORNER)
(define ncurses:ACS_SBBS	ncurses:ACS_LRCORNER)
(define ncurses:ACS_SBSS	ncurses:ACS_RTEE)
(define ncurses:ACS_SSSB	ncurses:ACS_LTEE)
(define ncurses:ACS_SSBS	ncurses:ACS_BTEE)
(define ncurses:ACS_BSSS	ncurses:ACS_TTEE)
(define ncurses:ACS_BSBS	ncurses:ACS_HLINE)
(define ncurses:ACS_SBSB	ncurses:ACS_VLINE)
(define ncurses:ACS_SSSS	ncurses:ACS_PLUS)


)
