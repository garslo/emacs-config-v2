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
  :config
  (elpy-enable)
  :ensure t)

(use-package pyenv-mode
  :ensure t
  :init (pyenv-mode))

(use-package virtualenvwrapper
  :ensure t)

(use-package flycheck
  :ensure t)

(use-package rustic
  :ensure t
  :config
  (setq rustic-format-on-save nil)
  :init
  (add-hook 'rustic-mode-hook (lambda () (add-hook 'before-save-hook #'lsp-format-buffer nil 'local))))

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

(use-package display-line-numbers
  :ensure t
  :config
  (setq display-line-numbers-type 't)
  :init
  (global-display-line-numbers-mode 1)
  (add-hook 'org-mode-hook 'display-line-numbers-mode))

(use-package subword
  :init (global-subword-mode t))

(use-package org)

(use-package request
  :ensure t)

;; (use-package evil
;;   :ensure t
;;   :config
;;   (evil-mode 1))

;; (use-package key-chord
;;   :ensure t
;;   :config
;;   (key-chord-mode 1)
;;   (key-chord-define evil-insert-state-map  "jk" 'evil-normal-state))

(use-package avy
  :ensure t
  :config
  (setq avy-timeout-seconds 0.3)
  :bind
  ("C-c ;" . avy-goto-char-timer)
  ("C-c C-;" . avy-goto-char-2))

(use-package lua-mode
  :ensure t)

(use-package jenkinsfile-mode
  :ensure t)
