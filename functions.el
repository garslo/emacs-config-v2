;; -*- lexical-binding: t -*-

(defun load-el-files-in-directory (directory)
  (if (file-directory-p directory)
      (let ((files (file-expand-wildcards (format "%s/*.el" directory))))
	(dolist (file files)
	  (load file)))))

(load-el-files-in-directory "~/.emacs.d/functions")
