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
