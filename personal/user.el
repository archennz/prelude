(global-hl-line-mode 0)

(scroll-bar-mode -1)

(blink-cursor-mode 1)



;; enable elpy
;; (elpy-enable)

;;pipenv settings
;;(setq elpy-rpc-virtualenv-path current)

;; indentation lines
(use-package highlight-indent-guides
  :config (setq highlight-indent-guides-method 'character)
  :hook (prog-mode . highlight-indent-guides-mode))

;; python related packages
(use-package elpy
  :init(defun elpy--my-config ()
           (highlight-indentation-mode 0))
  :hook (python-mode . elpy-enable)
  (elpy-mode . elpy--my-config)
  :diminish)
(use-package pipenv
  :hook (python-mode . pipenv-mode))

;; javascript related packages
(add-to-list 'auto-mode-alist '("\\.js\\'" . rjsx-mode))

(use-package tern
  :hook (js2-mode . (lambda () (tern-mode t))))

;; typescript
(add-to-list 'auto-mode-alist '("\\.tsx\\'" . typescript-mode))

;; configuring snippets
(use-package yasnippet
  :ensure t
  :config (use-package yasnippet-snippets
            :ensure t)
  (yas-reload-all))
(yas-global-mode 1)


;; other general settings
(use-package ivy
  :diminish)

;; stop telling me off when I use up/down
(defun disable-guru-mode ()
  (guru-mode -1)
  )
(add-hook 'prelude-prog-mode-hook 'disable-guru-mode t)

;; turn off whitespace
(setq prelude-whitespace nil)

;; doom mode line
(use-package doom-modeline
  :ensure t
  :init (doom-modeline-mode 1))
