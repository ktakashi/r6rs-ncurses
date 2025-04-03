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
    (export *ncurses:A_NORMAL*
	    *ncurses:A_ATTRIBUTES*
	    *ncurses:A_CHARTEXT*
	    *ncurses:A_COLOR*

	    *ncurses:A_STANDOUT*
	    *ncurses:A_UNDERLINE*
	    *ncurses:A_REVERSE*
	    *ncurses:A_BLINK*
	    *ncurses:A_DIM*
	    *ncurses:A_BOLD*
	    *ncurses:A_ALTCHARSET*
	    *ncurses:A_INVIS*
	    *ncurses:A_PROTECT*
	    *ncurses:A_HORIZONTAL*
	    *ncurses:A_LEFT*
	    *ncurses:A_LOW*
	    *ncurses:A_RIGHT*
	    *ncurses:A_TOP*
	    *ncurses:A_VERTICAL*
	    *ncurses:A_ITALIC*

	    *ncurses:COLOR_BLACK*
	    *ncurses:COLOR_RED*
	    *ncurses:COLOR_GREEN*
	    *ncurses:COLOR_YELLOW*
	    *ncurses:COLOR_BLUE*
	    *ncurses:COLOR_MAGENTA*
	    *ncurses:COLOR_CYAN*
	    *ncurses:COLOR_WHITE*

	    ncurses:KEY_F

	    *ncurses:KEY_CODE_YES*
	    *ncurses:KEY_MIN*
	    *ncurses:KEY_BREAK*
	    *ncurses:KEY_SRESET*
	    *ncurses:KEY_RESET*
	    *ncurses:KEY_DOWN*
	    *ncurses:KEY_UP*
	    *ncurses:KEY_LEFT*
	    *ncurses:KEY_RIGHT*
	    *ncurses:KEY_HOME*
	    *ncurses:KEY_BACKSPACE*
	    *ncurses:KEY_F0*
	    *ncurses:KEY_DL*
	    *ncurses:KEY_IL*
	    *ncurses:KEY_DC*
	    *ncurses:KEY_IC*
	    *ncurses:KEY_EIC*
	    *ncurses:KEY_CLEAR*
	    *ncurses:KEY_EOS*
	    *ncurses:KEY_EOL*
	    *ncurses:KEY_SF*
	    *ncurses:KEY_SR*
	    *ncurses:KEY_NPAGE*
	    *ncurses:KEY_PPAGE*
	    *ncurses:KEY_STAB*
	    *ncurses:KEY_CTAB*
	    *ncurses:KEY_CATAB*
	    *ncurses:KEY_ENTER*
	    *ncurses:KEY_PRINT*
	    *ncurses:KEY_LL*
	    *ncurses:KEY_A1*
	    *ncurses:KEY_A3*
	    *ncurses:KEY_B2*
	    *ncurses:KEY_C1*
	    *ncurses:KEY_C3*
	    *ncurses:KEY_BTAB*
	    *ncurses:KEY_BEG*
	    *ncurses:KEY_CANCEL*
	    *ncurses:KEY_CLOSE*
	    *ncurses:KEY_COMMAND*
	    *ncurses:KEY_COPY*
	    *ncurses:KEY_CREATE*
	    *ncurses:KEY_END*
	    *ncurses:KEY_EXIT*
	    *ncurses:KEY_FIND*
	    *ncurses:KEY_HELP*
	    *ncurses:KEY_MARK*
	    *ncurses:KEY_MESSAGE*
	    *ncurses:KEY_MOVE*
	    *ncurses:KEY_NEXT*
	    *ncurses:KEY_OPEN*
	    *ncurses:KEY_OPTIONS*
	    *ncurses:KEY_PREVIOUS*
	    *ncurses:KEY_REDO*
	    *ncurses:KEY_REFERENCE*
	    *ncurses:KEY_REFRESH*
	    *ncurses:KEY_REPLACE*
	    *ncurses:KEY_RESTART*
	    *ncurses:KEY_RESUME*
	    *ncurses:KEY_SAVE*
	    *ncurses:KEY_SBEG*
	    *ncurses:KEY_SCANCEL*
	    *ncurses:KEY_SCOMMAND*
	    *ncurses:KEY_SCOPY*
	    *ncurses:KEY_SCREATE*
	    *ncurses:KEY_SDC*
	    *ncurses:KEY_SDL*
	    *ncurses:KEY_SELECT*
	    *ncurses:KEY_SEND*
	    *ncurses:KEY_SEOL*
	    *ncurses:KEY_SEXIT*
	    *ncurses:KEY_SFIND*
	    *ncurses:KEY_SHELP*
	    *ncurses:KEY_SHOME*
	    *ncurses:KEY_SIC*
	    *ncurses:KEY_SLEFT*
	    *ncurses:KEY_SMESSAGE*
	    *ncurses:KEY_SMOVE*
	    *ncurses:KEY_SNEXT*
	    *ncurses:KEY_SOPTIONS*
	    *ncurses:KEY_SPREVIOUS*
	    *ncurses:KEY_SPRINT*
	    *ncurses:KEY_SREDO*
	    *ncurses:KEY_SREPLACE*
	    *ncurses:KEY_SRIGHT*
	    *ncurses:KEY_SRSUME*
	    *ncurses:KEY_SSAVE*
	    *ncurses:KEY_SSUSPEND*
	    *ncurses:KEY_SUNDO*
	    *ncurses:KEY_SUSPEND*
	    *ncurses:KEY_UNDO*
	    *ncurses:KEY_MOUSE*
	    *ncurses:KEY_RESIZE*
	    *ncurses:KEY_MAX*)
    (import (rnrs))

