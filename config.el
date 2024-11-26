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
  '(default :background "#1F1F28")
  '(diff-hl-change :foreground "#A86E51")
  )

;; add custom image to emacs home screen
(setq fancy-splash-image "~/.config/doom/splash/kanagawa.png");; note- if you comment this line, the logo will appear on start screen, but opening new buffer, window, etc. will show doom logo

(setq org-directory "~/Desktop/Org_mode/")

(setq display-line-numbers-type 'relative);; relative line numbers(like in vim)

;; linux (works for mx master 3 and M705)
(global-set-key (kbd "<mouse-6>") (lambda () (interactive) (scroll-right 6)))
(global-set-key (kbd "<mouse-7>") (lambda () (interactive) (scroll-left 6)))

;; for MX master 3 mouse (mac)
(global-set-key (kbd "<wheel-right>") (lambda () (interactive) (scroll-left 6)))
(global-set-key (kbd "<wheel-left>") (lambda () (interactive) (scroll-right 6)))

(setq mouse-wheel-tilt-scroll t)

(setq scroll-step 1)
(setq scroll-conservatively 10000)
(setq auto-window-vscroll nil)

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
            :true          "⊤"
            :false         "⊥"
            :int           "ℤ"
            :float         "ℝ"
            :str           "S"
            :bool          "𝔹"
            :list          "L"
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
  ;; mac
  (map! :desc "Open Find file in the project"
        "s-O" #'projectile-find-file))

  ;; linux
  (bind-key* "C-S-o" 'projectile-find-file)

(use-package! neotree
  :config
  ;; Bind s-S-j to open NeoTree to the current file's location (command+shift+j)
  ;; mac
  (map! :desc "Open NeoTree at current file"
        "s-J" #'+neotree/find-this-file))


  ;; linux
  (bind-key* "C-S-j" '+neotree/find-this-file)

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

;; mac
(map! :desc "Find references of the word under cursor in the project"
      "s-F" 'find-references-under-cursor)

;; linux
(bind-key* "C-S-f" 'find-references-under-cursor)

(global-set-key [f12] 'xref-find-definitions)

;; mac
(map! :desc "Find definition under cursor"
      "s-<mouse-1>" 'xref-find-definitions)

;; linux
(map! :desc "Find definition under cursor"
      "S-s-<mouse-1>" 'xref-find-definitions)

(map! :desc "Split window vertically"
      "C-\\" 'evil-window-vsplit)

(map! :desc "Comment code in the file"
      "C-/" 'comment-line)

;; TODO
(after! typescript-mode
  (map! :desc "Format region or buffer" ;; fix this, in python it is formatter with this.
        "s-L" `tide-format)
  )

;; mac
(map! :desc "Format region or buffer"
      "s-L" `+format/region-or-buffer)

;; linux
(bind-key* "C-S-l" '+format/region-or-buffer)

;; (defface popup-tip-face-1
;;   '((t (:background "red" :foreground "black")))
;;   "Face for popup tip."
;;   :group 'popup)

;; ;; (setq! popup-tip-face popup-tip-face1)

;; ;; (add-hook 'git-messenger:before-popup-hook
;; ;;           (lambda ()
;; ;;             (setq-local popup-face 'git-messenger-popup-face)))
;; ;; Use `before-popup-hook` to customize popup style
;; (add-hook 'git-messenger:before-popup-hook
;;           (lambda (message)
;;             (setq-local popup-tip-face 'popup-tip-face-1)))
;; TODO
(setq! git-messenger:use-magit-popup t)
(map! :desc "Show git blame under the cursor"
      "s-B" 'git-messenger:popup-message)

;; seems to override any other existing commands
(bind-key* "C-<tab>" 'next-buffer)
(bind-key* "C-S-<tab>" 'previous-buffer)
;; for linux
(bind-key* "C-<iso-lefttab>" 'previous-buffer)

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

;; rainbow mode for braces
(add-hook 'c-mode-hook #'rainbow-mode)
;; scrolling in pdf file
(setq doc-view-continuous t)

(with-eval-after-load 'tramp
  (eval-when-compile (require 'tramp))
  (add-to-list 'tramp-remote-path 'tramp-own-remote-path)
  (setq tramp-completion-use-auth-sources nil)
  (setq rustic-format-on-save nil)
  )

(after! tramp-mode
  (setq projectile-mode-line "Projectile")
  (setq rustic-format-on-save nil)
  (setq tramp-completion-method 'fuzzy)
  (setq completion-ignore-case t)
  (setq tramp-default-remote-shell "/bin/bash")
  )

(after! eshell
    (setq eshell-banner-message
        (format "%s %s\n"
            (propertize (format " %s " (string-trim (buffer-name)))
                'face 'doom-modeline-panel)
            (propertize
                (current-time-string)
                'face 'font-lock-keyword-face
            )
         )
    )
   ;; disable company mode in remote
    ;; (add-hook! 'eshell-directory-change-hook
    ;;     (company-mode
    ;;        (if (file-remote-p default-directory)
    ;;            -1
    ;;            +1
    ;;        )
    ;;     )
    ;; )
)

(after! dap-mode
  (require 'dap-cpptools)

 (add-hook 'rustic-mode-hook (lambda ()
   (dap-register-debug-template "Rust LLDB Debug Configuration"
	                        (list :type "cppdbg"
	                              :request "launch"
	                              :name "Rust::Run"
	                              :MIMode "lldb"
                                      :targetarchitecture "arm"
	                              :gdbpath "rust-lldb"
	                              ;; :program (concat (projectile-project-root) "target/debug/" (projectile-project-name)) ;; Requires that the rust project is a project in projectile
	                              ;; :cwd (projectile-project-root)
                                      :program "${workspaceFolder}/target/debug/${workspaceFolderBasename}"
                                      :cwd "${workspaceFolder}"
	                              :environment []
                                      ))))

   (setq lsp-rust-analyzer-debug-lens-extra-dap-args
        `(:MIMode "lldb"
          ;; :miDebuggerPath "rust-gdb"
          ;; :miDebuggerPath "rust-lldb"
          :stopAtEntry t
          :externalConsole
          :json-false))

  )
