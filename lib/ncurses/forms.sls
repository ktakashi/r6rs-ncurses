;;; -*- mode:scheme; coding: utf-8; -*-
;;;
;;; ncurses/forms.sls - Form library binding
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
(library (ncurses forms)
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
	    *forms:MAX_COMMAND*

	    *forms:native-library*
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

	    forms:new_form
	    forms:form_fields
	    forms:current_field
	    forms:form_win
	    forms:form_sub
	    forms:form_init
	    forms:form_term
	    forms:field_init
	    forms:field_term
	    forms:free_form
	    forms:set_form_fields
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
    (import (ncurses forms constants)
	    (ncurses forms functions)))