(define *ncurses-attr-shift* 8)
(define-syntax ncurses-bits
  (syntax-rules ()
    ((_ mask shift)
     (bitwise-arithmetic-shift-left mask (+ shift *ncurses-attr-shift*)))))

(define *ncurses:A_NORMAL*	0) ;; (1U - 1U)
(define *ncurses:A_ATTRIBUTES*	(ncurses-bits (bitwise-not 0) 0))
(define *ncurses:A_CHARTEXT*	(- (ncurses-bits 1 0) 1))
(define *ncurses:A_COLOR*	(ncurses-bits
				 (- (bitwise-arithmetic-shift-left 1 8) 1) 0))
(define *ncurses:A_STANDOUT*	(ncurses-bits 1 8))
(define *ncurses:A_UNDERLINE*	(ncurses-bits 1 9))
(define *ncurses:A_REVERSE*	(ncurses-bits 1 10))
(define *ncurses:A_BLINK*	(ncurses-bits 1 11))
(define *ncurses:A_DIM*		(ncurses-bits 1 12))
(define *ncurses:A_BOLD*	(ncurses-bits 1 13))
(define *ncurses:A_ALTCHARSET*	(ncurses-bits 1 14))
(define *ncurses:A_INVIS*	(ncurses-bits 1 15))
(define *ncurses:A_PROTECT*	(ncurses-bits 1 16))
(define *ncurses:A_HORIZONTAL*	(ncurses-bits 1 17))
(define *ncurses:A_LEFT*	(ncurses-bits 1 18))
(define *ncurses:A_LOW*		(ncurses-bits 1 19))
(define *ncurses:A_RIGHT*	(ncurses-bits 1 20))
(define *ncurses:A_TOP*		(ncurses-bits 1 21))
(define *ncurses:A_VERTICAL*	(ncurses-bits 1 22))
(define *ncurses:A_ITALIC*	(ncurses-bits 1 23))

;; colors
(define *ncurses:COLOR_BLACK*	0)
(define *ncurses:COLOR_RED*	1)
(define *ncurses:COLOR_GREEN*	2)
(define *ncurses:COLOR_YELLOW*	3)
(define *ncurses:COLOR_BLUE*	4)
(define *ncurses:COLOR_MAGENTA*	5)
(define *ncurses:COLOR_CYAN*	6)
(define *ncurses:COLOR_WHITE*	7)

