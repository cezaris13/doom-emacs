(setq user-full-name "Pijus Petkevičius"
      user-mail-address "pijus.petkevicius314@gmail.com")

(setq doom-font (font-spec :family "Fira Code" :size 14 :weight 'light)
      doom-symbol-font (font-spec :family "Symbola" :size 22 :weight 'Regular))


 ;;(setq doom-font (font-spec :family "monospace" :size 12 :weight 'semi-light)
 ;;       doom-variable-pitch-font (font-spec :family "sans" :size 13))

(setq doom-theme 'kanagawa-wave)
(custom-theme-set-faces! 'kanagawa-wave
  '(line-number :foreground "dim gray")
  '(line-number-current-line :foreground "white")
  '(mode-line-inactive :background "dim gray" :foreground "white" :height 80)
  '(mode-line :background "#16161D" :height 80)
  '(default :background "#1F1F28"))

;; add custom image to emacs home screen
(setq fancy-splash-image "~/.config/doom/splash/kanagawa.png");; note- if you comment this line, the logo will appear on start screen, but opening new buffer, window, etc. will show doom logo

(setq org-directory "~/Desktop/Org_mode/")

(setq display-line-numbers-type 'relative);; relative line numbers(like in vim)

(global-set-key (kbd "<mouse-6>") (lambda () (interactive) (scroll-right 6)))
(global-set-key (kbd "<mouse-7>") (lambda () (interactive) (scroll-left 6)))

;; for MX master 3 mouse
(global-set-key (kbd "<wheel-right>") (lambda () (interactive) (scroll-left 6)))
(global-set-key (kbd "<wheel-left>") (lambda () (interactive) (scroll-right 6)))

(setq mouse-wheel-tilt-scroll t)

(setq scroll-step 1)
(setq scroll-conservatively 10000)
(setq auto-window-vscroll nil)
(setq redisplay-dont-pause t
  scroll-margin 1
  scroll-step 1
  scroll-conservatively 10000
  scroll-preserve-screen-position 1)

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

(setq lsp-modeline-code-actions-enable t)
(setq lsp-ui-sideline-enable nil)
(setq lsp-ui-sideline-show-hover nil)
(setq company-idle-delay 0.1)
(setq company-meghanada-prefix-length 3)

(use-package rustic
  :config
  (setq rustic-format-on-save t))

(use-package lsp-mode
  :commands lsp
  :custom
  (lsp-auto-guess-root t)
  (lsp-keymap-prefix "M-m l")
  (lsp-modeline-diagnostics-enable nil)
  (lsp-keep-workspace-alive nil)
  (lsp-auto-execute-action nil)
  (lsp-before-save-edits nil)
  (lsp-eldoc-enable-hover nil)
  (lsp-diagnostic-package :none)
  (lsp-completion-provider :none)
  (lsp-file-watch-threshold 1500)
  (lsp-enable-links)
  :custom-face
  (lsp-face-highlight-read ((t (:underline t :background nil :foreground nil))))
  (lsp-face-highlight-write ((t (:underline t :background nil :foreground nil))))
  (lsp-face-highlight-textual ((t (:underline t :background nil :foreground nil))))
  :hook
  (lsp-mode . lsp-enable-which-key-integration))

(use-package omnisharp
           :after company
           :init
           (add-to-list 'company-backends 'company-omnisharp)
           (add-hook 'csharp-mode-hook 'my-csharp-mode-setup)
           :config
           (defun my-csharp-mode-setup ()
             (omnisharp-mode)
             (company-mode)
             (flycheck-mode)
             (setq indent-tabs-mode nil)
             (setq c-syntactic-indentation t)
             (c-set-style "ellemtel")
             (setq c-basic-offset 4)
             (setq truncate-lines t)
             (setq tab-width 4)
             (setq evil-shift-width 4)
             )
           :bind (("C-c C-d" . 'omnisharp-run-code-action-refactoring)))

(defun open-external-file-explorer ()
  "Opens file explorer in the current directory"
  (interactive)
  (call-process-shell-command "dolphin . &" nil 0))
(global-set-key (kbd "<f3>") 'open-external-file-explorer)

(defun open-external-terminal ()
  "Opens external terminal in the current directory"
  (interactive)
  (call-process-shell-command "alacritty  &" nil 0))
(global-set-key (kbd "<f1>") 'open-external-terminal)

(use-package! projectile
  :config
  ;; Bind s-S-o to find file in project using projectile (command+shift+o)
  (map! :desc "Open Find file in the project"
        "s-O" #'projectile-find-file))

(use-package! neotree
  :config
  ;; Bind s-S-j to open NeoTree to the current file's location (command+shift+j)
  (map! :desc "Open NeoTree at current file"
        "s-J" #'+neotree/find-this-file))

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

(map! :desc "Find references of the word under cursor in the project"
        "s-F" 'find-references-under-cursor)

(global-set-key [f12] 'xref-find-definitions)

(map! :desc "Find definition under cursor"
      "s-<mouse-1>" 'xref-find-definitions)

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
)

(require 'org-checklist)
(require 'org-bullets)
(add-hook 'org-mode-hook (lambda () (org-bullets-mode 1)))
(setq org-bullets-bullet-list '("◉" "○"))

(save-place-mode 1)
(yas-global-mode 1)

;; fancy org bullets
(add-hook 'c-mode-hook #'rainbow-mode)
(setq doc-view-continuous t);; scrolling in pdf file
