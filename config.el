(setq user-full-name "Pijus Petkevičius"
      user-mail-address "pijus.petkevicius314@gmail.com")

(setq doom-font (font-spec :family "Fira Code" :size 14 :weight 'light))

 ;;(setq doom-font (font-spec :family "monospace" :size 12 :weight 'semi-light)
 ;;       doom-variable-pitch-font (font-spec :family "sans" :size 13))

(setq doom-theme 'kanagawa-wave)
(custom-theme-set-faces! 'kanagawa-wave
  '(line-number :foreground "dim gray")
  '(line-number-current-line :foreground "white")
  '(mode-line-inactive :background "dim gray" :foreground "white" :height 80)
  '(mode-line :background "#16161D" :height 80)
  '(default :background "#1F1F28"))

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
  (call-process-shell-command "alacritty  &" nil 0))
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

(global-set-key [f12] 'xref-find-definitions)

(save-place-mode 1)
(yas-global-mode 1)
(setq fancy-splash-image "~/.config/doom/splash/kanagawa.png");; note- if you comment this line, the logo will appear on start screen, but opening new buffer, window, etc. will show doom logo

;; fancy org bullets
(add-hook 'c-mode-hook #'rainbow-mode)
(setq doc-view-continuous t);; scrolling in pdf file

;; (require 'flymake-haskell-multi)
;;   (add-hook 'haskell-mode-hook 'flymake-haskell-multi-load)

;; (use-package omnisharp
;;            :after company
;;            :init
;;            (add-to-list 'company-backends 'company-omnisharp)
;;            (add-hook 'csharp-mode-hook 'my-csharp-mode-setup)
;;            :config
;;            (defun my-csharp-mode-setup ()
;;              (omnisharp-mode)
;;              (company-mode)
;;              (flycheck-mode)
;;              (setq indent-tabs-mode nil)
;;              (setq c-syntactic-indentation t)
;;              (c-set-style "ellemtel")
;;              (setq c-basic-offset 4)
;;              (setq truncate-lines t)
;;              (setq tab-width 4)
;;              (setq evil-shift-width 4)
;;              ;;csharp-mode README.md recommends this too
;;              ;;(electric-pair-mode 1)       ;; Emacs 24
;;              ;;(electric-pair-local-mode 1) ;; Emacs 25
;;              )
;;            :bind (("C-c C-d" . 'omnisharp-run-code-action-refactoring)))

(plist-put! +ligatures-extra-symbols
  ;; org
  :name          "»"
  :src_block     "»"
  :src_block_end "«"
  :quote         "“"
  :quote_end     "”"
  ;; Functional
  :lambda        "λ"
  :def           "ƒ"
  :composition   "∘"
  :map           "↦"
  ;; Types
  :null          "∅"
  :true          "𝕋"
  :false         "𝔽"
  :int           "ℤ"
  :float         "ℝ"
  :str           "𝕊"
  :bool          "𝔹"
  :list          "𝕃"
  ;; Flow
  :not           "￢"
  :in            "∈"
  :not-in        "∉"
  :and           "∧"
  :or            "∨"
  :for           "∀"
  :some          "∃"
  :return        "⟼"
  :yield         "⟻"
  ;; Other
  :union         "⋃"
  :intersect     "∩"
  :diff          "∖"
  :tuple         "⨂"
  :pipe          "" ;; FIXME: find a non-private char
  :dot           "•")  ;; you could also add your own if you want

(set-ligatures! '(kotlin-mode java-mode)
  :null "null"
  :and  "&&"
  :or  "||"
  :not "!"
  )
(set-ligatures! '(c-mode c++-mode)
  :null "NULL"
  :and  "&&"
  :or  "||"
  :not "!"
  )

(setq lsp-inlay-hints-mode t)
(setq lsp-inlay-hint-enable t)

(dolist (key '("\C-f"))
  (global-unset-key key))
(defun find-references-under-cursor ()
  "Find references of the word under the cursor using projectile-find-references"
  (interactive)
  (let ((word (thing-at-point 'word t)))  ; Get the word at point
    (if word
        (projectile-find-references word)
      (projectile-find-references)
      )
    )
  )

  (global-set-key (kbd "C-f")  'find-references-under-cursor)
