(defun read-file (file)
  "Reads the given file in (as a list)"
  (let ((in (open file :if-does-not-exist nil)) 
        (list nil))
    (when in
      (loop for s-expression = (read in nil)
            while s-expression do (setq list (append list (list s-expression))))
      (close in)) list))
