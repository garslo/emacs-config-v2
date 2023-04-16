;; -*- lexical-binding: t -*-

(load "~/.emacs.d/functions.el")
(load "~/.emacs.d/package-repos.el")
(load "~/.emacs.d/ensure-use-package.el")
(load "~/.emacs.d/use-package-decls.el")
(load "~/.emacs.d/usability.el")
(load "~/.emacs.d/keybindings.el")
(load-if-exists "~/.emacs.d/local.el")
(put 'dired-find-alternate-file 'disabled nil)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(lisp-mode-hook
   '((lambda nil
       (add-hook 'font-lock-extend-region-functions 'slime-extend-region-for-font-lock t t))
     common-lisp-lisp-mode-hook slime-lisp-mode-hook))
 '(package-selected-packages
   '(helm-flx flx company-fuzzy plz helm-tree-sitter tree-sitter tree-sitter-langs helm-notmuch notmuch company-irony company-irony-c-headers flycheck-irony irony irony-eldoc company-c-headers geiser-racket flymake-racket geiser-guile hy-mode slime-company puni bui helm-sly gh geiser geiser-chicken cider clojure-mode helm-cider helm-cider-history racket-mode org-modern svelte-mode typescript-mode org-roam helm-sage sage-shell-mode avy avy-process terraform-mode dockerfile-mode yaml-mode electric-indent-mode electric-mode use-package)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
(put 'narrow-to-region 'disabled nil)
(put 'set-goal-column 'disabled nil)
