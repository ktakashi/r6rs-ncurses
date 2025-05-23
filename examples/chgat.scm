(import (rnrs)
	(pffi)
	(ncurses))

(define NULL (integer->pointer 0))

(init-ncurses-binding)
;; From
;; https://tldp.org/HOWTO/NCURSES-Programming-HOWTO/attrib.html
;; section 8.6

(ncurses:initscr)
(ncurses:start_color)

(ncurses:init_pair 1 *ncurses:COLOR_CYAN* *ncurses:COLOR_BLACK*)
(ncurses:printw "A Big string which i didn't care to type fully ")
(ncurses:mvchgat 0 0 -1 *ncurses:A_BLINK* 1 NULL)
#|
 | First two parameters specify the position at which to start 
 | Third parameter number of characters to update. -1 means till 
 | end of line
 | Forth parameter is the normal attribute you wanted to give 
 | to the charcter
 | Fifth is the color index. It is the index given during init_pair()
 | use 0 if you didn't want color
 | Sixth one is always NULL 
 |#
(ncurses:refresh)
(ncurses:getch)
(ncurses:endwin)
