;;; -*- mode:scheme; coding: utf-8; -*-
;;;
;;; ncurses/forms/constants.sls - Form library binding (constants)
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
(library (ncurses forms constants)
    (export *forms:NO_JUSTIFICATION*
	    *forms:JUSTIFY_LEFT*
	    *forms:JUSTIFY_CENTER*
	    *forms:JUSTIFY_RIGHT*

	    *forms:O_VISIBLE*
	    *forms:O_ACTIVE*
	    *forms:O_PUBLIC*
	    *forms:O_EDIT*
	    *forms:O_WRAP*
	    *forms:O_BLANK*
	    *forms:O_AUTOSKIP*
	    *forms:O_NULLOK*
	    *forms:O_PASSOK*
	    *forms:O_STATIC*
	    *forms:O_DYNAMIC_JUSTIFY*
	    *forms:O_NO_LEFT_STRIP*
	    *forms:O_EDGE_INSERT_STAY*
	    *forms:O_INPUT_LIMIT*

	    *forms:O_NL_OVERLOAD*
	    *forms:O_BS_OVERLOAD*

	    *forms:REQ_NEXT_PAGE*	
	    *forms:REQ_PREV_PAGE*	
	    *forms:REQ_FIRST_PAGE*	
	    *forms:REQ_LAST_PAGE*	
            
	    *forms:REQ_NEXT_FIELD*	
	    *forms:REQ_PREV_FIELD*	
	    *forms:REQ_FIRST_FIELD*	
	    *forms:REQ_LAST_FIELD*	
	    *forms:REQ_SNEXT_FIELD*	
	    *forms:REQ_SPREV_FIELD*	
	    *forms:REQ_SFIRST_FIELD*
	    *forms:REQ_SLAST_FIELD*	
	    *forms:REQ_LEFT_FIELD*	
	    *forms:REQ_RIGHT_FIELD*	
	    *forms:REQ_UP_FIELD*	
	    *forms:REQ_DOWN_FIELD*	
            
	    *forms:REQ_NEXT_CHAR*	
	    *forms:REQ_PREV_CHAR*	
	    *forms:REQ_NEXT_LINE*	
	    *forms:REQ_PREV_LINE*	
	    *forms:REQ_NEXT_WORD*	
	    *forms:REQ_PREV_WORD*	
	    *forms:REQ_BEG_FIELD*	
	    *forms:REQ_END_FIELD*	
	    *forms:REQ_BEG_LINE*	
	    *forms:REQ_END_LINE*	
	    *forms:REQ_LEFT_CHAR*	
	    *forms:REQ_RIGHT_CHAR*	
	    *forms:REQ_UP_CHAR*	
	    *forms:REQ_DOWN_CHAR*	
            
	    *forms:REQ_NEW_LINE*	
	    *forms:REQ_INS_CHAR*	
	    *forms:REQ_INS_LINE*	
	    *forms:REQ_DEL_CHAR*	
	    *forms:REQ_DEL_PREV*	
	    *forms:REQ_DEL_LINE*	
	    *forms:REQ_DEL_WORD*	
	    *forms:REQ_CLR_EOL*	
	    *forms:REQ_CLR_EOF*	
	    *forms:REQ_CLR_FIELD*	
	    *forms:REQ_OVL_MODE*	
	    *forms:REQ_INS_MODE*	
	    *forms:REQ_SCR_FLINE*	
	    *forms:REQ_SCR_BLINE*	
	    *forms:REQ_SCR_FPAGE*	
	    *forms:REQ_SCR_BPAGE*	
	    *forms:REQ_SCR_FHPAGE*	
	    *forms:REQ_SCR_BHPAGE*	
	    *forms:REQ_SCR_FCHAR*	
	    *forms:REQ_SCR_BCHAR*	
	    *forms:REQ_SCR_HFLINE*	
	    *forms:REQ_SCR_HBLINE*	
	    *forms:REQ_SCR_HFHALF*	
	    *forms:REQ_SCR_HBHALF*	
            
	    *forms:REQ_VALIDATION*	
	    *forms:REQ_NEXT_CHOICE*	
	    *forms:REQ_PREV_CHOICE*	
            
	    *forms:MIN_FORM_COMMAND*
	    *forms:MAX_FORM_COMMAND*
	    *forms:MAX_COMMAND*)
    (import (rnrs)
	    (rename (ncurses curses) (*ncurses:KEY_MAX* KEY_MAX)))
;; field justification
(define *forms:NO_JUSTIFICATION*	0)
(define *forms:JUSTIFY_LEFT*		1)
(define *forms:JUSTIFY_CENTER*		2)
(define *forms:JUSTIFY_RIGHT*		3)

;; field options
(define *forms:O_VISIBLE*		#x0001)
(define *forms:O_ACTIVE*		#x0002)
(define *forms:O_PUBLIC*		#x0004)
(define *forms:O_EDIT*			#x0008)
(define *forms:O_WRAP*			#x0010)
(define *forms:O_BLANK*			#x0020)
(define *forms:O_AUTOSKIP*		#x0040)
(define *forms:O_NULLOK*		#x0080)
(define *forms:O_PASSOK*		#x0100)
(define *forms:O_STATIC*		#x0200)
(define *forms:O_DYNAMIC_JUSTIFY*	#x0400) ;; ncurses extension
(define *forms:O_NO_LEFT_STRIP*		#x0800) ;; ncurses extension
(define *forms:O_EDGE_INSERT_STAY*	#x1000) ;; ncurses extension
(define *forms:O_INPUT_LIMIT*		#x2000) ;; ncurses extension

;; form options
(define *forms:O_NL_OVERLOAD*	#x0001)
(define *forms:O_BS_OVERLOAD*	#x0002)

;; form driver commands
(define *forms:REQ_NEXT_PAGE*	(+ KEY_MAX 1)) ;; move to next page
(define *forms:REQ_PREV_PAGE*	(+ KEY_MAX 2)) ;; move to previous page
(define *forms:REQ_FIRST_PAGE*	(+ KEY_MAX 3)) ;; move to first page
(define *forms:REQ_LAST_PAGE*	(+ KEY_MAX 4)) ;; move to last page

(define *forms:REQ_NEXT_FIELD*	(+ KEY_MAX 5)) ;; move to next field
(define *forms:REQ_PREV_FIELD*	(+ KEY_MAX 6)) ;; move to previous field
(define *forms:REQ_FIRST_FIELD*	(+ KEY_MAX 7)) ;; move to first field
(define *forms:REQ_LAST_FIELD*	(+ KEY_MAX 8)) ;; move to last field
(define *forms:REQ_SNEXT_FIELD*	(+ KEY_MAX 9)) ;; move to sorted next field
(define *forms:REQ_SPREV_FIELD*	(+ KEY_MAX 10)) ;; move to sorted prev field
(define *forms:REQ_SFIRST_FIELD* (+ KEY_MAX 11)) ;; move to sorted first field
(define *forms:REQ_SLAST_FIELD*	(+ KEY_MAX 12)) ;; move to sorted last field
(define *forms:REQ_LEFT_FIELD*	(+ KEY_MAX 13)) ;; move to left to field
(define *forms:REQ_RIGHT_FIELD*	(+ KEY_MAX 14)) ;; move to right to field
(define *forms:REQ_UP_FIELD*	(+ KEY_MAX 15)) ;; move to up to field
(define *forms:REQ_DOWN_FIELD*	(+ KEY_MAX 16)) ;; move to down to field

(define *forms:REQ_NEXT_CHAR*	(+ KEY_MAX 17)) ;; move to next char in field
(define *forms:REQ_PREV_CHAR*	(+ KEY_MAX 18)) ;; move to prev char in field
(define *forms:REQ_NEXT_LINE*	(+ KEY_MAX 19)) ;; move to next line in field
(define *forms:REQ_PREV_LINE*	(+ KEY_MAX 20)) ;; move to prev line in field
(define *forms:REQ_NEXT_WORD*	(+ KEY_MAX 21)) ;; move to next word in field
(define *forms:REQ_PREV_WORD*	(+ KEY_MAX 22)) ;; move to prev word in field
(define *forms:REQ_BEG_FIELD*	(+ KEY_MAX 23)) ;; move to first char in field
(define *forms:REQ_END_FIELD*	(+ KEY_MAX 24)) ;; move after last char in fld
(define *forms:REQ_BEG_LINE*	(+ KEY_MAX 25)) ;; move to beginning of line
(define *forms:REQ_END_LINE*	(+ KEY_MAX 26)) ;; move after last char in line
(define *forms:REQ_LEFT_CHAR*	(+ KEY_MAX 27)) ;; move left in field
(define *forms:REQ_RIGHT_CHAR*	(+ KEY_MAX 28)) ;; move right in field
(define *forms:REQ_UP_CHAR*	(+ KEY_MAX 29)) ;; move up in field
(define *forms:REQ_DOWN_CHAR*	(+ KEY_MAX 30)) ;; move down in field

(define *forms:REQ_NEW_LINE*	(+ KEY_MAX 31)) ;; insert/overlay new line
(define *forms:REQ_INS_CHAR*	(+ KEY_MAX 32)) ;; insert blank char at cursor
(define *forms:REQ_INS_LINE*	(+ KEY_MAX 33)) ;; insert blank line at cursor
(define *forms:REQ_DEL_CHAR*	(+ KEY_MAX 34)) ;; delete char at cursor
(define *forms:REQ_DEL_PREV*	(+ KEY_MAX 35)) ;; delete char before cursor
(define *forms:REQ_DEL_LINE*	(+ KEY_MAX 36)) ;; delete line at cursor
(define *forms:REQ_DEL_WORD*	(+ KEY_MAX 37)) ;; delete word at cursor
(define *forms:REQ_CLR_EOL*	(+ KEY_MAX 38)) ;; clear to end of line
(define *forms:REQ_CLR_EOF*	(+ KEY_MAX 39)) ;; clear to end of field
(define *forms:REQ_CLR_FIELD*	(+ KEY_MAX 40)) ;; clear entire field
(define *forms:REQ_OVL_MODE*	(+ KEY_MAX 41)) ;; begin overlay mode
(define *forms:REQ_INS_MODE*	(+ KEY_MAX 42)) ;; begin insert mode
(define *forms:REQ_SCR_FLINE*	(+ KEY_MAX 43)) ;; scroll field forward a line
(define *forms:REQ_SCR_BLINE*	(+ KEY_MAX 44)) ;; scroll field backward a line
(define *forms:REQ_SCR_FPAGE*	(+ KEY_MAX 45)) ;; scroll field forward a page
(define *forms:REQ_SCR_BPAGE*	(+ KEY_MAX 46)) ;; scroll field backward a page
(define *forms:REQ_SCR_FHPAGE*	(+ KEY_MAX 47)) ;; scroll field forward	half page
(define *forms:REQ_SCR_BHPAGE*	(+ KEY_MAX 48)) ;; scroll field backward half page
(define *forms:REQ_SCR_FCHAR*	(+ KEY_MAX 49)) ;; horizontal scroll char
(define *forms:REQ_SCR_BCHAR*	(+ KEY_MAX 50)) ;; horizontal scroll char
(define *forms:REQ_SCR_HFLINE*	(+ KEY_MAX 51)) ;; horizontal scroll line
(define *forms:REQ_SCR_HBLINE*	(+ KEY_MAX 52)) ;; horizontal scroll line
(define *forms:REQ_SCR_HFHALF*	(+ KEY_MAX 53)) ;; horizontal scroll half line
(define *forms:REQ_SCR_HBHALF*	(+ KEY_MAX 54)) ;; horizontal scroll half line

(define *forms:REQ_VALIDATION*	(+ KEY_MAX 55)) ;; validate field
(define *forms:REQ_NEXT_CHOICE*	(+ KEY_MAX 56)) ;; display next field choice
(define *forms:REQ_PREV_CHOICE*	(+ KEY_MAX 57)) ;; display prev field choice

(define *forms:MIN_FORM_COMMAND* (+ KEY_MAX 1)) ;; used by form_driver
(define *forms:MAX_FORM_COMMAND* (+ KEY_MAX 57)) ;; used by form_driver

(define *forms:MAX_COMMAND*	(+ KEY_MAX 128))

)
