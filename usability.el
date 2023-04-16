(when (display-graphic-p)
  (tool-bar-mode -1)
  (scroll-bar-mode -1)
  (set-face-attribute 'default nil :height 100) ; :height 100 => 10pt
  )
(menu-bar-mode -1)
(load-theme 'tango-dark) ; if not working in terminal, ensure TERM=xterm-256color is set
(setq inhibit-splash-screen t)
(setq echo-keystrokes 0.1)
(setq column-number-mode t)
(setq default-tab-width 4)
(fset 'yes-or-no-p 'y-or-n-p)
(add-hook 'before-save-hook 'delete-trailing-whitespace)
(add-to-list 'backup-directory-alist '(".*" . "~/.backup")) ; save backup files in a central location
(setq default-directory "~/")		; start in $HOME
(setq ns-command-modifier (quote meta))	; allow use of Mac Command key as meta
(electric-pair-mode t)
(put 'dired-find-alternate-file 'disabled nil)
(global-unset-key (kbd "C-z"))
