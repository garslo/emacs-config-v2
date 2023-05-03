;; -*- lexical-binding: t -*-

(defun smarter-move-beginning-of-line (arg)
  "Move point back to indentation of beginning of line.

Move point to the first non-whitespace character on this line.
If point is already there, move to the beginning of the line.
Effectively toggle between the first non-whitespace character and
the beginning of the line.

If ARG is not nil or 1, move forward ARG - 1 lines first.  If
point reaches the beginning or end of the buffer, stop there."
  (interactive "^p")
  (setq arg (or arg 1))

  ;; Move lines first
  (when (/= arg 1)
    (let ((line-move-visual nil))
      (forward-line (1- arg))))

  (let ((orig-point (point)))
    (back-to-indentation)
    (when (= orig-point (point))
      (move-beginning-of-line 1))))


(defvar electrify-return-match
  "[\]}\)\"]"
  "If this regexp matches the text after the cursor, do an \"electric\"
return.")

(defun electrify-return-if-match (arg)
  "If the text after the cursor matches `electrify-return-match' then
open and indent an empty line between the cursor and the text. Move the
cursor to the new line."
  (interactive "P")
  (electric-newline-and-maybe-indent))

(fset 'switch-to-previous-buffer-in-other-window
	  (lambda (&optional arg) "Keyboard macro." (interactive "p") (kmacro-exec-ring-item (quote ("obo" 0 "%d")) arg)))

(defun output-of (command)
  (substring (shell-command-to-string command) 0 -1))

(defun github-link ()
  (interactive)
  (let*
      ((git-local-filename (output-of (concat "git ls-files --full-name " (buffer-file-name))))
       (git-branch (output-of "git rev-parse --abbrev-ref HEAD"))
       (github-remote-url (output-of "git config --get remote.origin.url"))
       (base (format "https://%s" (s-replace-all
				   '(("git@" . "")
				     (".git" . "")
				     (":" . "/"))
				   github-remote-url))))
    (message (format "%s/blob/%s/%s#L%s" base git-branch git-local-filename (line-number-at-pos)))))

(defun load-if-exists (elisp-file)
  (if (file-exists-p elisp-file)
    (load elisp-file)))


(defun remove-all-whitespace (beginning end)
  (interactive "r")
  (save-excursion
    (goto-char beginning)
    (while (< (point) end)
      (if (looking-at "[ \t\n]+")
	  (progn
	    (delete-char 1)
	    (setq end (- end 1)))
	(forward-char)))))

(defmacro comment (&rest _) ())

(defun add-to-emacs-path (path)
  (setenv "PATH" (concat (getenv "PATH") ":" path))
  (setq exec-path (append exec-path `(,path))))

(defun align-non-space (BEG END)
  "Align non-space columns in region BEG END."
  (interactive "r")
  (align-regexp BEG END "\\(\\s-*\\)\\S-+" 1 1 t))

(defun dotted-to-hash ()
  "converts a.b to a[\"b\"]"
  (interactive)
  (let ((terminal-regexp (rx (in "." space "\n" "(" "["))))
    (search-forward ".")
  (backward-char)
  (delete-char 1)
  (insert "[\"")
  (search-forward-regexp (rx (or (char ".") (char space) (char "\n"))))
  (backward-char)
  (insert "\"]")))

(defun dotted-to-hash-region (start end)
  (interactive "r")
  (save-excursion
    (message (format "%s" (point)))
    (goto-char start)
    (message (format "%s" (point)))
    (while (< (point) end)
      (dotted-to-hash))))

(defun gs-eval-defun ()
  "like eval-defun, but pulses the evaluated defun"
  (interactive
   (save-excursion
     (mark-defun)
     (eval-defun nil)
     (pulse-momentary-highlight-region (region-beginning) (region-end))
     (deactivate-mark))))

(defun gs--org-table-header (columns)
  "inserts a org-table header with `columns' as column names"
  (cl-loop for column in columns
	   do (insert (format "| %s " column)))
  (insert (format "\n|-\n")))

(defun gs--org-table-row (values)
  "inserts a org-table row with `values' as values"
  (cl-loop for value in values
	   do (insert (format "| %s " value)))
  (insert "\n"))

;; Example
;; (gs-org-table-build '("first" "second" "third")
;; 		    '((1 2 3)
;; 		      (3 4 5)
;; 		      (12 44 "this is very very long"))
;; 		    (current-buffer))
(defun gs-org-table-build (columns rows)
  "columns: list, rows: list of list"
  (gs--org-table-header columns)
  (cl-loop for row in rows
	   do (gs--org-table-row row))
  (org-table-align))

(defun gs-org-table-from-fn (fn columns inputs)
  "build an org-table with `columns' as the column names, and the
   rows taken from applying `fn' to each of `inputs'"
  (let ((rows (cl-loop for input in inputs
		       collect (apply fn input))))
    (gs-org-table-build columns rows)))

(defun clang-format-save-hook-for-this-buffer ()
  "Create a buffer local save hook."
  (add-hook 'before-save-hook
            (lambda ()
              (when (locate-dominating-file "." ".clang-format")
                (clang-format-buffer))
              ;; Continue to save.
              nil)
            nil
            ;; Buffer local hook.
            t))
