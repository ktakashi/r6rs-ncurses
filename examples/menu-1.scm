#!r6rs
(import (rnrs)
	(ncurses)
	(ncurses menus))

;; For Chez...
(init-ncurses-binding)
(init-menus-binding)

;; From
;; https://tldp.org/HOWTO/NCURSES-Programming-HOWTO/menus.html
;; Example 18

(define *choices* (vector "Choice 1" "Choice 2" "Choice 3" "Choice 4" "Exit"))

(ncurses:initscr)
(ncurses:cbreak)
(ncurses:noecho)
(ncurses:keypad *ncurses:stdscr* #t)

(let* ((my-items (vector-map (lambda (c) (menus:new_item c c)) *choices*))
       (my-menu (menus:new_menu my-items)))
  (ncurses:mvprintw (- *ncurses:LINES* 2) 0 "F1 to Exist")
  (menus:post_menu my-menu)
  (ncurses:refresh)
  (let loop ((ch (ncurses:getch)))
    (unless (= (ncurses:KEY_F 1) ch)
      (cond ((eqv? ch *ncurses:KEY_DOWN*)
	     (menus:menu_driver my-menu *menus:REQ_DOWN_ITEM*))
	    ((eqv? ch *ncurses:KEY_UP*)
	     (menus:menu_driver my-menu *menus:REQ_UP_ITEM*)))
      (loop (ncurses:getch))))
  (vector-for-each menus:free_item my-items)
  (menus:free_menu my-menu)
  (ncurses:endwin))
  
