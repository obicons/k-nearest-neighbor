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

(defun read-file (file)
  "Reads the given file in (as a list)"
  (let ((in (open file :if-does-not-exist nil)) 
        (list nil))
    (when in
      (loop for s-expression = (read in nil)
            while s-expression do (setq list (append list (list s-expression))))
      (close in)) list))
