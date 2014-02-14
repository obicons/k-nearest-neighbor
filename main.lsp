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

(load 'k-nearest-neighbor.lsp)
(load 'file.lsp)

(defmacro given (this file-name what is unknown)
  "This macro should be used by the user to process his data."
  `(let ((graph (read-file ,file-name)))
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
