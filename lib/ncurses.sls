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
(library (ncurses)
    (export init-ncurses-binding
	    ncurses:addch ncurses:addchnstr ncurses:addchstr ncurses:addnstr
	    ncurses:addstr
	    ncurses:attroff ncurses:attron ncurses:attrset
	    ncurses:attr_get ncurses:attr_off ncurses:attr_on ncurses:attr_set

	    ncurses:baudrate ncurses:beep  ncurses:bkgd ncurses:bkgdset
	    ncurses:border ncurses:box

	    ncurses:can_change_color ncurses:cbreak ncurses:chgat
	    ncurses:clear ncurses:clearok
	    ncurses:clrtobot ncurses:clrtoeol
	    ncurses:color_content ncurses:color_set
	    ncurses:COLOR_PAIR ncurses:copywin
	    ncurses:curs_set

	    ncurses:def_prog_mode ncurses:def_shell_mode
	    ncurses:delay_output ncurses:delch ncurses:delscreen ncurses:delwin
	    ncurses:deleteln ncurses:derwin ncurses:doupdate ncurses:dupwin

	    ncurses:echo ncurses:echochar ncurses:erase ncurses:endwin
	    ncurses:erasechar

	    ncurses:filter ncurses:flash ncurses:flushinp

	    ncurses:getbkgd ncurses:getch ncurses:getnstr ncurses:getstr
	    ncurses:getwin

	    ncurses:halfdelay ncurses:has_colors ncurses:has_ic ncurses:has_il
	    ncurses:hline

	    ncurses:idcok ncurses:idlok ncurses:immedok ncurses:inch
	    ncurses:inchnstr ncurses:inchstr ncurses:initscr ncurses:init_color
	    ncurses:init_pair ncurses:innstr ncurses:insch ncurses:insdelln
	    ncurses:insertln ncurses:insnstr ncurses:insstr ncurses:instr
	    ncurses:intrflush ncurses:isendwin
	    ncurses:is_linetouched ncurses:is_wintouched

	    ncurses:keyname ncurses:keypad ncurses:killchar

	    ncurses:leaveok ncurses:longname

	    ncurses:meta ncurses:move ncurses:mvaddch
	    ncurses:mvaddchnstr ncurses:mvaddchstr ncurses:mvaddnstr
	    ncurses:mvaddstr ncurses:mvchgat ncurses:mvcur ncurses:mvdelch
	    ncurses:mvderwin ncurses:mvgetch ncurses:mvgetnstr
	    ncurses:mvgetstr ncurses:mvhline ncurses:mvinch
	    ncurses:mvinchnstr ncurses:mvinchstr ncurses:mvinnstr
	    ncurses:mvinsch ncurses:mvinsnstr ncurses:mvinsstr
	    ncurses:mvinstr ncurses:mvprintw ncurses:mvscanw
	    ncurses:mvvline ncurses:mvwaddch ncurses:mvwaddchnstr
	    ncurses:mvwaddchstr ncurses:mvwaddnstr ncurses:mvwaddstr
	    ncurses:mvwchgat ncurses:mvwdelch ncurses:mvwgetch
	    ncurses:mvwgetnstr ncurses:mvwgetstr ncurses:mvwhline
	    ncurses:mvwin ncurses:mvwinch ncurses:mvwinchnstr
	    ncurses:mvwinchstr ncurses:mvwinnstr ncurses:mvwinsch
	    ncurses:mvwinsnstr ncurses:mvwinsstr ncurses:mvwinstr
	    ncurses:mvwprintw ncurses:mvwscanw ncurses:mvwvline

	    ncurses:napms ncurses:newpad ncurses:newterm
	    ncurses:newwin ncurses:nl ncurses:nocbreak
	    ncurses:nodelay ncurses:noecho ncurses:nonl
	    ncurses:noqiflush ncurses:noraw ncurses:notimeout

	    ncurses:overlay ncurses:overwrite

	    ncurses:pair_content ncurses:PAIR_NUMBER
	    ncurses:pechochar ncurses:pnoutrefresh ncurses:prefresh
	    ncurses:printw ncurses:putwin

	    ncurses:qiflush

	    ncurses:raw ncurses:redrawwin ncurses:refresh
	    ncurses:resetty ncurses:reset_prog_mode
	    ncurses:reset_shell_mode ncurses:ripoffline

	    ncurses:savetty ncurses:scanw ncurses:scr_dump
	    ncurses:scr_init ncurses:scrl ncurses:scroll
	    ncurses:scrollok ncurses:scr_restore
	    ncurses:scr_set ncurses:setscrreg ncurses:set_term
	    ncurses:slk_attroff ncurses:slk_attr_off ncurses:slk_attron
	    ncurses:slk_attr_on ncurses:slk_attrset ncurses:slk_attr
	    ncurses:slk_attr_set ncurses:slk_clear ncurses:slk_color
	    ncurses:slk_init ncurses:slk_label ncurses:slk_noutrefresh
	    ncurses:slk_refresh ncurses:slk_restore ncurses:slk_set
	    ncurses:slk_touch
	    ncurses:standout ncurses:standend ncurses:start_color
	    ncurses:subpad ncurses:subwin ncurses:syncok

	    ncurses:termattrs ncurses:termname ncurses:timeout
	    ncurses:touchline ncurses:touchwin ncurses:typeahead
	    ncurses:ungetch ncurses:untouchwin ncurses:use_env
	    ncurses:use_tioctl

	    ncurses:vidattr ncurses:vidputs ncurses:vline
	    ncurses:vw_printw ncurses:vw_scanw

	    ncurses:waddch ncurses:waddchnstr ncurses:waddchstr
	    ncurses:waddnstr ncurses:waddstr
	    ncurses:wattron ncurses:wattroff ncurses:wattrset
	    ncurses:wattr_get ncurses:wattr_on ncurses:wattr_off
	    ncurses:wattr_set
	    ncurses:wbkgd ncurses:wbkgdset ncurses:wborder
	    ncurses:wchgat ncurses:wclear
	    ncurses:wclrtobot ncurses:wclrtoeol
	    ncurses:wcolor_set ncurses:wcursyncup
	    ncurses:wdelch ncurses:wdeleteln
	    ncurses:wechochar ncurses:werase
	    ncurses:wgetch ncurses:wgetnstr ncurses:wgetstr ncurses:whline
	    ncurses:winch ncurses:winchnstr ncurses:winchstr
	    ncurses:winnstr ncurses:winsch ncurses:winsdelln
	    ncurses:winsertln ncurses:winsnstr ncurses:winsstr ncurses:winstr
	    ncurses:wmove ncurses:wnoutrefresh ncurses:wprintw
	    ncurses:wredrawln ncurses:wrefresh ncurses:wscanw ncurses:wscrl
	    ncurses:wsetscrreg ncurses:wstandout ncurses:wstandend
	    ncurses:wsyncdown ncurses:wsyncup ncurses:wtimeout
	    ncurses:wtouchln ncurses:wvline

	    ncurses:tigetflag ncurses:tigetnum ncurses:tigetstr

	    ncurses:putp
	    ncurses:tparm ncurses:tiparm ncurses:tiparm_s
	    ;; this doesn't exist in the runtime...
	    ;; ncurses:tiscan_s
	    ncurses:getattrs ncurses:getcurx ncurses:getcury
	    ncurses:getbegx ncurses:getbegy ncurses:getmaxx
	    ncurses:getmaxy ncurses:getparx ncurses:getpary

	    ncurses:getyx ncurses:getbegyx ncurses:getmaxyx ncurses:getparyx
	    
	    ;; variables
	    *ncurses:curscr* *ncurses:newscr* *ncurses:stdscr* *ncurses:ttytype*
	    *ncurses:colors* *ncurses:color-pairs* *ncurses:cols*
	    *ncurses:escdelay* *ncurses:lines* *ncurses:tabsize*
	    
	    ;; attributes
	    *ncurses:a-normal*
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

	    ;; keys
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
    (import (only (ncurses runtime) init-ncurses-binding)
	    (ncurses bindings)
	    (ncurses variables)
	    (ncurses constants)
	    (ncurses psuedo-functions)))
