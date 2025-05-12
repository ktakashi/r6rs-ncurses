;;; -*- mode:scheme; coding: utf-8; -*-
;;;
;;; ncurses/menus.sls - Menu library binding
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
(library (ncurses menus)
    (export init-menus-binding *menus:native-library*
	    *menus:O_ONEVALUE*
	    *menus:O_SHOWDESC*
	    *menus:O_ROWMAJOR*
	    *menus:O_IGNORECASE*
	    *menus:O_SHOWMATCH*
	    *menus:O_NONCYCLIC*
	    *menus:O_MOUSE_MENU*

	    *menus:O_SELECTABLE*

	    *menus:REQ_LEFT_ITEM*
	    *menus:REQ_RIGHT_ITEM*
	    *menus:REQ_UP_ITEM*
	    *menus:REQ_DOWN_ITEM*
	    *menus:REQ_SCR_ULINE*
	    *menus:REQ_SCR_DLINE*
	    *menus:REQ_SCR_DPAGE*
	    *menus:REQ_SCR_UPAGE*
	    *menus:REQ_FIRST_ITEM*
	    *menus:REQ_LAST_ITEM*
	    *menus:REQ_NEXT_ITEM*
	    *menus:REQ_PREV_ITEM*
	    *menus:REQ_TOGGLE_ITEM*
	    *menus:REQ_CLEAR_PATTERN*
	    *menus:REQ_BACK_PATTERN*
	    *menus:REQ_NEXT_MATCH*
	    *menus:REQ_PREV_MATCH*

	    *menus:MIN_MENU_COMMAND*
	    *menus:MAX_MENU_COMMAND*

	    (rename (%menus:menu_items menus:menu_items))
	    menus:current_item
	    menus:new_item

	    (rename (%menus:new_menu menus:new_menu))

	    menus:item_opts
	    menus:menu_opts

	    menus:item_init
	    menus:item_term
	    menus:menu_init
	    menus:menu_term

	    menus:menu_sub
	    menus:menu_win

	    menus:item_description
	    menus:item_name
	    menus:menu_mark
	    menus:menu_request_name

	    menus:menu_pattern

	    menus:menu_userptr
	    menus:item_userptr

	    menus:menu_back
	    menus:menu_fore
	    menus:menu_grey

	    menus:free_item
	    menus:free_menu
	    menus:item_count
	    menus:item_index
	    menus:item_opts_off
	    menus:item_opts_on
	    menus:menu_driver
	    menus:menu_opts_off
	    menus:menu_opts_on
	    menus:menu_pad
	    menus:pos_menu_cursor
	    menus:post_menu
	    menus:scale_menu
	    menus:set_current_item
	    menus:set_item_init
	    menus:set_item_opts
	    menus:set_item_term
	    menus:set_item_userptr
	    menus:set_item_value
	    menus:set_menu_back
	    menus:set_menu_fore
	    menus:set_menu_format
	    menus:set_menu_grey
	    menus:set_menu_init
	    (rename (%menus:set_menu_items menus:set_menu_items))
	    menus:set_menu_mark
	    menus:set_menu_opts
	    menus:set_menu_pad
	    menus:set_menu_pattern
	    menus:set_menu_sub
	    menus:set_menu_term
	    menus:set_menu_userptr
	    menus:set_menu_win
	    menus:set_top_row
	    menus:top_row
	    menus:unpost_menu
	    menus:menu_request_by_name
	    menus:set_menu_spacing
	    menus:menu_spacing

	    menus:item_value
	    menus:item_visible

	    menus:menu_format
	    )
    (import (rnrs)
	    (pffi)
	    (ncurses runtime)
	    (ncurses curses))
(define-foreign-struct MENU)
(define-foreign-struct ITEM)

(define-type-alias MENU* (* MENU))
(define-type-alias ITEM* (* ITEM))
(define-type-alias ITEM** (* ITEM*))
(define-type-alias Menu_Options int)
(define-type-alias Item_Options int)
(define-type-alias Menu_Hook (callback void (MENU*)))

(define *menus:native-library* (load-native-library "menu"))
(define (init-menus-binding) *menus:native-library*)

(define-syntax menus-procedure
  (syntax-rules ()
    ((k ret name (args ...))
     (foreign-procedure *menus:native-library* ret name (args ...)))))

(define-syntax define-binding
  (lambda (x)
    (define (->name k name)
      (datum->syntax k
       (string->symbol
	(string-append "menus:" (symbol->string (syntax->datum name))))))
    (syntax-case x ()
      ((k (ret) name (args ...))
       (with-syntax ((binding-name (->name #'k #'name)))
	 #'(define binding-name (menus-procedure ret name (args ...))))))))

(define *menus:O_ONEVALUE*	#x01)
(define *menus:O_SHOWDESC*	#x02)
(define *menus:O_ROWMAJOR*	#x04)
(define *menus:O_IGNORECASE*	#x08)
(define *menus:O_SHOWMATCH*	#x10)
(define *menus:O_NONCYCLIC*	#x20)
(define *menus:O_MOUSE_MENU*	#x40)

;; Item options
(define *menus:O_SELECTABLE*	#x01)

(define *menus:REQ_LEFT_ITEM*		(+ *ncurses:KEY_MAX* 1))
(define *menus:REQ_RIGHT_ITEM*		(+ *ncurses:KEY_MAX* 2))
(define *menus:REQ_UP_ITEM*		(+ *ncurses:KEY_MAX* 3))
(define *menus:REQ_DOWN_ITEM*		(+ *ncurses:KEY_MAX* 4))
(define *menus:REQ_SCR_ULINE*		(+ *ncurses:KEY_MAX* 5))
(define *menus:REQ_SCR_DLINE*		(+ *ncurses:KEY_MAX* 6))
(define *menus:REQ_SCR_DPAGE*		(+ *ncurses:KEY_MAX* 7))
(define *menus:REQ_SCR_UPAGE*		(+ *ncurses:KEY_MAX* 8))
(define *menus:REQ_FIRST_ITEM*		(+ *ncurses:KEY_MAX* 9))
(define *menus:REQ_LAST_ITEM*		(+ *ncurses:KEY_MAX* 10))
(define *menus:REQ_NEXT_ITEM*		(+ *ncurses:KEY_MAX* 11))
(define *menus:REQ_PREV_ITEM*		(+ *ncurses:KEY_MAX* 12))
(define *menus:REQ_TOGGLE_ITEM*		(+ *ncurses:KEY_MAX* 13))
(define *menus:REQ_CLEAR_PATTERN*	(+ *ncurses:KEY_MAX* 14))
(define *menus:REQ_BACK_PATTERN*	(+ *ncurses:KEY_MAX* 15))
(define *menus:REQ_NEXT_MATCH*		(+ *ncurses:KEY_MAX* 16))
(define *menus:REQ_PREV_MATCH*		(+ *ncurses:KEY_MAX* 17))

(define *menus:MIN_MENU_COMMAND*	(+ *ncurses:KEY_MAX* 1))
(define *menus:MAX_MENU_COMMAND*	(+ *ncurses:KEY_MAX* 17))

(define *menus:MAX_COMMAND*		(+ *ncurses:KEY_MAX* 128))

(define-binding (ITEM**) menu_items(MENU*))
(define-binding (ITEM*) current_item(MENU*))
(define-binding (ITEM*) new_item(char* char*))

(define-binding (MENU*) new_menu(ITEM**))

(define-binding (Item_Options) item_opts(ITEM*))
(define-binding (Menu_Options) menu_opts(MENU*))

(define-binding (Menu_Hook) item_init(MENU*))
(define-binding (Menu_Hook) item_term(MENU*))
(define-binding (Menu_Hook) menu_init(MENU*))
(define-binding (Menu_Hook) menu_term(MENU*))

(define-binding (WINDOW*) menu_sub(MENU*))
(define-binding (WINDOW*) menu_win(MENU*))

(define-binding (char*) item_description(ITEM*))
(define-binding (char*) item_name(ITEM*))
(define-binding (char*) menu_mark(MENU*))
(define-binding (char*) menu_request_name(int))

(define-binding (char*) menu_pattern(MENU*))

(define-binding (void*) menu_userptr(MENU*))
(define-binding (void*) item_userptr(ITEM*))

(define-binding (chtype) menu_back(MENU*))
(define-binding (chtype) menu_fore(MENU*))
(define-binding (chtype) menu_grey(MENU*))

(define-binding (int) free_item(ITEM*))
(define-binding (int) free_menu(MENU*))
(define-binding (int) item_count(MENU*))
(define-binding (int) item_index(ITEM*))
(define-binding (int) item_opts_off(ITEM* Item_Options))
(define-binding (int) item_opts_on(ITEM* Item_Options))
(define-binding (int) menu_driver(MENU* int))
(define-binding (int) menu_opts_off(MENU* Menu_Options))
(define-binding (int) menu_opts_on(MENU* Menu_Options))
(define-binding (int) menu_pad(MENU*))
(define-binding (int) pos_menu_cursor(MENU*))
(define-binding (int) post_menu(MENU*))
(define-binding (int) scale_menu(MENU* int* int*))
(define-binding (int) set_current_item(MENU* ITEM*))
(define-binding (int) set_item_init(MENU* Menu_Hook))
(define-binding (int) set_item_opts(ITEM* Item_Options))
(define-binding (int) set_item_term(MENU* Menu_Hook))
(define-binding (int) set_item_userptr(ITEM* void*))
(define-binding (int) set_item_value(ITEM* bool))
(define-binding (int) set_menu_back(MENU* chtype))
(define-binding (int) set_menu_fore(MENU* chtype))
(define-binding (int) set_menu_format(MENU* int int))
(define-binding (int) set_menu_grey(MENU* chtype))
(define-binding (int) set_menu_init(MENU* Menu_Hook))
(define-binding (int) set_menu_items(MENU* ITEM**))
(define-binding (int) set_menu_mark(MENU* char*))
(define-binding (int) set_menu_opts(MENU* Menu_Options))
(define-binding (int) set_menu_pad(MENU* int))
(define-binding (int) set_menu_pattern(MENU* char*))
(define-binding (int) set_menu_sub(MENU* WINDOW*))
(define-binding (int) set_menu_term(MENU* Menu_Hook))
(define-binding (int) set_menu_userptr(MENU* void*))
(define-binding (int) set_menu_win(MENU* WINDOW*))
(define-binding (int) set_top_row(MENU* int))
(define-binding (int) top_row(MENU*))
(define-binding (int) unpost_menu(MENU*))
(define-binding (int) menu_request_by_name(char*))
(define-binding (int) set_menu_spacing(MENU* int int int))
(define-binding (int) menu_spacing(MENU* int* int* int*))

(define-binding (bool) item_value(ITEM*))
(define-binding (bool) item_visible(ITEM*))

(define-binding (void) menu_format(MENU* int* int*))

(define (%menus:new_menu items)
  (check-pointer-array 'menus:new_menu items)
  (menus:new_menu (vector->pointer-array items)))

(define (%menus:menu_items menu)
  (pointer-array->vector (menus:menu_items menu) null-pointer?))

(define (%menus:set_menu_items menu items)
  (check-pointer-array 'menus:set_menu_items items)
  (menus:set_menu_items menu (vector->pointer-array items)))
  
)
