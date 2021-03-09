;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

;; Place your private configuration here! Remember, you do not need to run 'doom
;; sync' after modifying this file!


;; Some functionality uses this to identify you, e.g. GPG configuration, email
;; clients, file templates and snippets.
(setq user-full-name "Pijus Petkevičius"
      user-mail-address "pijus.petkevicius314@gmail.com")

;; Doom exposes five (optional) variables for controlling fonts in Doom. Here
;; are the three important ones:
;;
;; + `doom-font'
;; + `doom-variable-pitch-font'
;; + `doom-big-font' -- used for `doom-big-font-mode'; use this for
;;   presentations or streaming.
;;
;; They all accept either a font-spec, font string ("Input Mono-12"), or xlfd
;; font string. You generally only need these two:
;; (setq doom-font (font-spec :family "monospace" :size 12 :weight 'semi-light)
;;       doom-variable-pitch-font (font-spec :family "sans" :size 13))

;; There are two ways to load a theme. Both assume the theme is installed and
;; available. You can either set `doom-theme' or manually load a theme with the
;; `load-theme' function. This is the default:
(setq doom-theme 'doom-one)

;; If you use `org' and don't want your org files in the default location below,
;; change `org-directory'. It must be set before org loads!
(setq org-directory "~/org/")

;; This determines the style of line numbers in effect. If set to `nil', line
;; numbers are disabled. For relative line numbers, set this to `relative'.
(setq display-line-numbers-type t)


;; Here are some additional functions/macros that could help you configure Doom:
;;
;; - `load!' for loading external *.el files relative to this one
;; - `use-package!' for configuring packages
;; - `after!' for running code after a package has loaded
;; - `add-load-path!' for adding directories to the `load-path', relative to
;;   this file. Emacs searches the `load-path' when you load packages with
;;   `require' or `use-package'.
;; - `map!' for binding new keys
;;
;; To get information about any of these functions/macros, move the cursor over
;; the highlighted symbol at press 'K' (non-evil users must press 'C-c c k').
;; This will open documentation for it, including demos of how they are used.
;;
;; You can also try 'gd' (or 'C-c c d') to jump to their definition and see how
;; they are implemented.

;;(setq mouse-wheel-scroll-amount '(1 ((shift) . 1))) ;; one line at a time
;;(setq mouse-wheel-progressive-speed nil) ;; don't accelerate scrolling
;;(setq mouse-wheel-follow-mouse 't) ;; scroll window under mouse
;;  (setq scroll-step 1) ;; keyboard scroll one line at a time

;;(require 'sublimity)
;;(require 'sublimity-scroll)
;;(sublimity-mode 1)

(setq scroll-step 1)
   (setq scroll-conservatively 10000)
    (setq auto-window-vscroll nil)
  
;;    (setq scroll-margin 1
;;      scroll-conservatively 0
;;      scroll-up-aggressively 0.01
;;      scroll-down-aggressively 0.01)
;;    (setq-default scroll-up-aggressively 0.01
;;      scroll-down-aggressively 0.01)

;;   (setq redisplay-dont-pause t
;;  scroll-margin 1
;;  scroll-step 1
;;  scroll-conservatively 10000
;;  scroll-preserve-screen-position 1)   
;;   (setq scroll-step 1)
;;   (setq scroll-conservatively 10000)
;;   (setq auto-window-vscroll nil)
 
(setq display-line-numbers-type 'relative);; relative line numbers(like in vim)
(setq european-calendar-style 't)
(setq calendar-week-start-day 1);; weeks start on monday
(add-hook 'c-mode-hook #'rainbow-mode)

(setq doc-view-continuous t);; scrolling in pdf file

(after! org
 (setq org-todo-keywords
       '((sequence "TODO(t)"
                   "PROJ(p)"
                   "LOOP(R)"
                   "STRT(s)"
                   "WAIT(w)"
                   "LECTURE(l)"
                   "ROUTINE(r)"
                   "HOLD(h)"
                   "IDEA(i)"
                   "|"
                   "DONE(d)"
                   "KILL(k)")
     (sequence "[ ](T)" "[-](S)" "[?](W)" "|" "[X](D)")
     (sequence "|" "OKAY(o)" "YES(y)" "NO(n)")))
 (setq org-todo-keyword-faces
   '(("[-]" . +org-todo-active)
     ("STRT" . +org-todo-active)
     ("[?]" . +org-todo-onhold)
     ("WAIT" . +org-todo-onhold)
     ("HOLD" . +org-todo-onhold)
     ("PROJ" . +org-todo-project)
     ("LECTURE" . (:foreground "orange"))
     ("ROUTINE" . (:foreground "violet"))
     ("NO" . +org-todo-cancel)
     ("KILL" . +org-todo-cancel)))
 )
