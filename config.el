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

(defun line_numbers ()
  "Changes line number mode"
  (interactive)
  (if (equal display-line-numbers-type (make-symbol "relative"))
      (setq display-line-numbers-type 't)
      (setq display-line-numbers-type 'relative)
    )
  )
(global-set-key (kbd "<f4>") 'line_numbers)

(save-place-mode 1)
(yas-global-mode 1)
(setq fancy-splash-image "~/.doom.d/splash/default.png");; note- if you comment this line, the logo will appear on start screen, but opening new buffer, window, etc. will show doom logo
(add-hook 'c-mode-hook #'rainbow-mode)
(setq doc-view-continuous t);; scrolling in pdf file
