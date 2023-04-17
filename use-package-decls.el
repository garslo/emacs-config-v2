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

(use-package puni
  :ensure t
  :config
  (setq puni-confirm-when-delete-unbalanced-active-region nil)
  (puni-global-mode t)
  :bind (("M-(" . puni-wrap-round)
	 ("M-[" . puni-wrap-square)
	 ("M-{" . puni-wrap-curly)))

(use-package lsp-mode
  :ensure t
  :config
  (setq lsp-enable-snippet nil)
  (setq gc-cons-threshold (* 2 800000))
  (setq read-process-output-max (* 1024 1024))
  :init
  (add-hook 'python-mode-hook #'lsp)
  (add-hook 'go-mode-hook #'lsp))

(use-package paredit
  :ensure t
  :config
  (dolist (m '(emacs-lisp-mode-hook
	       lisp-mode-hook
               racket-mode-hook
               racket-repl-mode-hook
	       clojure-mode-hook
	       scheme-mode-hook))
    (progn
      (remove-hook m #'puni-mode)
      (add-hook m #'paredit-mode)))
  (bind-keys :map paredit-mode-map
             ("{"   . paredit-open-curly)
             ("}"   . paredit-close-curly)
	     ("M-s" . paredit-splice-sexp))
  (unless terminal-frame
    (bind-keys :map paredit-mode-map
               ("M-[" . paredit-wrap-square)
               ("M-{" . paredit-wrap-curly))))

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
  (setq display-line-numbers-type 'absolute)
  :init
  (global-display-line-numbers-mode 1)
  (add-hook 'org-mode-hook 'display-line-numbers-mode))

(use-package subword
  :init (global-subword-mode t))

(use-package org
  :ensure t
  :config
  (setq org-src-preserve-indentation t)
  (setq org-confirm-babel-evaluate nil)
  (org-babel-do-load-languages
   'org-babel-load-languages '((emacs-lisp . t)
			       (python . t)
			       (shell . t))))

(use-package request
  :ensure t)

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

(use-package racket-mode
  :ensure t
  :mode "\\.rkt\\'")

(use-package cider
  :ensure t)

(use-package clojure-mode
  :ensure t)

(use-package slime
  :ensure t
  :config
  (slime-setup '(slime-fancy slime-company)))

(use-package bui
  :ensure t)

(use-package js
  :ensure t
  :config
  (setq js-indent-level 2))

;; (use-package flx
;;   :ensure t)

;; (use-package company-fuzzy
;;   :ensure t
;;   :hook (company-mode . company-fuzzy-mode)
;;   :init
;;   (setq company-fuzzy-sorting-backend 'flx
;; 	company-fuzzy-prefix-on-top nil
;; 	company-fuzzy-trigger-symbols '("." "->" "<" "\"" "'" "@")
;;    ))
