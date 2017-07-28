;;;; system-bundler.lisp

(in-package #:system-bundler)

;;; "system-bundler" goes here. Hacks and glory await!


(defun known-systems ()
  (let ((result '()))
    (asdf:map-systems (lambda (system)
                        (push system result)))
    result))

(defun clear-all-systems ()
  (asdf:map-systems 'asdf:clear-system))

(defun find-system (name)
  (clear-all-systems)
  (let* ((systems-before (known-systems))
         (system (asdf:find-system name nil))
         (systems-after (and system (known-systems))))
    (when system
      (values system
              (remove system
                      (set-difference systems-after systems-before))))))

(defun required-systems (name)
  (multiple-value-bind (system defsystem-required-systems)
      (find-system name)
    (when system
      (append (asdf:system-depends-on system)
              defsystem-required-systems))))
