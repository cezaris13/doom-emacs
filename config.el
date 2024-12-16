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

;; Magit blame colors
(custom-set-faces
  '(magit-blame-name ((t (:background "#363646" :weight bold))))
  '(magit-blame-summary ((t (:background "#363646" :weight bold))))
  '(magit-blame-heading ((t (:background "#363646" :weight bold))))
  '(magit-blame-hash ((t (:background "#363646" :weight bold))))
  '(magit-blame-date ((t (:background "#363646" :weight bold))))
  )

;; Add custom image to emacs home screen
;; note- if you comment this line, the logo will appear on start screen, but opening new buffer, window, etc. will show doom logo
(setq fancy-splash-image "~/.config/doom/splash/kanagawa.png")

(setq org-directory "~/Desktop/Org_mode/")

;; relative line numbers(like in vim)
(setq display-line-numbers-type 'relative)

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

(setq lsp-rust-server 'rust-analyzer)

(use-package lsp-mode
  :commands lsp
  :custom
  (lsp-auto-guess-root t)
  (lsp-keymap-prefix "M-m l")
  (lsp-modeline-diagnostics-enable nil)
  (lsp-keep-workspace-alive nil)
  (lsp-before-save-edits nil)
  (lsp-eldoc-enable-hover nil)
  (lsp-diagnostics-provider :flycheck)
  (lsp-completion-provider :none)
  (lsp-file-watch-threshold 1500)
  (lsp-enable-links)
  :custom-face
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
  (let (word (get-string-under-cursor))
    (if word
        (projectile-find-references word)
      (projectile-find-references)
      )
    )
  )

(defun get-string-under-cursor ()
  "Get the string (including underscores) under the cursor."
  (interactive)
  (bounds-of-thing-at-point 'symbol)
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
  ;; (setq rustic-format-on-save nil)
  )

(after! tramp-mode
  (setq projectile-mode-line "Projectile")
  ;; (setq rustic-format-on-save nil)
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

(setq dap-auto-configure-features '(sessions locals breakpoints))
(defun my/delete-buffers-by-mode (mode)
  "Delete all buffers with the given major mode."
  (dolist (buf (buffer-list))
    (with-current-buffer buf
      (when (eq major-mode mode)
        (kill-buffer buf)))))

(defun my/delete-dap-buffers-on-termination (&rest _args)
  "Delete buffers with dap-mode when dap session terminates."
  (my/delete-buffers-by-mode 'special-mode))

(add-hook 'dap-terminated-hook 'my/delete-dap-buffers-on-termination)
(add-hook 'dap-terminated-hook #'doom-modeline-update-debug-dap)

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

  (with-eval-after-load 'dap-mode
    (setq dap-default-terminal-kind "integrated")
    (dap-auto-configure-mode +1))

  (map! :map dap-mode-map
        :leader
        :prefix ("d" . "dap")
        ;; basics
        :desc "dap next"          "n" #'dap-next
        :desc "dap step in"       "i" #'dap-step-in
        :desc "dap step out"      "o" #'dap-step-out
        :desc "dap continue"      "c" #'dap-continue
        :desc "dap hydra"         "h" #'dap-hydra
        :desc "dap debug restart" "r" #'dap-debug-restart
        :desc "dap debug"         "s" #'dap-debug
        :desc "dap disconnect"    "q" #'dap-disconnect

        ;; debug
        :prefix ("dd" . "Debug")
        :desc "dap debug recent"  "r" #'dap-debug-recent
        :desc "dap debug last"    "l" #'dap-debug-last

        ;; eval
        :prefix ("de" . "Eval")
        :desc "eval"                "e" #'dap-eval
        :desc "eval region"         "r" #'dap-eval-region
        :desc "eval thing at point" "s" #'dap-eval-thing-at-point
        :desc "add expression"      "a" #'dap-ui-expressions-add
        :desc "remove expression"   "d" #'dap-ui-expressions-remove

        :prefix ("db" . "Breakpoint")
        :desc "dap breakpoint toggle"      "b" #'dap-breakpoint-toggle
        :desc "dap breakpoint condition"   "c" #'dap-breakpoint-condition
        :desc "dap breakpoint hit count"   "h" #'dap-breakpoint-hit-condition
        :desc "dap breakpoint log message" "l" #'dap-breakpoint-log-message))

(defun open-buffer-in-new-frame-and-close-original ()
  "Move the current buffer to a new frame and close the window in the original frame."
  (interactive)
  (let ((buffer (current-buffer)))
    (select-frame (make-frame-command)) ; Create a new frame and switch to it
    (switch-to-buffer buffer)           ; Switch to the current buffer
    (delete-window)))                   ; Close the original window in the main frame

(defun move-buffer-to-existing-frame ()
  "Move the current buffer to another existing frame if one exists."
  (interactive)
  (let ((buffer (current-buffer))
        (frames (delq (selected-frame) (frame-list)))) ; All frames except the current one
    (if frames
        (progn
          (select-frame-set-input-focus (car frames)) ; Switch to the first other frame
          (switch-to-buffer buffer)
          (delete-window)) ; Close the window in the original frame
      (message "No other frames exist."))))

(with-eval-after-load 'rust-mode
  (add-hook 'flycheck-mode-hook #'flycheck-rust-setup)
  (add-hook 'flycheck-mode-hook #'flycheck-inline-mode)
  (add-hook 'lsp-diagnostics-mode-hook #'flycheck-inline-mode)
  (setq-default flycheck-rust-checker 'rustic-clippy)
  )

(setq minimap-window-location 'right)
(custom-set-faces
 '(minimap-active-region-background
   ((t (:background "#363646")))))
