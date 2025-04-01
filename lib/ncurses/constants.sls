;;; -*- mode:scheme; coding: utf-8; -*-
;;;
;;; ncurses/constatns.sls
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
(library (ncurses constants)
    (export *ncurses:a-normal*
	    *ncurses:a-attributes*
	    *ncurses:a-chartext*
	    *ncurses:a-color*

	    *ncurses:a-standout*
	    *ncurses:a-underline*
	    *ncurses:a-reverse*
	    *ncurses:a-blink*
	    *ncurses:a-dim*
	    *ncurses:a-bold*
	    *ncurses:a-altcharset*
	    *ncurses:a-invis*
	    *ncurses:a-protect*
	    *ncurses:a-horizontal*
	    *ncurses:a-left*
	    *ncurses:a-low*
	    *ncurses:a-right*
	    *ncurses:a-top*
	    *ncurses:a-vertical*
	    *ncurses:a-italic*

	    ncurses:key-f

	    *ncurses:key-code-yes*
	    *ncurses:key-min*
	    *ncurses:key-break*
	    *ncurses:key-sreset*
	    *ncurses:key-reset*
	    *ncurses:key-down*
	    *ncurses:key-up*
	    *ncurses:key-left*
	    *ncurses:key-right*
	    *ncurses:key-home*
	    *ncurses:key-backspace*
	    *ncurses:key-f0*
	    *ncurses:key-dl*
	    *ncurses:key-il*
	    *ncurses:key-dc*
	    *ncurses:key-ic*
	    *ncurses:key-eic*
	    *ncurses:key-clear*
	    *ncurses:key-eos*
	    *ncurses:key-eol*
	    *ncurses:key-sf*
	    *ncurses:key-sr*
	    *ncurses:key-npage*
	    *ncurses:key-ppage*
	    *ncurses:key-stab*
	    *ncurses:key-ctab*
	    *ncurses:key-catab*
	    *ncurses:key-enter*
	    *ncurses:key-print*
	    *ncurses:key-ll*
	    *ncurses:key-a1*
	    *ncurses:key-a3*
	    *ncurses:key-b2*
	    *ncurses:key-c1*
	    *ncurses:key-c3*
	    *ncurses:key-btab*
	    *ncurses:key-beg*
	    *ncurses:key-cancel*
	    *ncurses:key-close*
	    *ncurses:key-command*
	    *ncurses:key-copy*
	    *ncurses:key-create*
	    *ncurses:key-end*
	    *ncurses:key-exit*
	    *ncurses:key-find*
	    *ncurses:key-help*
	    *ncurses:key-mark*
	    *ncurses:key-message*
	    *ncurses:key-move*
	    *ncurses:key-next*
	    *ncurses:key-open*
	    *ncurses:key-options*
	    *ncurses:key-previous*
	    *ncurses:key-redo*
	    *ncurses:key-reference*
	    *ncurses:key-refresh*
	    *ncurses:key-replace*
	    *ncurses:key-restart*
	    *ncurses:key-resume*
	    *ncurses:key-save*
	    *ncurses:key-sbeg*
	    *ncurses:key-scancel*
	    *ncurses:key-scommand*
	    *ncurses:key-scopy*
	    *ncurses:key-screate*
	    *ncurses:key-sdc*
	    *ncurses:key-sdl*
	    *ncurses:key-select*
	    *ncurses:key-send*
	    *ncurses:key-seol*
	    *ncurses:key-sexit*
	    *ncurses:key-sfind*
	    *ncurses:key-shelp*
	    *ncurses:key-shome*
	    *ncurses:key-sic*
	    *ncurses:key-sleft*
	    *ncurses:key-smessage*
	    *ncurses:key-smove*
	    *ncurses:key-snext*
	    *ncurses:key-soptions*
	    *ncurses:key-sprevious*
	    *ncurses:key-sprint*
	    *ncurses:key-sredo*
	    *ncurses:key-sreplace*
	    *ncurses:key-sright*
	    *ncurses:key-srsume*
	    *ncurses:key-ssave*
	    *ncurses:key-ssuspend*
	    *ncurses:key-sundo*
	    *ncurses:key-suspend*
	    *ncurses:key-undo*
	    *ncurses:key-mouse*
	    *ncurses:key-resize*
	    *ncurses:key-max*)
    (import (rnrs))

(define *ncurses-attr-shift* 8)
(define-syntax ncurses-bits
  (syntax-rules ()
    ((_ mask shift)
     (bitwise-arithmetic-shift-left mask (+ shift *ncurses-attr-shift*)))))

(define *ncurses:a-normal*	0) ;; (1U - 1U)
(define *ncurses:a-attributes*	(ncurses-bits (bitwise-not 0) 0))
(define *ncurses:a-chartext*	(- (ncurses-bits 1 0) 1))
(define *ncurses:a-color*	(ncurses-bits
				 (- (bitwise-arithmetic-shift-left 1 8) 1) 0))
(define *ncurses:a-standout*	(ncurses-bits 1 8))
(define *ncurses:a-underline*	(ncurses-bits 1 9))
(define *ncurses:a-reverse*	(ncurses-bits 1 10))
(define *ncurses:a-blink*	(ncurses-bits 1 11))
(define *ncurses:a-dim*		(ncurses-bits 1 12))
(define *ncurses:a-bold*	(ncurses-bits 1 13))
(define *ncurses:a-altcharset*	(ncurses-bits 1 14))
(define *ncurses:a-invis*	(ncurses-bits 1 15))
(define *ncurses:a-protect*	(ncurses-bits 1 16))
(define *ncurses:a-horizontal*	(ncurses-bits 1 17))
(define *ncurses:a-left*	(ncurses-bits 1 18))
(define *ncurses:a-low*		(ncurses-bits 1 19))
(define *ncurses:a-right*	(ncurses-bits 1 20))
(define *ncurses:a-top*		(ncurses-bits 1 21))
(define *ncurses:a-vertical*	(ncurses-bits 1 22))
(define *ncurses:a-italic*	(ncurses-bits 1 23))

(define (key-f n) (+ *ncurses:key-f0* n))
(define-syntax ncurses:key-f ;; Value of function key n
  (lambda (x)
    (syntax-case x ()
      ((_ n) #'(+ *ncurses:key-f0* n))
      (k
       (identifier? #'k)
       #'key-f))))

(define *ncurses:key-code-yes*	#o400) ;; A wchar-t contains a key code
(define *ncurses:key-min*	#o401) ;; Minimum curses key
(define *ncurses:key-break*	#o401) ;; Break key (unreliable)
(define *ncurses:key-sreset*	#o530) ;; Soft (partial) reset (unreliable)
(define *ncurses:key-reset*	#o531) ;; Reset or hard reset (unreliable)
(define *ncurses:key-down*	#o402) ;; down-arrow key
(define *ncurses:key-up*	#o403) ;; up-arrow key
(define *ncurses:key-left*	#o404) ;; left-arrow key
(define *ncurses:key-right*	#o405) ;; right-arrow key
(define *ncurses:key-home*	#o406) ;; home key
(define *ncurses:key-backspace*	#o407) ;; backspace key
(define *ncurses:key-f0*	#o410) ;; Function keys.  Space for 64
(define *ncurses:key-dl*	#o510) ;; delete-line key
(define *ncurses:key-il*	#o511) ;; insert-line key
(define *ncurses:key-dc*	#o512) ;; delete-character key
(define *ncurses:key-ic*	#o513) ;; insert-character key
(define *ncurses:key-eic*	#o514) ;; sent by rmir or smir in insert mode
(define *ncurses:key-clear*	#o515) ;; clear-screen or erase key
(define *ncurses:key-eos*	#o516) ;; clear-to-end-of-screen key
(define *ncurses:key-eol*	#o517) ;; clear-to-end-of-line key
(define *ncurses:key-sf*	#o520) ;; scroll-forward key
(define *ncurses:key-sr*	#o521) ;; scroll-backward key
(define *ncurses:key-npage*	#o522) ;; next-page key
(define *ncurses:key-ppage*	#o523) ;; previous-page key
(define *ncurses:key-stab*	#o524) ;; set-tab key
(define *ncurses:key-ctab*	#o525) ;; clear-tab key
(define *ncurses:key-catab*	#o526) ;; clear-all-tabs key
(define *ncurses:key-enter*	#o527) ;; enter/send key
(define *ncurses:key-print*	#o532) ;; print key
(define *ncurses:key-ll*	#o533) ;; lower-left key (home down)
(define *ncurses:key-a1*	#o534) ;; upper left of keypad
(define *ncurses:key-a3*	#o535) ;; upper right of keypad
(define *ncurses:key-b2*	#o536) ;; center of keypad
(define *ncurses:key-c1*	#o537) ;; lower left of keypad
(define *ncurses:key-c3*	#o540) ;; lower right of keypad
(define *ncurses:key-btab*	#o541) ;; back-tab key
(define *ncurses:key-beg*	#o542) ;; begin key
(define *ncurses:key-cancel*	#o543) ;; cancel key
(define *ncurses:key-close*	#o544) ;; close key
(define *ncurses:key-command*	#o545) ;; command key
(define *ncurses:key-copy*	#o546) ;; copy key
(define *ncurses:key-create*	#o547) ;; create key
(define *ncurses:key-end*	#o550) ;; end key
(define *ncurses:key-exit*	#o551) ;; exit key
(define *ncurses:key-find*	#o552) ;; find key
(define *ncurses:key-help*	#o553) ;; help key
(define *ncurses:key-mark*	#o554) ;; mark key
(define *ncurses:key-message*	#o555) ;; message key
(define *ncurses:key-move*	#o556) ;; move key
(define *ncurses:key-next*	#o557) ;; next key
(define *ncurses:key-open*	#o560) ;; open key
(define *ncurses:key-options*	#o561) ;; options key
(define *ncurses:key-previous*	#o562) ;; previous key
(define *ncurses:key-redo*	#o563) ;; redo key
(define *ncurses:key-reference*	#o564) ;; reference key
(define *ncurses:key-refresh*	#o565) ;; refresh key
(define *ncurses:key-replace*	#o566) ;; replace key
(define *ncurses:key-restart*	#o567) ;; restart key
(define *ncurses:key-resume*	#o570) ;; resume key
(define *ncurses:key-save*	#o571) ;; save key
(define *ncurses:key-sbeg*	#o572) ;; shifted begin key
(define *ncurses:key-scancel*	#o573) ;; shifted cancel key
(define *ncurses:key-scommand*	#o574) ;; shifted command key
(define *ncurses:key-scopy*	#o575) ;; shifted copy key
(define *ncurses:key-screate*	#o576) ;; shifted create key
(define *ncurses:key-sdc*	#o577) ;; shifted delete-character key
(define *ncurses:key-sdl*	#o600) ;; shifted delete-line key
(define *ncurses:key-select*	#o601) ;; select key
(define *ncurses:key-send*	#o602) ;; shifted end key
(define *ncurses:key-seol*	#o603) ;; shifted clear-to-end-of-line key
(define *ncurses:key-sexit*	#o604) ;; shifted exit key
(define *ncurses:key-sfind*	#o605) ;; shifted find key
(define *ncurses:key-shelp*	#o606) ;; shifted help key
(define *ncurses:key-shome*	#o607) ;; shifted home key
(define *ncurses:key-sic*	#o610) ;; shifted insert-character key
(define *ncurses:key-sleft*	#o611) ;; shifted left-arrow key
(define *ncurses:key-smessage*	#o612) ;; shifted message key
(define *ncurses:key-smove*	#o613) ;; shifted move key
(define *ncurses:key-snext*	#o614) ;; shifted next key
(define *ncurses:key-soptions*	#o615) ;; shifted options key
(define *ncurses:key-sprevious*	#o616) ;; shifted previous key
(define *ncurses:key-sprint*	#o617) ;; shifted print key
(define *ncurses:key-sredo*	#o620) ;; shifted redo key
(define *ncurses:key-sreplace*	#o621) ;; shifted replace key
(define *ncurses:key-sright*	#o622) ;; shifted right-arrow key
(define *ncurses:key-srsume*	#o623) ;; shifted resume key
(define *ncurses:key-ssave*	#o624) ;; shifted save key
(define *ncurses:key-ssuspend*	#o625) ;; shifted suspend key
(define *ncurses:key-sundo*	#o626) ;; shifted undo key
(define *ncurses:key-suspend*	#o627) ;; suspend key
(define *ncurses:key-undo*	#o630) ;; undo key
(define *ncurses:key-mouse*	#o631) ;; Mouse event has occurred
(define *ncurses:key-resize*	#o632) ;; Terminal resize event
(define *ncurses:key-max*	#o777) ;; Maximum key value is 0632

)
