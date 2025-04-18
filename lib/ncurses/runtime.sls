;;; -*- mode:scheme; coding: utf-8; -*-
;;;
;;; ncurses/runtime.sls
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
(library (ncurses runtime)
    (export init-ncurses-binding
	    ncurses-binding
	    load-native-library
	    (rename (*ncurses* *ncurses:native-library*)))
    (import (rnrs)
	    (pffi)
	    (psystem os))

(define (load-native-library library)
  (let-values (((prefix suffix)
		(case *psystem:os-name*
		    ((Linux) (values "lib" ".so"))
		    ((Darwin) (values "lib" ".dylib"))
		    (else (error 'shared-library "Unknown platform"
				 *psystem:os-name*)))))
    (open-shared-object (string-append prefix library suffix))))

(define *ncurses* (load-native-library "ncurses"))
(define (init-ncurses-binding) *ncurses*)

(define-syntax ncurses-binding
  (syntax-rules ()
    ((k ret name (args ...))
     (foreign-procedure *ncurses* ret name (args ...)))))
)
