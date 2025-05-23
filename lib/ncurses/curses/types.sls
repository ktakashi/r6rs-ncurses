;;; -*- mode:scheme; coding: utf-8; -*-
;;;
;;; ncurses/curses/types.sls - Curses types
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
(library (ncurses curses types)
    (export bool char* short* int* void* va_list va_list*
	    chtype chtype*
	    mmask_t mmask_t* attr_t attr_t*
	    WINDOW* SCREEN* FILE*)
    (import (rnrs)
	    (pffi))
(define-type-alias bool boolean)
(define-type-alias char* (* char))
(define-type-alias short* (* short))
(define-type-alias int* (* int))
(define-type-alias void* pointer)
(define-type-alias va_list char*) ;; probably wrong
(define-type-alias va_list* (* va_list))

(define-type-alias chtype uint32_t)
(define-type-alias chtype* (* chtype))
(define-type-alias mmask_t unsigned-long)
(define-type-alias mmask_t* (* mmask_t))
(define-type-alias attr_t chtype)
(define-type-alias attr_t* (* attr_t))

(define-type-alias WINDOW* pointer)
(define-type-alias SCREEN* pointer)
(define-type-alias FILE* pointer) ;; this it not curses types, but needed :(

)
