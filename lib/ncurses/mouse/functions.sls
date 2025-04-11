;;; -*- mode:scheme; coding: utf-8; -*-
;;;
;;; ncurses/mouse/functions.sls - mouse related function bindings of ncurses
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


;; this library assumes NCURSES_MOUSE_VERSION > 1
#!r6rs
(library (ncurses mouse functions)
    (export ncurses:has_mouse
	    ncurses:getmouse
	    ncurses:ungetmouse
	    ncurses:mousemask
	    ncurses:wenclose
	    ncurses:mouseinterval
	    ncurses:wmouse_trafo
	    ;; ncurses:has_mouse_sp
	    ;; ncurses:getmouse_sp
	    ;; ncurses:ungetmouse_sp
	    ;; ncurses:mousemask_sp
	    ;; ncurses:mouseinterval_sp
	    )
    (import (rnrs)
	    (pffi)
	    (ncurses runtime)
	    (ncurses curses types)
	    (ncurses curses variables) ;; for *ncurses:stdscr*
	    (ncurses mouse types))
(define-syntax define-binding
  (lambda (x)
    (define (->name k name)
      (datum->syntax k
       (string->symbol
	(string-append "ncurses:" (symbol->string (syntax->datum name))))))
    (syntax-case x ()
      ((k (ret) name (args ...))
       (with-syntax ((binding-name (->name #'k #'name)))
	 #'(define binding-name (ncurses-binding ret name (args ...))))))))

(define-binding (bool)    has_mouse ())
(define-binding (int)     getmouse (MEVENT*))
(define-binding (int)     ungetmouse (MEVENT*))
(define-binding (mmask_t) mousemask (mmask_t mmask_t*))
(define-binding (bool)    wenclose (WINDOW* int int))
(define-binding (int)     mouseinterval (int))
(define-binding (bool)    wmouse_trafo (WINDOW* int* int* bool))

;; (define-binding (bool)    has_mouse_sp (SCREEN*))
;; (define-binding (int)     getmouse_sp (SCREEN* MEVENT*))
;; (define-binding (int)     ungetmouse_sp (SCREEN* MEVENT*))
;; (define-binding (mmask_t) mousemask_sp (SCREEN* mmask_t mmask_t*))
;; (define-binding (int)     mouseinterval_sp (SCREEN* int))

(define (ncurses:mouse_trafo y x to-screen)
  (ncurses:wmouse_trafo *ncurses:stdscr* y x to-screen))

)
