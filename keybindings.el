(global-set-key (kbd "C-c C-r") 'replace-string)

(global-set-key [remap move-beginning-of-line]
                'smarter-move-beginning-of-line)

(global-set-key (kbd "C-c o") 'switch-to-previous-buffer-in-other-window)

(global-set-key (kbd "C-c l") 'org-store-link)
(global-set-key (kbd "C-c C-l") 'org-insert-link)

(add-hook 'emacs-lisp-mode-hook (lambda ()
				  (local-set-key (kbd "C-c C-c") #'my-eval-defun)
				  (company-fuzzy-mode 1)))