(define (key-f n) (+ *ncurses:KEY_F0* n))
(define-syntax ncurses:KEY_F ;; Value of function key n
  (lambda (x)
    (syntax-case x ()
      ((_ n) #'(+ *ncurses:KEY_F0* n))
      (k
       (identifier? #'k)
       #'key-f))))

(define *ncurses:KEY_CODE_YES*	#o400) ;; A wchar-t contains a key code
(define *ncurses:KEY_MIN*	#o401) ;; Minimum curses key
(define *ncurses:KEY_BREAK*	#o401) ;; Break key (unreliable)
(define *ncurses:KEY_SRESET*	#o530) ;; Soft (partial) reset (unreliable)
(define *ncurses:KEY_RESET*	#o531) ;; Reset or hard reset (unreliable)
(define *ncurses:KEY_DOWN*	#o402) ;; down-arrow key
(define *ncurses:KEY_UP*	#o403) ;; up-arrow key
(define *ncurses:KEY_LEFT*	#o404) ;; left-arrow key
(define *ncurses:KEY_RIGHT*	#o405) ;; right-arrow key
(define *ncurses:KEY_HOME*	#o406) ;; home key
(define *ncurses:KEY_BACKSPACE*	#o407) ;; backspace key
(define *ncurses:KEY_F0*	#o410) ;; Function keys.  Space for 64
(define *ncurses:KEY_DL*	#o510) ;; delete-line key
(define *ncurses:KEY_IL*	#o511) ;; insert-line key
(define *ncurses:KEY_DC*	#o512) ;; delete-character key
(define *ncurses:KEY_IC*	#o513) ;; insert-character key
(define *ncurses:KEY_EIC*	#o514) ;; sent by rmir or smir in insert mode
(define *ncurses:KEY_CLEAR*	#o515) ;; clear-screen or erase key
(define *ncurses:KEY_EOS*	#o516) ;; clear-to-end-of-screen key
(define *ncurses:KEY_EOL*	#o517) ;; clear-to-end-of-line key
(define *ncurses:KEY_SF*	#o520) ;; scroll-forward key
(define *ncurses:KEY_SR*	#o521) ;; scroll-backward key
(define *ncurses:KEY_NPAGE*	#o522) ;; next-page key
(define *ncurses:KEY_PPAGE*	#o523) ;; previous-page key
(define *ncurses:KEY_STAB*	#o524) ;; set-tab key
(define *ncurses:KEY_CTAB*	#o525) ;; clear-tab key
(define *ncurses:KEY_CATAB*	#o526) ;; clear-all-tabs key
(define *ncurses:KEY_ENTER*	#o527) ;; enter/send key
(define *ncurses:KEY_PRINT*	#o532) ;; print key
(define *ncurses:KEY_LL*	#o533) ;; lower-left key (home down)
(define *ncurses:KEY_A1*	#o534) ;; upper left of keypad
(define *ncurses:KEY_A3*	#o535) ;; upper right of keypad
(define *ncurses:KEY_B2*	#o536) ;; center of keypad
(define *ncurses:KEY_C1*	#o537) ;; lower left of keypad
(define *ncurses:KEY_C3*	#o540) ;; lower right of keypad
(define *ncurses:KEY_BTAB*	#o541) ;; back-tab key
(define *ncurses:KEY_BEG*	#o542) ;; begin key
(define *ncurses:KEY_CANCEL*	#o543) ;; cancel key
(define *ncurses:KEY_CLOSE*	#o544) ;; close key
(define *ncurses:KEY_COMMAND*	#o545) ;; command key
(define *ncurses:KEY_COPY*	#o546) ;; copy key
(define *ncurses:KEY_CREATE*	#o547) ;; create key
(define *ncurses:KEY_END*	#o550) ;; end key
(define *ncurses:KEY_EXIT*	#o551) ;; exit key
(define *ncurses:KEY_FIND*	#o552) ;; find key
(define *ncurses:KEY_HELP*	#o553) ;; help key
(define *ncurses:KEY_MARK*	#o554) ;; mark key
(define *ncurses:KEY_MESSAGE*	#o555) ;; message key
(define *ncurses:KEY_MOVE*	#o556) ;; move key
(define *ncurses:KEY_NEXT*	#o557) ;; next key
(define *ncurses:KEY_OPEN*	#o560) ;; open key
(define *ncurses:KEY_OPTIONS*	#o561) ;; options key
(define *ncurses:KEY_PREVIOUS*	#o562) ;; previous key
(define *ncurses:KEY_REDO*	#o563) ;; redo key
(define *ncurses:KEY_REFERENCE*	#o564) ;; reference key
(define *ncurses:KEY_REFRESH*	#o565) ;; refresh key
(define *ncurses:KEY_REPLACE*	#o566) ;; replace key
(define *ncurses:KEY_RESTART*	#o567) ;; restart key
(define *ncurses:KEY_RESUME*	#o570) ;; resume key
(define *ncurses:KEY_SAVE*	#o571) ;; save key
(define *ncurses:KEY_SBEG*	#o572) ;; shifted begin key
(define *ncurses:KEY_SCANCEL*	#o573) ;; shifted cancel key
(define *ncurses:KEY_SCOMMAND*	#o574) ;; shifted command key
(define *ncurses:KEY_SCOPY*	#o575) ;; shifted copy key
(define *ncurses:KEY_SCREATE*	#o576) ;; shifted create key
(define *ncurses:KEY_SDC*	#o577) ;; shifted delete-character key
(define *ncurses:KEY_SDL*	#o600) ;; shifted delete-line key
(define *ncurses:KEY_SELECT*	#o601) ;; select key
(define *ncurses:KEY_SEND*	#o602) ;; shifted end key
(define *ncurses:KEY_SEOL*	#o603) ;; shifted clear-to-end-of-line key
(define *ncurses:KEY_SEXIT*	#o604) ;; shifted exit key
(define *ncurses:KEY_SFIND*	#o605) ;; shifted find key
(define *ncurses:KEY_SHELP*	#o606) ;; shifted help key
(define *ncurses:KEY_SHOME*	#o607) ;; shifted home key
(define *ncurses:KEY_SIC*	#o610) ;; shifted insert-character key
(define *ncurses:KEY_SLEFT*	#o611) ;; shifted left-arrow key
(define *ncurses:KEY_SMESSAGE*	#o612) ;; shifted message key
(define *ncurses:KEY_SMOVE*	#o613) ;; shifted move key
(define *ncurses:KEY_SNEXT*	#o614) ;; shifted next key
(define *ncurses:KEY_SOPTIONS*	#o615) ;; shifted options key
(define *ncurses:KEY_SPREVIOUS*	#o616) ;; shifted previous key
(define *ncurses:KEY_SPRINT*	#o617) ;; shifted print key
(define *ncurses:KEY_SREDO*	#o620) ;; shifted redo key
(define *ncurses:KEY_SREPLACE*	#o621) ;; shifted replace key
(define *ncurses:KEY_SRIGHT*	#o622) ;; shifted right-arrow key
(define *ncurses:KEY_SRSUME*	#o623) ;; shifted resume key
(define *ncurses:KEY_SSAVE*	#o624) ;; shifted save key
(define *ncurses:KEY_SSUSPEND*	#o625) ;; shifted suspend key
(define *ncurses:KEY_SUNDO*	#o626) ;; shifted undo key
(define *ncurses:KEY_SUSPEND*	#o627) ;; suspend key
(define *ncurses:KEY_UNDO*	#o630) ;; undo key
(define *ncurses:KEY_MOUSE*	#o631) ;; Mouse event has occurred
(define *ncurses:KEY_RESIZE*	#o632) ;; Terminal resize event
(define *ncurses:KEY_MAX*	#o777) ;; Maximum key value is 0632

)
