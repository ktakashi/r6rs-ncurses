R6RS ncurses binding
====================

This is an ncurses binding for R6RS Scheme implementations.

Prerequisite
------------

This library uses the below libraries

- [R6RS PFFI](https://github.com/ktakashi/r6rs-pffi)
- [R6RS Psystem](https://github.com/ktakashi/r6rs-psystem)

Tested implementations
----------------------

- Sagittarius 0.9.13 (next version)
- Chez Scheme v10.0.0

Using scheme-env
----------------

If you are using [scheme-env](https://github.com/ktakashi/scheme-env), then
using `sitelib` command would be the easiest way to install this library and
its dependencies.

```shell
scheme-env sitelib -c deps/r6rs-pffi.scm
scheme-env sitelib -c deps/r6rs-psystem.scm
scheme-env sitelib r6rs-ncurses lib/
```

The above command installs both dependencies and the library.

Bindings
--------

The library consists with 5 parts;

- curses: `(ncurses)` or `(ncurses curses)`
- mouse support: `(ncurses mouse)`
- menus: `(ncurses menus)`
- panels: `(ncurses panels)`
- forms: `(ncurses forms)`


### `(ncurses)` or `(ncurses curses)`

`(ncurses)` provides the all bindings from the `(ncurses curses)`.  
These library provides the range of POSIX curses.

### `(ncurses mouse)`

This library provides mouse support.  
The library doesn't check if the mouse is supported or not, so it is users'
responsiblity to check.

### `(ncurses menus)`

This library provides the binding of `libmenu`.

### `(ncurses panels)`

This library provides the binding of `libpanel`.

### `(ncurses forms)`

This library provides the binding of `libform`.

Examples
--------

Example scripts are located in [examples](./examples) directory. All the
examples are based on the [NCURSES Programming HOWTO](https://tldp.org/HOWTO/NCURSES-Programming-HOWTO/index.html).
