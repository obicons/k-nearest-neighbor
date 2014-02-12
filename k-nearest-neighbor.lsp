;; distance formula
(defun find-distance (point-a point-b)
  "we expect the first and second values in a and b to be x and y respectively." 
  (sqrt (+ (expt (- (car point-a) (car point-b)) 2) (expt (- (cadr point-a) (cadr point-b)) 2))))

;; compares points
(let ((point (list 0 0)))

  (defun set-point (p) 
    (setq point p))

  (defun compare-points (point-a point-b &optional (function #'<))
    (funcall function (find-distance point-a point) (find-distance point-b point))))

(defun get-nearest-points (point graph &key (max-size 3))
  "Returns a list of items closest to the point specified"
  (set-point point)
  (subseq (sort graph #'compare-points) 0 max-size))

(defun cdrdr (list)
  (cdr (cdr list)))

(defun normalize-point (point &key x-factor y-factor)
  (cons (* (car point) x-factor) (cons (* (cadr point) y-factor) (cdrdr point))))

(defun get-this-y (graph &optional (function #'>))
  (let ((this-y (car (cdr (car graph)))))
    (mapcar 
     #'(lambda (point) 
         (if (funcall function (cadr point) this-y) 
             (setq this-y (cadr point))))
     graph)
    this-y))

(defun get-this-x (graph &optional (function #'>))
  (let ((this-x (caar graph)))
    (mapcar 
     #'(lambda (point) 
       (if (funcall function (car point) this-x) 
           (setq this-x (car point))))
     graph)
    this-x))

(defun normalize-graph (graph)
  (let ((greatest-x (get-this-x graph)) (greatest-y (get-this-y graph)) (graph-size (length graph)) (ret (list)))
    (mapcar 
     #'(lambda (point) 
       (setq ret (append ret (list (normalize-point point :x-factor (/ 1.0 greatest-x) :y-factor (/ 1.0 greatest-y))))))
     graph) ret))
