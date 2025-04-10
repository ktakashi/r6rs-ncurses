;;; -*- mode:scheme; coding: utf-8; -*-
;;;
;;; ncurses/mouse/constants.sls - mouse related constants variables of ncurses
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
(library (ncurses mouse constants)
    (export *ncurses:NCURSES_BUTTON_RELEASED*
	    *ncurses:NCURSES_BUTTON_PRESSED*
	    *ncurses:NCURSES_BUTTON_CLICKED*
	    *ncurses:NCURSES_DOUBLE_CLICKED*
	    *ncurses:NCURSES_TRIPLE_CLICKED*
	    *ncurses:NCURSES_RESERVED_EVENT*

	    *ncurses:BUTTON1_RELEASED*
	    *ncurses:BUTTON1_PRESSED*
	    *ncurses:BUTTON1_CLICKED*
	    *ncurses:BUTTON1_DOUBLE_CLICKED*
	    *ncurses:BUTTON1_TRIPLE_CLICKED*
	    *ncurses:BUTTON2_RELEASED*
	    *ncurses:BUTTON2_PRESSED*
	    *ncurses:BUTTON2_CLICKED*
	    *ncurses:BUTTON2_DOUBLE_CLICKED*
	    *ncurses:BUTTON2_TRIPLE_CLICKED*
	    *ncurses:BUTTON3_RELEASED*
	    *ncurses:BUTTON3_PRESSED*
	    *ncurses:BUTTON3_CLICKED*
	    *ncurses:BUTTON3_DOUBLE_CLICKED*
	    *ncurses:BUTTON3_TRIPLE_CLICKED*
	    *ncurses:BUTTON4_RELEASED*
	    *ncurses:BUTTON4_PRESSED*
	    *ncurses:BUTTON4_CLICKED*
	    *ncurses:BUTTON4_DOUBLE_CLICKED*
	    *ncurses:BUTTON4_TRIPLE_CLICKED*
	    *ncurses:BUTTON5_RELEASED*
	    *ncurses:BUTTON5_PRESSED*
	    *ncurses:BUTTON5_CLICKED*
	    *ncurses:BUTTON5_DOUBLE_CLICKED*
	    *ncurses:BUTTON5_TRIPLE_CLICKED*
	    *ncurses:BUTTON_CTRL*
	    *ncurses:BUTTON_SHIFT*
	    *ncurses:BUTTON_ALT*
	    *ncurses:REPORT_MOUSE_POSITION*
	    *ncurses:ALL_MOUSE_EVENTS*

	    *ncurses:KEY_MOUSE*
	    
	    ncurses:BUTTON_RELEASE
	    ncurses:BUTTON_PRESS
	    ncurses:BUTTON_CLICK
	    ncurses:BUTTON_DOUBLE_CLICK
	    ncurses:BUTTON_TRIPLE_CLICK
	    ncurses:BUTTON_RESERVED_EVENT)
    (import (rnrs))
(define-syntax ncurses-mouse-mask
  (syntax-rules ()
    ((_ b m)
     (bitwise-arithmetic-shift-left m (* (- b 1) 5)))))

(define *ncurses:NCURSES_BUTTON_RELEASED*	#o01)
(define *ncurses:NCURSES_BUTTON_PRESSED*	#o02)
(define *ncurses:NCURSES_BUTTON_CLICKED*	#o04)
(define *ncurses:NCURSES_DOUBLE_CLICKED*	#o10)
(define *ncurses:NCURSES_TRIPLE_CLICKED*	#o20)
(define *ncurses:NCURSES_RESERVED_EVENT*	#o40)

(define	*ncurses:BUTTON1_RELEASED*		(ncurses-mouse-mask 1 *ncurses:NCURSES_BUTTON_RELEASED*))
(define	*ncurses:BUTTON1_PRESSED*		(ncurses-mouse-mask 1 *ncurses:NCURSES_BUTTON_PRESSED*))
(define	*ncurses:BUTTON1_CLICKED*		(ncurses-mouse-mask 1 *ncurses:NCURSES_BUTTON_CLICKED*))
(define	*ncurses:BUTTON1_DOUBLE_CLICKED*	(ncurses-mouse-mask 1 *ncurses:NCURSES_DOUBLE_CLICKED*))
(define	*ncurses:BUTTON1_TRIPLE_CLICKED*	(ncurses-mouse-mask 1 *ncurses:NCURSES_TRIPLE_CLICKED*))
(define	*ncurses:BUTTON2_RELEASED*		(ncurses-mouse-mask 2 *ncurses:NCURSES_BUTTON_RELEASED*))
(define	*ncurses:BUTTON2_PRESSED*		(ncurses-mouse-mask 2 *ncurses:NCURSES_BUTTON_PRESSED*))
(define	*ncurses:BUTTON2_CLICKED*		(ncurses-mouse-mask 2 *ncurses:NCURSES_BUTTON_CLICKED*))
(define	*ncurses:BUTTON2_DOUBLE_CLICKED*	(ncurses-mouse-mask 2 *ncurses:NCURSES_DOUBLE_CLICKED*))
(define	*ncurses:BUTTON2_TRIPLE_CLICKED*	(ncurses-mouse-mask 2 *ncurses:NCURSES_TRIPLE_CLICKED*))
(define	*ncurses:BUTTON3_RELEASED*		(ncurses-mouse-mask 3 *ncurses:NCURSES_BUTTON_RELEASED*))
(define	*ncurses:BUTTON3_PRESSED*		(ncurses-mouse-mask 3 *ncurses:NCURSES_BUTTON_PRESSED*))
(define	*ncurses:BUTTON3_CLICKED*		(ncurses-mouse-mask 3 *ncurses:NCURSES_BUTTON_CLICKED*))
(define	*ncurses:BUTTON3_DOUBLE_CLICKED*	(ncurses-mouse-mask 3 *ncurses:NCURSES_DOUBLE_CLICKED*))
(define	*ncurses:BUTTON3_TRIPLE_CLICKED*	(ncurses-mouse-mask 3 *ncurses:NCURSES_TRIPLE_CLICKED*))
(define	*ncurses:BUTTON4_RELEASED*		(ncurses-mouse-mask 4 *ncurses:NCURSES_BUTTON_RELEASED*))
(define	*ncurses:BUTTON4_PRESSED*		(ncurses-mouse-mask 4 *ncurses:NCURSES_BUTTON_PRESSED*))
(define	*ncurses:BUTTON4_CLICKED*		(ncurses-mouse-mask 4 *ncurses:NCURSES_BUTTON_CLICKED*))
(define	*ncurses:BUTTON4_DOUBLE_CLICKED*	(ncurses-mouse-mask 4 *ncurses:NCURSES_DOUBLE_CLICKED*))
(define	*ncurses:BUTTON4_TRIPLE_CLICKED*	(ncurses-mouse-mask 4 *ncurses:NCURSES_TRIPLE_CLICKED*))
(define	*ncurses:BUTTON5_RELEASED*		(ncurses-mouse-mask 5 *ncurses:NCURSES_BUTTON_RELEASED*))
(define	*ncurses:BUTTON5_PRESSED*		(ncurses-mouse-mask 5 *ncurses:NCURSES_BUTTON_PRESSED*))
(define	*ncurses:BUTTON5_CLICKED*		(ncurses-mouse-mask 5 *ncurses:NCURSES_BUTTON_CLICKED*))
(define	*ncurses:BUTTON5_DOUBLE_CLICKED*	(ncurses-mouse-mask 5 *ncurses:NCURSES_DOUBLE_CLICKED*))
(define	*ncurses:BUTTON5_TRIPLE_CLICKED*	(ncurses-mouse-mask 5 *ncurses:NCURSES_TRIPLE_CLICKED*))
(define	*ncurses:BUTTON_CTRL*			(ncurses-mouse-mask 6 #o001))
(define	*ncurses:BUTTON_SHIFT*			(ncurses-mouse-mask 6 #o002))
(define	*ncurses:BUTTON_ALT*			(ncurses-mouse-mask 6 #o004))
(define	*ncurses:REPORT_MOUSE_POSITION*		(ncurses-mouse-mask 6 #o010))
(define	*ncurses:ALL_MOUSE_EVENTS*		(- *ncurses:REPORT_MOUSE_POSITION* 1))

(define *ncurses:KEY_MOUSE*	#o631) ;; Mouse event has occurred

(define	(ncurses:BUTTON_RELEASE e x)		(bitwise-and e (ncurses-mouse-mask x #o01)))
(define	(ncurses:BUTTON_PRESS e x)		(bitwise-and e (ncurses-mouse-mask x #o02)))
(define	(ncurses:BUTTON_CLICK e x)		(bitwise-and e (ncurses-mouse-mask x #o04)))
(define	(ncurses:BUTTON_DOUBLE_CLICK e x)	(bitwise-and e (ncurses-mouse-mask x #o10)))
(define	(ncurses:BUTTON_TRIPLE_CLICK e x)	(bitwise-and e (ncurses-mouse-mask x #o20)))
(define	(ncurses:BUTTON_RESERVED_EVENT e x)	(bitwise-and e (ncurses-mouse-mask x #o40)))


)
