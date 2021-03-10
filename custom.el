(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(company-idle-delay 0.1)
 '(company-meghanada-prefix-length 3)
 '(cua-mode t nil (cua-base))
 '(custom-safe-themes
   '("990e24b406787568c592db2b853aa65ecc2dcd08146c0d22293259d400174e37" "4bca89c1004e24981c840d3a32755bf859a6910c65b829d9441814000cf6c3d0" "aaa4c36ce00e572784d424554dcc9641c82d1155370770e231e10c649b59a074" default))
 '(fancy-splash-image nil)
 '(horizontal-scroll-bar-mode nil)
 '(lsp-modeline-code-actions-enable t)
 '(lsp-ui-sideline-enable nil)
 '(lsp-ui-sideline-show-hover nil)
 '(mouse-wheel-tilt-scroll t)
 '(org-agenda-files
   '("~/Desktop/Org_mode/droutine.org" "~/Desktop/Org_mode/org-mode.org"))
 '(org-agenda-log-mode-items '(closed clock state))
 '(org-agenda-time-grid
   '((daily today require-timed)
     (800 1000 1200 1400 1600 1800 2000)
     "......" "----------------"))
 '(org-scheduled-past-days 0)
 '(org-todo-keyword-faces
   '(("[-]" . +org-todo-active)
     ("STRT" . +org-todo-active)
     ("[?]" . +org-todo-onhold)
     ("WAIT" . +org-todo-onhold)
     ("HOLD" . +org-todo-onhold)
     ("PROJ" . +org-todo-project)
     ("LECTURE" . +org-todo-lecture)
     ("NO" . +org-todo-cancel)
     ("KILL" . +org-todo-cancel)))
 '(org-todo-keywords
   '((sequence "TODO(t)" "PROJ(p)" "LOOP(R)" "STRT(s)" "WAIT(w)" "LECTURE(l)" "ROUTINE(r)" "HOLD(h)" "IDEA(i)" "|" "DONE(d)" "KILL(k)")
     (sequence "[ ](T)" "[-](S)" "[?](W)" "|" "[X](D)")
     (sequence "|" "OKAY(o)" "YES(y)" "NO(n)")))
 '(org-todo-repeat-to-state t)
 '(package-selected-packages
   '(helm company-lsp xresources-theme evil-multiedit auto-complete yasnippet-snippets lsp-javacomp emojify minimap quickrun meghanada lsp-java scroll-restore sublimity fast-scroll company-irony irony rainbow-mode treemacs-perspective treemacs-projectile nix-haskell-mode pager-default-keybindings smooth-scrolling))
 '(scroll-preserve-screen-position t)
 '(send-mail-function 'mailclient-send-it))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
(put 'customize-variable 'disabled nil)
