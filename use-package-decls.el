(use-package helm
  :ensure t
  :custom (helm-M-x-fuzzy-match t)
  :bind (("M-x" . helm-M-x)
         ("C-x C-f" . helm-find-files)
	 ("M-y" . helm-show-kill-ring)
	 ("C-x b" . helm-mini)))

(use-package helm-swoop
  :ensure t
  :bind (("C-c a" . helm-swoop)
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
  (setq gc-cons-threshold (* 2 800000))
  (setq read-process-output-max (* 1024 1024))
  :init
  (add-hook 'python-mode-hook #'lsp)
  (add-hook 'go-mode-hook #'lsp))

(use-package company
  :ensure t
  :config
  (setq company-dabbrev-downcase 0)
  (setq company-idle-delay 0.1)
  (setq company-minimum-prefix-length 1)
  :init
  (add-hook 'after-init-hook #'global-company-mode)
  (add-hook 'shell-mode-hook (lambda () (company-mode -1))))

(use-package elpy
  :ensure t)

(use-package flycheck
  :ensure t)

(use-package rustic
  :ensure t
  :config
  (setq rustic-format-on-save nil))

(use-package go-mode
  :ensure t
  :config
  (setq gofmt-command "goimports")
  :init
  (add-hook 'before-save-hook #'gofmt-before-save))

(use-package yaml-mode
  :ensure t)

(use-package dockerfile-mode
  :ensure t)

(use-package terraform-mode
  :ensure t)

(use-package salt-mode
  :ensure t)

(use-package protobuf-mode
  :ensure t)
