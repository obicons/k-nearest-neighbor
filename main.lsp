(load 'k-nearest-neighbor.lsp)
(load 'file.lsp)

(let ((graph (read-file (nth 0 *args*)))
      (unknown (read-from-string (nth 1 *args*))))
  (format t "Closest points: ~A~%"
          (get-nearest-points (normalize-point unknown
                                               :x-factor (/ 1.0 (get-this-x (append graph (list unknown))))
                                               :y-factor (/ 1.0 (get-this-y (append graph (list unknown)))))
                              (normalize-graph (append graph (list unknown)))
                              :max-size 1)))
