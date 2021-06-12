(setq user-full-name "Pijus Petkevičius"
      user-mail-address "pijus.petkevicius314@gmail.com")

 ;;(setq doom-font (font-spec :family "monospace" :size 12 :weight 'semi-light)
 ;;       doom-variable-pitch-font (font-spec :family "sans" :size 13))

(setq doom-theme 'doom-one)

(setq org-directory "~/Desktop/Org_mode/")

(setq display-line-numbers-type 'relative);; relative line numbers(like in vim)

(setq scroll-step 1);;scrolling settings
(setq scroll-conservatively 10000)
(setq auto-window-vscroll nil)
(setq redisplay-dont-pause t
  scroll-margin 1
  scroll-step 1
  scroll-conservatively 10000
  scroll-preserve-screen-position 1)

(setq european-calendar-style 't)
(setq calendar-week-start-day 1);; weeks start on monday

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
  (require 'org-checklist)
  (require 'org-bullets)
  (add-hook 'org-mode-hook (lambda () (org-bullets-mode 1)))
  (setq org-bullets-bullet-list '("◉" "○"))
  )

(global-set-key (kbd "<mouse-6>") (lambda () (interactive) (scroll-right 6)))
(global-set-key (kbd "<mouse-7>") (lambda () (interactive) (scroll-left 6)))
(setq mouse-wheel-tilt-scroll t)

(setq lsp-modeline-code-actions-enable t)
(setq lsp-ui-sideline-enable nil)
(setq lsp-ui-sideline-show-hover nil)
(setq company-idle-delay 0.1)
(setq company-meghanada-prefix-length 3)

;; (require 'android-mode)
(custom-set-variables
 '(android-mode-avd "AVD")
 '(android-mode-sdk-dir "/opt/android-sdk/"))

(defun dolphin ()
  "Opens dolphin in the current directory"
  (interactive)
  (call-process-shell-command "dolphin . &" nil 0))
(global-set-key (kbd "<f3>") 'dolphin); Or whatever key you want...

(defun termite ()
  "Opens termite in the current directory"
  (interactive)
  (call-process-shell-command "termite . &" nil 0))
(global-set-key (kbd "<f1>") 'termite)

(defvar-local last-mode nil
  "Buffer-local variable to store last mode in.")

(defun toggle-linum-mode ()
  "Toggle the mode between the current mode and `linum-mode'."
  (interactive)
  (make-local-variable 'last-mode)
  (put 'last-mode 'permanent-local t)
  (if (not 'linum-mode)
      (progn
        (message "switch back to %s" last-mode)
        ;; (funcall last-mode)
        (setq linum-mode 1))
    ;; This means you are in the native mode you started in and now want to
    ;; switch to org-mode
    (message "switch to o from %s" last-mode)
    ;; (setq last-mode nil)
    (setq linum-mode 'nil)))
(global-set-key (kbd "<f4>") 'toggle-linum-mode);; fix toggling

(save-place-mode 1)
(yas-global-mode 1)
(setq fancy-splash-image "~/.doom.d/splash/default.png");; note- if you comment this line, the logo will appear on start screen, but opening new buffer, window, etc. will show doom logo
(add-hook 'c-mode-hook #'rainbow-mode)
(setq doc-view-continuous t);; scrolling in pdf file

(setq package-check-signature nil)
(use-package org-gcal
:ensure t
:config
(setq org-gcal-client-id "866929913823-05tsfr469sf180ncvq0pgum5kju1nve3.apps.googleusercontent.com"
org-gcal-client-secret "D4FEgO054YCjcpZ0n_WSz6zD"
org-gcal-file-alist '(("pijus.petkevicius314@gmail.com" .  "~/Desktop/Org_mode/gcal.org"))))

(add-hook 'org-agenda-mode-hook (lambda () (org-gcal-sync) ))
(add-hook 'org-capture-after-finalize-hook (lambda () (org-gcal-sync) ))
