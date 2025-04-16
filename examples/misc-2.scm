#!r6rs
(import (rnrs)
	(pffi)
	(ncurses))

(init-ncurses-binding)

;; From
;; https://tldp.org/HOWTO/NCURSES-Programming-HOWTO/misc.html
;; Example 13

(ncurses:initscr)

(ncurses:printw "Upper left corner           ") (ncurses:addch *ncurses:ACS_ULCORNER*) (ncurses:printw "\n") 
(ncurses:printw "Lower left corner           ") (ncurses:addch *ncurses:ACS_LLCORNER*) (ncurses:printw "\n")
(ncurses:printw "Lower right corner          ") (ncurses:addch *ncurses:ACS_LRCORNER*) (ncurses:printw "\n")
(ncurses:printw "Tee pointing right          ") (ncurses:addch *ncurses:ACS_LTEE*) (ncurses:printw "\n")
(ncurses:printw "Tee pointing left           ") (ncurses:addch *ncurses:ACS_RTEE*) (ncurses:printw "\n")
(ncurses:printw "Tee pointing up             ") (ncurses:addch *ncurses:ACS_BTEE*) (ncurses:printw "\n")
(ncurses:printw "Tee pointing down           ") (ncurses:addch *ncurses:ACS_TTEE*) (ncurses:printw "\n")
(ncurses:printw "Horizontal line             ") (ncurses:addch *ncurses:ACS_HLINE*) (ncurses:printw "\n")
(ncurses:printw "Vertical line               ") (ncurses:addch *ncurses:ACS_VLINE*) (ncurses:printw "\n")
(ncurses:printw "Large Plus or cross over    ") (ncurses:addch *ncurses:ACS_PLUS*) (ncurses:printw "\n")
(ncurses:printw "Scan Line 1                 ") (ncurses:addch *ncurses:ACS_S1*) (ncurses:printw "\n")
(ncurses:printw "Scan Line 3                 ") (ncurses:addch *ncurses:ACS_S3*) (ncurses:printw "\n")
(ncurses:printw "Scan Line 7                 ") (ncurses:addch *ncurses:ACS_S7*) (ncurses:printw "\n")
(ncurses:printw "Scan Line 9                 ") (ncurses:addch *ncurses:ACS_S9*) (ncurses:printw "\n")
(ncurses:printw "Diamond                     ") (ncurses:addch *ncurses:ACS_DIAMOND*) (ncurses:printw "\n")
(ncurses:printw "Checker board (stipple)     ") (ncurses:addch *ncurses:ACS_CKBOARD*) (ncurses:printw "\n")
(ncurses:printw "Degree Symbol               ") (ncurses:addch *ncurses:ACS_DEGREE*) (ncurses:printw "\n")
(ncurses:printw "Plus/Minus Symbol           ") (ncurses:addch *ncurses:ACS_PLMINUS*) (ncurses:printw "\n")
(ncurses:printw "Bullet                      ") (ncurses:addch *ncurses:ACS_BULLET*) (ncurses:printw "\n")
(ncurses:printw "Arrow Pointing Left         ") (ncurses:addch *ncurses:ACS_LARROW*) (ncurses:printw "\n")
(ncurses:printw "Arrow Pointing Right        ") (ncurses:addch *ncurses:ACS_RARROW*) (ncurses:printw "\n")
(ncurses:printw "Arrow Pointing Down         ") (ncurses:addch *ncurses:ACS_DARROW*) (ncurses:printw "\n")
(ncurses:printw "Arrow Pointing Up           ") (ncurses:addch *ncurses:ACS_UARROW*) (ncurses:printw "\n")
(ncurses:printw "Board of squares            ") (ncurses:addch *ncurses:ACS_BOARD*) (ncurses:printw "\n")
(ncurses:printw "Lantern Symbol              ") (ncurses:addch *ncurses:ACS_LANTERN*) (ncurses:printw "\n")
(ncurses:printw "Solid Square Block          ") (ncurses:addch *ncurses:ACS_BLOCK*) (ncurses:printw "\n")
(ncurses:printw "Less/Equal sign             ") (ncurses:addch *ncurses:ACS_LEQUAL*) (ncurses:printw "\n")
(ncurses:printw "Greater/Equal sign          ") (ncurses:addch *ncurses:ACS_GEQUAL*) (ncurses:printw "\n")
(ncurses:printw "Pi                          ") (ncurses:addch *ncurses:ACS_PI*) (ncurses:printw "\n")
(ncurses:printw "Not equal                   ") (ncurses:addch *ncurses:ACS_NEQUAL*) (ncurses:printw "\n")
(ncurses:printw "UK pound sign               ") (ncurses:addch *ncurses:ACS_STERLING*) (ncurses:printw "\n")

(ncurses:refresh)
(ncurses:getch)
(ncurses:endwin)

