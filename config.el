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
(setq org-directory "~/Desktop/Org_mode/")

;; This determines the style of line numbers in effect. If set to `nil', line
;; numbers are disabled. For relative line numbers, set this to `relative'.
(setq display-line-numbers-type 'relative);; relative line numbers(like in vim)

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

(setq scroll-step 1);;scrolling settings
(setq scroll-conservatively 10000)
(setq auto-window-vscroll nil)
  
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
(global-set-key (kbd "<mouse-6>") (lambda () (interactive) (scroll-right 6)))
(global-set-key (kbd "<mouse-7>") (lambda () (interactive) (scroll-left 6)))
(save-place-mode 1)
(setq mouse-wheel-tilt-scroll t)
(setq lsp-modeline-code-actions-enable t)
(setq lsp-ui-sideline-enable nil)
(setq lsp-ui-sideline-show-hover nil)
(setq company-idle-delay 0.1)
(setq company-meghanada-prefix-length 3)
(require 'org-bullets)
(add-hook 'org-mode-hook (lambda () (org-bullets-mode 1)))
(setq org-bullets-bullet-list '("◉" "○"))
(yas-global-mode 1)
(setq fancy-splash-image "~/.doom.d/splash/default.png");; note- if you comment this line, the logo will appear on start screen, but opening new buffer, window, etc. will show doom logo
;; (setq fancy-splash-image "~/.emacs.d/modules/ui/doom-dashboard/banners/default.png")
