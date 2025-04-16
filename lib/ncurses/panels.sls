;;; -*- mode:scheme; coding: utf-8; -*-
;;;
;;; ncurses/panels.sls - Panels library binding
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
(library (ncurses panels)
    (export init-panels-binding *panels:native-library*

	    panels:panel_window
	    panels:update_panels
	    panels:hide_panel
	    panels:show_panel
	    panels:del_panel
	    panels:top_panel
	    panels:bottom_panel
	    panels:new_panel
	    panels:panel_above
	    panels:panel_below
	    panels:set_panel_userptr
	    panels:panel_userptr
	    panels:move_panel
	    panels:replace_panel
	    panels:panel_hidden)
    (import (rnrs)
	    (pffi)
	    (ncurses runtime)
	    (ncurses curses types))
(define-type-alias PANEL* pointer)
(define *panels:native-library* (load-native-library "panel"))
(define (init-panels-binding) *panels:native-library*)

(define-syntax panels-procedure
  (syntax-rules ()
    ((k ret name (args ...))
     (foreign-procedure *panels:native-library* ret name (args ...)))))

(define-syntax define-binding
  (lambda (x)
    (define (->name k name)
      (datum->syntax k
       (string->symbol
	(string-append "panels:" (symbol->string (syntax->datum name))))))
    (syntax-case x ()
      ((k (ret) name (args ...))
       (with-syntax ((binding-name (->name #'k #'name)))
	 #'(define binding-name (panels-procedure ret name (args ...))))))))

(define-binding (WINDOW*) panel_window (PANEL*))
(define-binding (void)    update_panels ())
(define-binding (int)     hide_panel (PANEL*))
(define-binding (int)     show_panel (PANEL*))
(define-binding (int)     del_panel (PANEL*))
(define-binding (int)     top_panel (PANEL*))
(define-binding (int)     bottom_panel (PANEL*))
(define-binding (PANEL*)  new_panel (WINDOW*))
(define-binding (PANEL*)  panel_above (PANEL*))
(define-binding (PANEL*)  panel_below (PANEL*))
(define-binding (int)     set_panel_userptr (PANEL* void*))
(define-binding (void*)   panel_userptr (PANEL*))
(define-binding (int)     move_panel (PANEL* int int))
(define-binding (int)     replace_panel (PANEL* WINDOW*))
(define-binding (int)     panel_hidden (PANEL*))

;; SP
;; (define-binding (PANEL*)  ground_panel (SCREEN*))
;; (define-binding (PANEL*)  ceiling_panel (SCREEN*))
;; (define-binding (void)    update_panels_sp (SCREEN*))
)
