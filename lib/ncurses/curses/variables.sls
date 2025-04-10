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
	    *ncurses:TABSIZE*)
    (import (rnrs)
	    (pffi)
	    (ncurses runtime)
	    (ncurses types))
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

)
