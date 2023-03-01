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
 '(package-selected-packages
   '(puni puni-mode bui cider ac-slime auto-complete helm-slime slime slime-company slime-repl-ansi-color geiser geiser-racket racket-mode wsd-mode markdown-toc svelte-mode jenkinsfile-mode avy key-chord evil request protobuf-mode virtualenvwrapper pyenv-mode salt-mode terraform-mode dockerfile-mode yaml-mode electric-indent-mode electric-mode use-package)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
(put 'narrow-to-region 'disabled nil)
(put 'set-goal-column 'disabled nil)
