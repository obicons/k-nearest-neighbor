;;; Copyright (C) 2014 Maxwell Taylor
;;;
;;; This program is free software: you can redistribute it and/or modify
;;; it under the terms of the GNU General Public License as published by
;;; the Free Software Foundation, either version 3 of the License, or
;;; (at your option) any later version.
;;; 
;;; This program is distributed in the hope that it will be useful,
;;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;;; GNU General Public License for more details.
;;;
;;; You should have received a copy of the GNU General Public License
;;; along with this program.  If not, see <http://www.gnu.org/licenses/>.

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
