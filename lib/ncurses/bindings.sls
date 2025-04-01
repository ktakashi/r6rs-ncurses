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
(library (ncurses bindings)
    (export ncurses:baudrate ncurses:beep 
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
	    ncurses:getmaxy ncurses:getparx ncurses:getpary)
    (import (rnrs)
	    (pffi)
	    (ncurses types)
	    (ncurses runtime))

(define-syntax define-binding
  (lambda (x)
    (define (->name k name)
      (datum->syntax k
       (string->symbol
	(string-append "ncurses:" (symbol->string (syntax->datum name))))))
    (syntax-case x ()
      ((k (ret) name (args ...))
       (with-syntax ((binding-name (->name #'k #'name)))
	 #'(define binding-name (ncurses-binding ret name (args ...))))))))

;; (define-binding (int) addch (chtype))
;; (define-binding (int) addchnstr (chtype* int))
;; (define-binding (int) addchstr (chtype*))
;; (define-binding (int) addnstr (char* int))
;; (define-binding (int) addstr (char*))
;; (define-binding (int) attroff (int))
;; (define-binding (int) attron (int))
;; (define-binding (int) attrset (int))
;; (define-binding (int) attr_get (attr_t* short* void*))
;; (define-binding (int) attr_off (attr_t void*))
;; (define-binding (int) attr_on (attr_t void*))
;; (define-binding (int) attr_set (attr_t short void*))
(define-binding (int) baudrate ())
(define-binding (int) beep  ())
;; (define-binding (int) bkgd (chtype))
;; (define-binding (void) bkgdset (chtype))
(define-binding (int) border (chtype chtype chtype chtype chtype chtype chtype chtype))
(define-binding (int) box (WINDOW* chtype chtype))
(define-binding (bool) can_change_color ())
(define-binding (int) cbreak ())
;; (define-binding (int) chgat (int attr_t short void*))
;; (define-binding (int) clear ())
(define-binding (int) clearok (WINDOW* bool))
;; (define-binding (int) clrtobot ())
;; (define-binding (int) clrtoeol ())
(define-binding (int) color_content (short short* short* short*))
;; (define-binding (int) color_set (short void*))
(define-binding (int) COLOR_PAIR (int))
(define-binding (int) copywin (WINDOW* WINDOW* int int int int int int int))
(define-binding (int) curs_set (int))
(define-binding (int) def_prog_mode ())
(define-binding (int) def_shell_mode ())
(define-binding (int) delay_output (int))
;; (define-binding (int) delch ())
(define-binding (void) delscreen (SCREEN*))
(define-binding (int) delwin (WINDOW*))
;; (define-binding (int) deleteln ())
(define-binding (WINDOW*) derwin (WINDOW* int int int int))
(define-binding (int) doupdate ())
(define-binding (WINDOW*) dupwin (WINDOW*))
(define-binding (int) echo ())
;; (define-binding (int) echochar (chtype))
;; (define-binding (int) erase ())
(define-binding (int) endwin ())
(define-binding (char) erasechar ())
(define-binding (void) filter ())
(define-binding (int) flash ())
(define-binding (int) flushinp ())
(define-binding (chtype) getbkgd (WINDOW*))
;; (define-binding (int) getch ())
(define-binding (int) getnstr (char* int))
;; (define-binding (int) getstr (char*))
(define-binding (WINDOW*) getwin (FILE*))
(define-binding (int) halfdelay (int))
(define-binding (bool) has_colors ())
(define-binding (bool) has_ic ())
(define-binding (bool) has_il ())
(define-binding (int) hline (chtype int))
(define-binding (void) idcok (WINDOW* bool))
(define-binding (int) idlok (WINDOW* bool))
(define-binding (void) immedok (WINDOW* bool))
;; (define-binding (chtype) inch ())
;; (define-binding (int) inchnstr (chtype* int))
;; (define-binding (int) inchstr (chtype*))
(define-binding (WINDOW*) initscr ())
(define-binding (int) init_color (short short short short))
(define-binding (int) init_pair (short short short))
;; (define-binding (int) innstr (char* int))
;; (define-binding (int) insch (chtype))
;; (define-binding (int) insdelln (int))
;; (define-binding (int) insertln ())
;; (define-binding (int) insnstr (char* int))
;; (define-binding (int) insstr (char*))
;; (define-binding (int) instr (char*))
(define-binding (int) intrflush (WINDOW* bool))
(define-binding (bool) isendwin ())
(define-binding (bool) is_linetouched (WINDOW* int))
(define-binding (bool) is_wintouched (WINDOW*))
(define-binding (char*) keyname (int))
(define-binding (int) keypad (WINDOW* bool))
(define-binding (char) killchar ())
(define-binding (int) leaveok (WINDOW* bool))
(define-binding (char*) longname ())
(define-binding (int) meta (WINDOW* bool))
;; (define-binding (int) move (int int))
(define-binding (int) mvaddch (int int chtype))
(define-binding (int) mvaddchnstr (int int chtype* int))
(define-binding (int) mvaddchstr (int int chtype*))
(define-binding (int) mvaddnstr (int int char* int))
(define-binding (int) mvaddstr (int int char*))
(define-binding (int) mvchgat (int int int attr_t short void*))
(define-binding (int) mvcur (int int int int))
(define-binding (int) mvdelch (int int))
(define-binding (int) mvderwin (WINDOW* int int))
(define-binding (int) mvgetch (int int))
(define-binding (int) mvgetnstr (int int char* int))
(define-binding (int) mvgetstr (int int char*))
(define-binding (int) mvhline (int int chtype int))
(define-binding (chtype) mvinch (int int))
(define-binding (int) mvinchnstr (int int chtype* int))
(define-binding (int) mvinchstr (int int chtype*))
(define-binding (int) mvinnstr (int int char* int))
(define-binding (int) mvinsch (int int chtype))
(define-binding (int) mvinsnstr (int int char* int))
(define-binding (int) mvinsstr (int int char*))
(define-binding (int) mvinstr (int int char*))
(define-binding (int) mvprintw (int int char* ___))
(define-binding (int) mvscanw (int int char* ___))
(define-binding (int) mvvline (int int chtype int))
(define-binding (int) mvwaddch (WINDOW* int int chtype))
(define-binding (int) mvwaddchnstr (WINDOW* int int chtype* int))
(define-binding (int) mvwaddchstr (WINDOW* int int chtype*))
(define-binding (int) mvwaddnstr (WINDOW* int int char* int))
(define-binding (int) mvwaddstr (WINDOW* int int char*))
(define-binding (int) mvwchgat (WINDOW* int int int attr_t short void*))
(define-binding (int) mvwdelch (WINDOW* int int))
(define-binding (int) mvwgetch (WINDOW* int int))
(define-binding (int) mvwgetnstr (WINDOW* int int char* int))
(define-binding (int) mvwgetstr (WINDOW* int int char*))
(define-binding (int) mvwhline (WINDOW* int int chtype int))
(define-binding (int) mvwin (WINDOW* int int))
(define-binding (chtype) mvwinch (WINDOW* int int))
(define-binding (int) mvwinchnstr (WINDOW* int int chtype* int))
(define-binding (int) mvwinchstr (WINDOW* int int chtype*))
(define-binding (int) mvwinnstr (WINDOW* int int char* int))
(define-binding (int) mvwinsch (WINDOW* int int chtype))
(define-binding (int) mvwinsnstr (WINDOW* int int char* int))
(define-binding (int) mvwinsstr (WINDOW* int int char*))
(define-binding (int) mvwinstr (WINDOW* int int char*))
(define-binding (int) mvwprintw (WINDOW* int int char* ___))
(define-binding (int) mvwscanw (WINDOW* int int char* ___))
(define-binding (int) mvwvline (WINDOW* int int chtype int))
(define-binding (int) napms (int))
(define-binding (WINDOW*) newpad (int int))
(define-binding (SCREEN*) newterm (char* FILE* FILE*))
(define-binding (WINDOW*) newwin (int int int int))
(define-binding (int) nl ())
(define-binding (int) nocbreak ())
(define-binding (int) nodelay (WINDOW* bool))
(define-binding (int) noecho ())
(define-binding (int) nonl ())
(define-binding (void) noqiflush ())
(define-binding (int) noraw ())
(define-binding (int) notimeout (WINDOW* bool))
(define-binding (int) overlay (WINDOW* WINDOW*))
(define-binding (int) overwrite (WINDOW* WINDOW*))
(define-binding (int) pair_content (short short* short*))
(define-binding (int) PAIR_NUMBER (int))
(define-binding (int) pechochar (WINDOW* chtype))
(define-binding (int) pnoutrefresh (WINDOW* int int int int int int))
(define-binding (int) prefresh (WINDOW* int int int int int int))
(define-binding (int) printw (char* ___))
(define-binding (int) putwin (WINDOW* FILE*))
(define-binding (void) qiflush ())
(define-binding (int) raw ())
(define-binding (int) redrawwin (WINDOW*))
;; (define-binding (int) refresh ())
(define-binding (int) resetty ())
(define-binding (int) reset_prog_mode ())
(define-binding (int) reset_shell_mode ())
(define-binding (int) ripoffline (int (callback int (WINDOW* int))))
(define-binding (int) savetty ())
(define-binding (int) scanw (char* ___))
(define-binding (int) scr_dump (char*))
(define-binding (int) scr_init (char*))
;; (define-binding (int) scrl (int))
(define-binding (int) scroll (WINDOW*))
(define-binding (int) scrollok (WINDOW* bool))
(define-binding (int) scr_restore (char*))
(define-binding (int) scr_set (char*))
;; (define-binding (int) setscrreg (int int))
(define-binding (SCREEN*) set_term (SCREEN*))
(define-binding (int) slk_attroff (chtype))
(define-binding (int) slk_attr_off (attr_t void*))
(define-binding (int) slk_attron (chtype))
(define-binding (int) slk_attr_on (attr_t void*))
(define-binding (int) slk_attrset (chtype))
(define-binding (attr_t) slk_attr ())
(define-binding (int) slk_attr_set (attr_t short void*))
(define-binding (int) slk_clear ())
(define-binding (int) slk_color (short))
(define-binding (int) slk_init (int))
(define-binding (char*) slk_label (int))
(define-binding (int) slk_noutrefresh ())
(define-binding (int) slk_refresh ())
(define-binding (int) slk_restore ())
(define-binding (int) slk_set (int char* int))
(define-binding (int) slk_touch ())
;; (define-binding (int) standout ())
;; (define-binding (int) standend ())
(define-binding (int) start_color ())
(define-binding (WINDOW*) subpad (WINDOW* int int int int))
(define-binding (WINDOW*) subwin (WINDOW* int int int int))
(define-binding (int) syncok (WINDOW* bool))
(define-binding (chtype) termattrs ())
(define-binding (char*) termname ())
;; (define-binding (void) timeout (int))
(define-binding (int) touchline (WINDOW* int int))
(define-binding (int) touchwin (WINDOW*))
(define-binding (int) typeahead (int))
(define-binding (int) ungetch (int))
(define-binding (int) untouchwin (WINDOW*))
(define-binding (void) use_env (bool))
(define-binding (void) use_tioctl (bool))
(define-binding (int) vidattr (chtype))
(define-binding (int) vidputs (chtype (callback int (int))))
(define-binding (int) vline (chtype int))
(define-binding (int) vw_printw (WINDOW* char* va_list))
(define-binding (int) vw_scanw (WINDOW* char* va_list))
(define-binding (int) waddch (WINDOW* chtype))
(define-binding (int) waddchnstr (WINDOW* chtype* int))
(define-binding (int) waddchstr (WINDOW* chtype*))
(define-binding (int) waddnstr (WINDOW* char* int))
(define-binding (int) waddstr (WINDOW* char*))
(define-binding (int) wattron (WINDOW* int))
(define-binding (int) wattroff (WINDOW* int))
(define-binding (int) wattrset (WINDOW* int))
(define-binding (int) wattr_get (WINDOW* attr_t* short* void*))
(define-binding (int) wattr_on (WINDOW* attr_t void*))
(define-binding (int) wattr_off (WINDOW* attr_t void*))
(define-binding (int) wattr_set (WINDOW* attr_t short void*))
(define-binding (int) wbkgd (WINDOW* chtype))
(define-binding (void) wbkgdset (WINDOW* chtype))
(define-binding (int) wborder (WINDOW* chtype chtype chtype chtype chtype chtype chtype chtype))
(define-binding (int) wchgat (WINDOW* int attr_t short void*))
(define-binding (int) wclear (WINDOW*))
(define-binding (int) wclrtobot (WINDOW*))
(define-binding (int) wclrtoeol (WINDOW*))
(define-binding (int) wcolor_set (WINDOW* short void*))
(define-binding (void) wcursyncup (WINDOW*))
(define-binding (int) wdelch (WINDOW*))
;; (define-binding (int) wdeleteln (WINDOW*))
(define-binding (int) wechochar (WINDOW* chtype))
(define-binding (int) werase (WINDOW*))
(define-binding (int) wgetch (WINDOW*))
(define-binding (int) wgetnstr (WINDOW* char* int))
(define-binding (int) wgetstr (WINDOW* char*))
(define-binding (int) whline (WINDOW* chtype int))
(define-binding (chtype) winch (WINDOW*))
(define-binding (int) winchnstr (WINDOW* chtype* int))
(define-binding (int) winchstr (WINDOW* chtype*))
(define-binding (int) winnstr (WINDOW* char* int))
(define-binding (int) winsch (WINDOW* chtype))
(define-binding (int) winsdelln (WINDOW* int))
;; (define-binding (int) winsertln (WINDOW*))
(define-binding (int) winsnstr (WINDOW* char* int))
(define-binding (int) winsstr (WINDOW* char*))
(define-binding (int) winstr (WINDOW* char*))
(define-binding (int) wmove (WINDOW* int int))
(define-binding (int) wnoutrefresh (WINDOW*))
(define-binding (int) wprintw (WINDOW* char* ___))
(define-binding (int) wredrawln (WINDOW* int int))
(define-binding (int) wrefresh (WINDOW*))
(define-binding (int) wscanw (WINDOW* char* ___))
(define-binding (int) wscrl (WINDOW* int))
(define-binding (int) wsetscrreg (WINDOW* int int))
(define-binding (int) wstandout (WINDOW*))
(define-binding (int) wstandend (WINDOW*))
(define-binding (void) wsyncdown (WINDOW*))
(define-binding (void) wsyncup (WINDOW*))
(define-binding (void) wtimeout (WINDOW* int))
(define-binding (int) wtouchln (WINDOW* int int int))
(define-binding (int) wvline (WINDOW* chtype int))
(define-binding (int) tigetflag (char*))
(define-binding (int) tigetnum (char*))
(define-binding (char*) tigetstr (char*))
(define-binding (int) putp (char*))
(define-binding (char*) tparm (char* ___))
(define-binding (char*) tiparm (char* ___))
(define-binding (char*) tiparm_s (int int char* ___))
;; this doesn't exist in the runtime...
;; (define-binding (int) tiscan_s (int* int* char*))
(define-binding (int) getattrs (WINDOW*))
(define-binding (int) getcurx (WINDOW*))
(define-binding (int) getcury (WINDOW*))
(define-binding (int) getbegx (WINDOW*))
(define-binding (int) getbegy (WINDOW*))
(define-binding (int) getmaxx (WINDOW*))
(define-binding (int) getmaxy (WINDOW*))
(define-binding (int) getparx (WINDOW*))
(define-binding (int) getpary (WINDOW*))


)
