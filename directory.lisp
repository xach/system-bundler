;;;; directory.lisp

(in-package #:system-bundler)

(defun subdirectoryp (pathname possible-parent)
  "Return true if the directory of PATHNAME is a subdirectory of the
directory of POSSIBLE-PARENT. Both pathnames must be normalized prior
to calling."
  (let ((prefix (pathname-directory possible-parent))
        (sequence (pathname-directory pathname)))
    (loop
      (when (null prefix)
        (return t))
      (when (null sequence)
        (return nil))
      (let ((p (pop prefix))
            (s (pop sequence)))
        (unless (equal p s)
          (return nil))))))
