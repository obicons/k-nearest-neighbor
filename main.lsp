(load 'k-nearest-neighbor.lsp)
(load 'file.lsp)

(defmacro given (this file-name what is unknown)
  `(let  ((graph (read-file ,file-name)))
    (get-nearest-points (normalize-point ,unknown
                                         :x-factor (/ 1.0 (get-this-x (append graph (list ,unknown))))
                                         :y-factor (/ 1.0 (get-this-y (append graph (list ,unknown)))))
                        (normalize-graph graph)
                        :max-size 1)))

(defun args-to-list (command-args)
  "Converts the given command line arguments to an eval'able list."
  (let ((arg-list nil))
    (mapcar #'(lambda (arg)
                (setq arg-list (append arg-list (list (read-from-string arg)))))
            command-args)
    arg-list))

(format t "~A~%" (eval (args-to-list *args*)))
