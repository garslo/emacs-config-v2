(use-package helm
  :ensure t
  :custom (helm-M-x-fuzzy-match t)
  :bind (("M-x" . helm-M-x)
         ("C-x C-f" . helm-find-files)
	 ("M-y" . helm-show-kill-ring)
	 ("C-x b" . helm-mini)))

(use-package helm-swoop
  :ensure t
  :bind (("C-c C-s" . helm-swoop)
	 ("C-c ma" . helm-multi-swoop-all)))

(use-package helm-projectile
  :ensure t)

(use-package helm-ls-git
  :ensure t
  :bind (("C-x f" . helm-ls-git-ls)))

(use-package magit
  :ensure t
  :bind (("C-c C-g" . magit-status)))

(use-package paredit
  :ensure t
  :init
  (add-hook 'emacs-lisp-mode-hook #'paredit-mode)
  (add-hook 'lisp-mode-hook #'paredit-mode))

(use-package lsp-mode
  :ensure t
  :config
  (setq lsp-enable-snippet nil)
  :init
  (add-hook 'python-mode-hook #'lsp)
  (add-hook 'go-mode-hook #'lsp))

(use-package company
  :ensure t
  :config
  (setq company-dabbrev-downcase 0)
  (setq company-idle-delay 0.1)
  (setq company-minimum-prefix-length 0)
  :init
  (add-hook 'after-init-hook #'global-company-mode))

(use-package elpy
  :ensure t)

(use-package flycheck
  :ensure t)

(use-package rustic
  :ensure t)

(use-package go-mode
  :ensure t
  :config
  (setq gofmt-command "goimports")
  :init
  (add-hook 'before-save-hook #'gofmt-before-save))