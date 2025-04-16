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

	    *ncurses:ACS_ULCORNER*
	    *ncurses:ACS_LLCORNER*
	    *ncurses:ACS_URCORNER*
	    *ncurses:ACS_LRCORNER*
	    *ncurses:ACS_LTEE*
	    *ncurses:ACS_RTEE*
	    *ncurses:ACS_BTEE*
	    *ncurses:ACS_TTEE*
	    *ncurses:ACS_HLINE*
	    *ncurses:ACS_VLINE*
	    *ncurses:ACS_PLUS*
	    *ncurses:ACS_S1*
	    *ncurses:ACS_S9*
	    *ncurses:ACS_DIAMOND*
	    *ncurses:ACS_CKBOARD*
	    *ncurses:ACS_DEGREE*
	    *ncurses:ACS_PLMINUS*
	    *ncurses:ACS_BULLET*
	    *ncurses:ACS_LARROW*
	    *ncurses:ACS_RARROW*
	    *ncurses:ACS_DARROW*
	    *ncurses:ACS_UARROW*
	    *ncurses:ACS_BOARD*
	    *ncurses:ACS_LANTERN*
	    *ncurses:ACS_BLOCK*
	    *ncurses:ACS_S3*
	    *ncurses:ACS_S7*
	    *ncurses:ACS_LEQUAL*
	    *ncurses:ACS_GEQUAL*
	    *ncurses:ACS_PI*
	    *ncurses:ACS_NEQUAL*
	    *ncurses:ACS_STERLING*
	    (rename (*ncurses:ACS_ULCORNER*	*ncurses:ACS_BSSB*)
		    (*ncurses:ACS_LLCORNER*	*ncurses:ACS_SSBB*)
		    (*ncurses:ACS_URCORNER*	*ncurses:ACS_BBSS*)
		    (*ncurses:ACS_LRCORNER*	*ncurses:ACS_SBBS*)
		    (*ncurses:ACS_RTEE*		*ncurses:ACS_SBSS*)
		    (*ncurses:ACS_LTEE*		*ncurses:ACS_SSSB*)
		    (*ncurses:ACS_BTEE*		*ncurses:ACS_SSBS*)
		    (*ncurses:ACS_TTEE*		*ncurses:ACS_BSSS*)
		    (*ncurses:ACS_HLINE*	*ncurses:ACS_BSBS*)
		    (*ncurses:ACS_VLINE*	*ncurses:ACS_SBSB*)
		    (*ncurses:ACS_PLUS*		*ncurses:ACS_SSSS*)))
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

(define-binding WINDOW* curscr)
(define-binding WINDOW* newscr)
(define-binding WINDOW* stdscr)
(define-binding char* ttytype)
(define-binding int COLORS)
(define-binding int COLOR_PAIRS)
(define-binding int COLS)
(define-binding int ESCDELAY)
(define-binding int LINES)
(define-binding int TABSIZE)

;;; ACS variables
;; internal map
;;(define-binding pointer acs_map)
(define-binding (array uint32_t) acs_map)
(define-syntax ncurses-acs
  (syntax-rules ()
    ((_ c) (*ncurses:acs_map* (char->integer c)))))
(define-syntax define-acs
  (syntax-rules ()
    ((_ name c)
     (define-syntax name (identifier-syntax (ncurses-acs c))))))
;; We can't make them variables, as the map will be initialised
;; after the ncurses is initialised...
(define-acs *ncurses:ACS_ULCORNER*	#\l) ;; upper left corner
(define-acs *ncurses:ACS_LLCORNER*	#\m) ;; lower left corner
(define-acs *ncurses:ACS_URCORNER*	#\k) ;; upper right corner
(define-acs *ncurses:ACS_LRCORNER*	#\j) ;; lower right corner
(define-acs *ncurses:ACS_LTEE*		#\t) ;; tee pointing right
(define-acs *ncurses:ACS_RTEE*		#\u) ;; tee pointing left
(define-acs *ncurses:ACS_BTEE*		#\v) ;; tee pointing up
(define-acs *ncurses:ACS_TTEE*		#\w) ;; tee pointing down
(define-acs *ncurses:ACS_HLINE*		#\q) ;; horizontal line
(define-acs *ncurses:ACS_VLINE*		#\x) ;; vertical line
(define-acs *ncurses:ACS_PLUS*		#\n) ;; large plus or crossover
(define-acs *ncurses:ACS_S1*		#\o) ;; scan line 1
(define-acs *ncurses:ACS_S9*		#\s) ;; scan line 9
(define-acs *ncurses:ACS_DIAMOND*	#\`) ;; diamond
(define-acs *ncurses:ACS_CKBOARD*	#\a) ;; checker board (stipple)
(define-acs *ncurses:ACS_DEGREE*	#\f) ;; degree symbol
(define-acs *ncurses:ACS_PLMINUS*	#\g) ;; plus/minus
(define-acs *ncurses:ACS_BULLET*	#\~) ;; bullet
(define-acs *ncurses:ACS_LARROW*	#\,) ;; arrow pointing left
(define-acs *ncurses:ACS_RARROW*	#\+) ;; arrow pointing right
(define-acs *ncurses:ACS_DARROW*	#\.) ;; arrow pointing down
(define-acs *ncurses:ACS_UARROW*	#\-) ;; arrow pointing up
(define-acs *ncurses:ACS_BOARD*		#\h) ;; board of squares
(define-acs *ncurses:ACS_LANTERN*	#\i) ;; lantern symbol
(define-acs *ncurses:ACS_BLOCK*		#\0) ;; solid square block
(define-acs *ncurses:ACS_S3*		#\p) ;; scan line 3
(define-acs *ncurses:ACS_S7*		#\r) ;; scan line 7
(define-acs *ncurses:ACS_LEQUAL*	#\y) ;; less/equal
(define-acs *ncurses:ACS_GEQUAL*	#\z) ;; greater/equal
(define-acs *ncurses:ACS_PI*		#\{) ;; Pi
(define-acs *ncurses:ACS_NEQUAL*	#\|) ;; not equal
(define-acs *ncurses:ACS_STERLING*	#\}) ;; UK pound sign

)
