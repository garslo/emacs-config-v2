
(defun get-revision-from-line (line)
  (let ((parts (string-split line)))
    (cl-loop for part in parts
	     if (string-prefix-p "rev=\"" part)
	     return (string-trim (string-remove-prefix "rev=" part) "\""  "\""))))

(defun get-current-polaris-gslb-revision ()
  (beginning-of-buffer)
  (let ((revision '()))
    (while (and
	    (not revision)
	    (not (eobp)))
      (let ((line (thing-at-point 'line t)))
	(if (string-match-p "ssh://git@github.com:22/netSkopePlatformEng/polaris-gslb.git" line)
	 (setq revision (get-revision-from-line line))))
      (forward-line))
    revision))

(defun update-polaris-gslb-revision (new-revision)
  (interactive "snew revision: ")
  (save-excursion
    (let ((current-revision (get-current-polaris-gslb-revision)))
      (if (not current-revision)
	  (message "Could not find current polaris-gslb revision")
	(progn
	  (beginning-of-buffer)
	  (replace-string current-revision new-revision t))
	(message (format "Revision updated from %s to %s" current-revision new-revision))))))
