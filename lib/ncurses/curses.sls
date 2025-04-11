;;; -*- mode:scheme; coding: utf-8; -*-
;;;
;;; ncurses/curses.sls - range of curses.h
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
(library (ncurses curses)
    (export bool char* short* int* void* va_list
	    chtype chtype*
	    mmask_t mmask_t* attr_t attr_t*
	    WINDOW* SCREEN* FILE*

	    ncurses:baudrate ncurses:beep
	    ncurses:border ncurses:box

	    ncurses:can_change_color ncurses:cbreak
	    ncurses:clearok ncurses:color_content
	    ncurses:COLOR_PAIR ncurses:copywin
	    ncurses:curs_set

	    ncurses:def_prog_mode ncurses:def_shell_mode
	    ncurses:delay_output ncurses:delscreen ncurses:delwin
	    ncurses:derwin ncurses:doupdate ncurses:dupwin

	    ncurses:echo ncurses:endwin ncurses:erasechar

	    ncurses:filter ncurses:flash ncurses:flushinp

	    ncurses:getbkgd ncurses:getnstr ncurses:getwin

	    ncurses:halfdelay ncurses:has_colors ncurses:has_ic ncurses:has_il
	    ncurses:hline

	    ncurses:idcok ncurses:idlok ncurses:immedok ncurses:initscr
	    ncurses:init_color ncurses:init_pair

	    ncurses:intrflush ncurses:isendwin
	    ncurses:is_linetouched ncurses:is_wintouched

	    ncurses:keyname ncurses:keypad ncurses:killchar

	    ncurses:leaveok ncurses:longname

	    ncurses:meta  ncurses:mvaddch
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

	    ncurses:raw ncurses:redrawwin
	    ncurses:resetty ncurses:reset_prog_mode
	    ncurses:reset_shell_mode ncurses:ripoffline

	    ncurses:savetty ncurses:scanw ncurses:scr_dump
	    ncurses:scr_init ncurses:scroll
	    ncurses:scrollok ncurses:scr_restore
	    ncurses:scr_set  ncurses:set_term
	    ncurses:slk_attroff ncurses:slk_attr_off ncurses:slk_attron
	    ncurses:slk_attr_on ncurses:slk_attrset ncurses:slk_attr
	    ncurses:slk_attr_set ncurses:slk_clear ncurses:slk_color
	    ncurses:slk_init ncurses:slk_label ncurses:slk_noutrefresh
	    ncurses:slk_refresh ncurses:slk_restore ncurses:slk_set
	    ncurses:slk_touch
	    ncurses:start_color ncurses:subpad ncurses:subwin ncurses:syncok

	    ncurses:termattrs ncurses:termname
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
	    ncurses:wdelch
	    ncurses:wechochar ncurses:werase
	    ncurses:wgetch ncurses:wgetnstr ncurses:wgetstr ncurses:whline
	    ncurses:winch ncurses:winchnstr ncurses:winchstr
	    ncurses:winnstr ncurses:winsch ncurses:winsdelln
	    ncurses:winsnstr ncurses:winsstr ncurses:winstr
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


	    *ncurses:curscr* *ncurses:newscr* *ncurses:stdscr* *ncurses:ttytype*
	    *ncurses:COLORS* *ncurses:COLOR_PAIRS* *ncurses:COLS*
	    *ncurses:ESCDELAY* *ncurses:LINES* *ncurses:TABSIZE*

	    ncurses:addch ncurses:addchnstr ncurses:addchstr ncurses:addnstr
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

	    ncurses:getyx ncurses:getbegyx ncurses:getmaxyx ncurses:getparyx

	    *ncurses:A_NORMAL*
	    *ncurses:A_ATTRIBUTES*
	    *ncurses:A_CHARTEXT*
	    *ncurses:A_COLOR*

	    ncurses:ACS_ULCORNER
	    ncurses:ACS_LLCORNER
	    ncurses:ACS_URCORNER
	    ncurses:ACS_LRCORNER
	    ncurses:ACS_LTEE
	    ncurses:ACS_RTEE
	    ncurses:ACS_BTEE
	    ncurses:ACS_TTEE
	    ncurses:ACS_HLINE
	    ncurses:ACS_VLINE
	    ncurses:ACS_PLUS
	    ncurses:ACS_S1
	    ncurses:ACS_S9
	    ncurses:ACS_DIAMOND
	    ncurses:ACS_CKBOARD
	    ncurses:ACS_DEGREE
	    ncurses:ACS_PLMINUS
	    ncurses:ACS_BULLET
	    ncurses:ACS_LARROW
	    ncurses:ACS_RARROW
	    ncurses:ACS_DARROW
	    ncurses:ACS_UARROW
	    ncurses:ACS_BOARD
	    ncurses:ACS_LANTERN
	    ncurses:ACS_BLOCK
	    ncurses:ACS_S3
	    ncurses:ACS_S7
	    ncurses:ACS_LEQUAL
	    ncurses:ACS_GEQUAL
	    ncurses:ACS_PI
	    ncurses:ACS_NEQUAL
	    ncurses:ACS_STERLING
	    ncurses:ACS_BSSB
	    ncurses:ACS_SSBB
	    ncurses:ACS_BBSS
	    ncurses:ACS_SBBS
	    ncurses:ACS_SBSS
	    ncurses:ACS_SSSB
	    ncurses:ACS_SSBS
	    ncurses:ACS_BSSS
	    ncurses:ACS_BSBS
	    ncurses:ACS_SBSB
	    ncurses:ACS_SSSS

	    *ncurses:OK*
	    *ncurses:ERR*

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
	    *ncurses:KEY_RESIZE*
	    *ncurses:KEY_MAX*)
    (import (ncurses curses types)
	    (ncurses curses functions)
	    (ncurses curses variables)
	    (ncurses curses psuedo-functions)
	    (ncurses curses constants))

)
