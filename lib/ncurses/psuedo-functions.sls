;;; -*- mode:scheme; coding: utf-8; -*-
;;;
;;; ncurses/bindings.sls
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
(library (ncurses psuedo-functions)
    (export ncurses:addch ncurses:addchnstr ncurses:addchstr ncurses:addnstr
	    ncurses:addstr
	    ncurses:attroff ncurses:attron ncurses:attrset
	    ncurses:attr_get ncurses:attr_off ncurses:attr_on ncurses:attr_set

	    ncurses:bkgd ncurses:bkgdset

	    ncurses:chgat ncurses:clear ncurses:color_set
	    ncurses:clrtobot ncurses:clrtoeol

	    ncurses:delch ncurses:deleteln

	    ncurses:echochar ncurses:erase

	    ncurses:getch ncurses:getstr

	    ncurses:inch ncurses:inchnstr ncurses:inchstr
	    ncurses:innstr ncurses:insch ncurses:insdelln
	    ncurses:insertln ncurses:insnstr ncurses:insstr ncurses:instr

	    ncurses:move

	    ncurses:refresh

	    ncurses:scrl ncurses:setscrreg ncurses:standout ncurses:standend

	    ncurses:timeout

	    ncurses:wdeleteln ncurses:winsertln

	    ncurses:getyx ncurses:getbegyx ncurses:getmaxyx ncurses:getparyx)
    (import (rnrs)
	    (ncurses bindings)
	    (ncurses variables))

(define (ncurses:addch ch) (ncurses:waddch *ncurses:stdscr* ch))
(define (ncurses:addchnstr str n) (ncurses:waddchnstr *ncurses:stdscr* str n))
(define (ncurses:addchstr str) (ncurses:waddchstr *ncurses:stdscr* str))
(define (ncurses:addnstr str n) (ncurses:waddnstr *ncurses:stdscr* str n))
(define (ncurses:addstr str) (ncurses:waddnstr *ncurses:stdscr* str -1))
(define (ncurses:attr_get ap cp o) (ncurses:wattr_get *ncurses:stdscr* ap cp o))
(define (ncurses:attr_off a o) (ncurses:wattr_off *ncurses:stdscr* a o))
(define (ncurses:attr_on a o) (ncurses:wattr_on *ncurses:stdscr* a o))
(define (ncurses:attr_set a c o) (ncurses:wattr_set *ncurses:stdscr* a c o))
(define (ncurses:attroff at) (ncurses:wattroff *ncurses:stdscr* at))
(define (ncurses:attron at) (ncurses:wattron *ncurses:stdscr* at))
(define (ncurses:attrset at) (ncurses:wattrset *ncurses:stdscr* at))
(define (ncurses:bkgd ch) (ncurses:wbkgd *ncurses:stdscr* ch))
(define (ncurses:bkgdset ch) (ncurses:wbkgdset *ncurses:stdscr* ch))
(define (ncurses:chgat n a c o) (ncurses:wchgat *ncurses:stdscr* n a c o))
(define (ncurses:clear) (ncurses:wclear *ncurses:stdscr*))
(define (ncurses:clrtobot) (ncurses:wclrtobot *ncurses:stdscr*))
(define (ncurses:clrtoeol) (ncurses:wclrtoeol *ncurses:stdscr*))
(define (ncurses:color_set c o) (ncurses:wcolor_set *ncurses:stdscr* c o))
(define (ncurses:delch) (ncurses:wdelch *ncurses:stdscr*))
(define (ncurses:deleteln) (ncurses:winsdelln *ncurses:stdscr* -1))
(define (ncurses:echochar c) (ncurses:wechochar *ncurses:stdscr* c))
(define (ncurses:erase) (ncurses:werase *ncurses:stdscr*))
(define (ncurses:getch) (ncurses:wgetch *ncurses:stdscr*))
(define (ncurses:getstr str) (ncurses:wgetstr *ncurses:stdscr* str))
(define (ncurses:inch) (ncurses:winch *ncurses:stdscr*))
(define (ncurses:inchnstr s n) (ncurses:winchnstr *ncurses:stdscr* s n))
(define (ncurses:inchstr s) (ncurses:winchstr *ncurses:stdscr* s))
(define (ncurses:innstr s n) (ncurses:winnstr *ncurses:stdscr* s n))
(define (ncurses:insch c) (ncurses:winsch *ncurses:stdscr* c))
(define (ncurses:insdelln n) (ncurses:winsdelln *ncurses:stdscr* n))
(define (ncurses:insertln) (ncurses:winsdelln *ncurses:stdscr* 1))
(define (ncurses:insnstr s n) (ncurses:winsnstr *ncurses:stdscr* s n))
(define (ncurses:insstr s) (ncurses:winsstr *ncurses:stdscr* s))
(define (ncurses:instr s) (ncurses:winstr *ncurses:stdscr* s))
(define (ncurses:move x y) (ncurses:wmove *ncurses:stdscr* x y))
(define (ncurses:refresh ) (ncurses:wrefresh *ncurses:stdscr*))
(define (ncurses:scrl n) (ncurses:wscrl *ncurses:stdscr* n))
(define (ncurses:setscrreg t b) (ncurses:wsetscrreg *ncurses:stdscr* t b))
(define (ncurses:standout) (ncurses:wstandout *ncurses:stdscr*))
(define (ncurses:standend) (ncurses:wstandend *ncurses:stdscr*))
(define (ncurses:timeout delay) (ncurses:wtimeout *ncurses:stdscr* delay))
(define (ncurses:wdeleteln win) (ncurses:winsdelln win -1))
(define (ncurses:winsertln win) (ncurses:winsdelln win 1))

(define (ncurses:getyx win) (values (ncurses:getcury win) (ncurses:getcurx win)))
(define (ncurses:getbegyx win)
  (values (ncurses:getbegy win) (ncurses:getbegx win)))
(define (ncurses:getmaxyx win)
  (values (ncurses:getmaxy *ncurses:stdscr*)
	  (ncurses:getmaxx *ncurses:stdscr*)))
(define (ncurses:getparyx win)
  (values (ncurses:getpary *ncurses:stdscr*)
	  (ncurses:getparx *ncurses:stdscr*)))

)
