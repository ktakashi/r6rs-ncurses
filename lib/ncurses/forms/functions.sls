;;; -*- mode:scheme; coding: utf-8; -*-
;;;
;;; ncurses/forms/functions.sls - Form library binding (functions)
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
(library (ncurses forms functions)
    (export *forms:native-library*
	    init-forms-binding

	    *forms:TYPE_ALPHA*
	    *forms:TYPE_ALNUM*
	    *forms:TYPE_ENUM*
	    *forms:TYPE_INTEGER*
	    *forms:TYPE_NUMERIC*
	    *forms:TYPE_REGEXP*
	    *forms:TYPE_IPV4*

	    forms:new_fieldtype
	    forms:link_fieldtype
	    forms:free_fieldtype
	    forms:set_fieldtype_arg
	    forms:set_fieldtype_choice

	    forms:new_field
	    forms:dup_field
	    forms:link_field
	    forms:free_field
	    forms:field_info
	    forms:dynamic_field_info
	    forms:set_max_field
	    forms:move_field
	    forms:set_field_type
	    forms:set_new_page
	    forms:set_field_just
	    forms:field_just
	    forms:set_field_fore
	    forms:set_field_back
	    forms:set_field_pad
	    forms:field_pad
	    forms:set_field_buffer
	    forms:set_field_status
	    forms:set_field_userptr
	    forms:set_field_opts
	    forms:field_opts_on
	    forms:field_opts_off
	    forms:field_fore
	    forms:field_back
	    forms:new_page
	    forms:field_status
	    forms:field_arg
	    forms:field_userptr
	    forms:field_type
	    forms:field_buffer
	    forms:field_opts

	    (rename (%forms:new_form forms:new_form)
		    (%forms:form_fields forms:form_fields))
	    forms:current_field
	    forms:form_win
	    forms:form_sub
	    forms:form_init
	    forms:form_term
	    forms:field_init
	    forms:field_term
	    forms:free_form
	    (rename (%forms:set_form_fields forms:set_form_fields))
	    forms:field_count
	    forms:set_form_win
	    forms:set_form_sub
	    forms:set_current_field
	    ;; forms:unfocus_current_field
	    forms:field_index
	    forms:set_form_page
	    forms:form_page
	    forms:scale_form
	    forms:set_form_init
	    forms:set_form_term
	    forms:set_field_init
	    forms:set_field_term
	    forms:post_form
	    forms:unpost_form
	    forms:pos_form_cursor
	    forms:form_driver
	    forms:set_form_userptr
	    forms:set_form_opts
	    forms:form_opts_on
	    forms:form_opts_off
	    forms:form_request_by_name
	    forms:form_request_name
	    forms:form_userptr
	    forms:form_opts
	    forms:data_ahead
	    forms:data_behind)
    (import (rnrs)
	    (pffi)
	    (ncurses runtime)
	    (ncurses curses))
(define-foreign-struct FIELD)
(define-foreign-struct FORM)
(define-foreign-struct FIELDTYPE)

(define-type-alias FIELD* (* FIELD))
(define-type-alias FIELD** (* FIELD*))
(define-type-alias FORM* (* FORM))
(define-type-alias FIELDTYPE* (* FIELDTYPE))
(define-type-alias Form_Options int)
(define-type-alias Field_Options int)
(define-type-alias Form_Hook (callback void (FORM*)))

(define *forms:native-library* (load-native-library "form"))
(define (init-forms-binding) *forms:native-library*)

(define-syntax define-variable
  (lambda (x)
    (define (->name k name)
      (datum->syntax k
       (string->symbol
	(string-append "*forms:" (symbol->string (syntax->datum name)) "*"))))
    (syntax-case x ()
      ((k type name)
       (with-syntax ((binding-name (->name #'k #'name)))
	 #'(define-foreign-variable *forms:native-library*
	     type name binding-name))))))

;; standard field types
(define-variable FIELDTYPE* TYPE_ALPHA)
(define-variable FIELDTYPE* TYPE_ALNUM)
(define-variable FIELDTYPE* TYPE_ENUM)
(define-variable FIELDTYPE* TYPE_INTEGER)
(define-variable FIELDTYPE* TYPE_NUMERIC)
(define-variable FIELDTYPE* TYPE_REGEXP)

;; built-in additional field types
;; They are not defined in SVr4
(define-variable FIELDTYPE* TYPE_IPV4) ; Internet IP Version 4 address

(define-syntax define-binding
  (lambda (x)
    (define (->name k name)
      (datum->syntax k
       (string->symbol
	(string-append "forms:" (symbol->string (syntax->datum name))))))
    (syntax-case x ()
      ((k (ret) name (args ...))
       (with-syntax ((binding-name (->name #'k #'name)))
	 #'(define binding-name
	     (foreign-procedure *forms:native-library* ret name (args ...))))))))

;; FIELDTYPE routines
(define-binding (FIELDTYPE*) new_fieldtype
  ((callback bool (FIELD* void*)) (callback bool (int void*))))
(define-binding (FIELDTYPE*) link_fieldtype (FIELDTYPE*  FIELDTYPE*))
(define-binding (int) free_fieldtype (FIELDTYPE*))
(define-binding (int) set_fieldtype_arg
  (FIELDTYPE* (callback void* (va_list*)) (callback void* (void*))
	      (callback void (void*))))
(define-binding (int) set_fieldtype_choice
  (FIELDTYPE* (callback bool(FIELD* void*)) (callback bool(FIELD* void*))))

;;  FIELD routines
(define-binding (FIELD*)	new_field (int int int int int int))
(define-binding (FIELD*)	dup_field (FIELD* int int))
(define-binding (FIELD*)	link_field (FIELD* int int))

(define-binding (int)	free_field (FIELD*))
(define-binding (int)	field_info (FIELD* int* int* int* int* int* int*))
(define-binding (int)	dynamic_field_info (FIELD* int* int* int*))
(define-binding (int)	set_max_field ( FIELD* int))
(define-binding (int)	move_field (FIELD* int int))
(define-binding (int)	set_field_type (FIELD* FIELDTYPE* ___))
(define-binding (int)	set_new_page (FIELD* bool))
(define-binding (int)	set_field_just (FIELD* int))
(define-binding (int)	field_just (FIELD*))
(define-binding (int)	set_field_fore (FIELD* chtype))
(define-binding (int)	set_field_back (FIELD* chtype))
(define-binding (int)	set_field_pad (FIELD* int))
(define-binding (int)	field_pad (FIELD*))
(define-binding (int)	set_field_buffer (FIELD* int char*))
(define-binding (int)	set_field_status (FIELD* bool))
(define-binding (int)	set_field_userptr (FIELD* void*))
(define-binding (int)	set_field_opts (FIELD* Field_Options))
(define-binding (int)	field_opts_on (FIELD* Field_Options))
(define-binding (int)	field_opts_off (FIELD* Field_Options))

(define-binding (chtype)	field_fore (FIELD*))
(define-binding (chtype)	field_back (FIELD*))

(define-binding (bool)	new_page (FIELD*))
(define-binding (bool)	field_status (FIELD*))

(define-binding (void*)	field_arg (FIELD*))

(define-binding (void*)	field_userptr (FIELD*))

(define-binding (FIELDTYPE*)	field_type (FIELD*))

(define-binding (char*)	field_buffer (FIELD* int))

(define-binding (Field_Options)	field_opts (FIELD*))

;; FORM routines
(define-binding (FORM*)	new_form (FIELD**))

(define (%forms:new_form fields)
  (check-pointer-array 'forms:new_form fields)
  (forms:new_form (vector->pointer-array fields)))

(define-binding (FIELD**)	form_fields (FORM*))

(define (%forms:form_fields form)
  (pointer-array->vector (forms:form_fields form) null-pointer?))

(define-binding (FIELD*)	current_field (FORM*))

(define-binding (WINDOW*)	form_win (FORM*))
(define-binding (WINDOW*)	form_sub (FORM*))

(define-binding (Form_Hook)	form_init (FORM*))
(define-binding (Form_Hook)	form_term (FORM*))
(define-binding (Form_Hook)	field_init (FORM*))
(define-binding (Form_Hook)	field_term (FORM*))

(define-binding (int)	free_form (FORM*))
(define-binding (int)	set_form_fields (FORM* FIELD**))

(define (%forms:set_form_fields form fields)
  (check-pointer-array 'forms:set_form_fields fields)
  (forms:set_form_fields form (vector->pointer-array fields)))

(define-binding (int)	field_count (FORM*))
(define-binding (int)	set_form_win (FORM* WINDOW*))
(define-binding (int)	set_form_sub (FORM* WINDOW*))
(define-binding (int)	set_current_field (FORM* FIELD*))
;; seems doesn't exist... new API?
;;(define-binding (int)	unfocus_current_field (FORM*))
(define-binding (int)	field_index (FIELD*))
(define-binding (int)	set_form_page (FORM* int))
(define-binding (int)	form_page (FORM*))
(define-binding (int)	scale_form (FORM* int* int*))
(define-binding (int)	set_form_init (FORM* Form_Hook))
(define-binding (int)	set_form_term (FORM* Form_Hook))
(define-binding (int)	set_field_init (FORM* Form_Hook))
(define-binding (int)	set_field_term (FORM* Form_Hook))
(define-binding (int)	post_form (FORM*))
(define-binding (int)	unpost_form (FORM*))
(define-binding (int)	pos_form_cursor (FORM*))
(define-binding (int)	form_driver (FORM* int))
;; should we?
;; (define-binding (int)	form_driver_w (FORM* int wchar_t))

(define-binding (int)	set_form_userptr (FORM* void*))
(define-binding (int)	set_form_opts (FORM* Form_Options))
(define-binding (int)	form_opts_on (FORM* Form_Options))
(define-binding (int)	form_opts_off (FORM* Form_Options))
(define-binding (int)	form_request_by_name (char*))

(define-binding (char*)	form_request_name (int))

(define-binding (void*)	form_userptr (FORM*))

(define-binding (Form_Options)	form_opts (FORM*))

(define-binding (bool)	data_ahead (FORM*))
(define-binding (bool)	data_behind (FORM*))


)
