;; distance formula
(defun find-distance (point-a point-b)
  "we expect the first and second values in a and b to be x and y respectively." 
  (sqrt (+ (expt (- (car point-a) (car point-b)) 2) (expt (- (cadr point-a) (cadr point-b)) 2))))

(defun get-nearest-points (point graph &key (max-size 3))
  "Returns a list of items closest to the point specified"
  (subseq (sort graph #'(lambda (p1 p2)
                          (if (< (find-distance p1 point) (find-distance p2 point)) 
                              t
                            nil))) 0 max-size))

(defun cdrdr (list)
  (cdr (cdr list)))

(defun normalize-point (point &key x-factor y-factor)
  (cons (* (car point) x-factor) (cons (* (cadr point) y-factor) (cdrdr point))))

(defun get-this-y (graph &optional (function #'>))
  "Returns the point whose y-value satisfies function the best."
  (labels ((iterate (ls num-acc)
                    (if (equal nil ls)
                        num-acc
                      (iterate (cdr ls)
                               (if (funcall function (cadar ls) num-acc)
                                   (cadar ls)
                                 num-acc)))))
    (iterate graph (cadar graph))))

(defun get-this-x (graph &optional (function #'>))
  "Returns the point whose x-value satisfies function the best."
  (labels ((iterate (ls num-acc)
                    (if (equal nil ls)
                        num-acc
                      (iterate (cdr ls)
                               (if (funcall function (caar ls) num-acc)
                                   (caar ls)
                                 num-acc)))))
    (iterate graph (caar graph))))

(defun normalize-graph (graph)
  (let ((greatest-x (get-this-x graph)) (greatest-y (get-this-y graph)))
    (labels ((normalize (grph)
                        (if (equal grph nil)
                            nil
                          (cons (normalize-point (car grph)
                                                 :x-factor (/ 1.0 greatest-x)
                                                 :y-factor (/ 1.0 greatest-y))
                                (normalize (cdr grph))))))
      (normalize graph))))                                  
