;;;; system-bundler.asd

(asdf:defsystem #:system-bundler
  :description "Bundle one or more ASDF systems, and their
  prerequisites, into a single location."
  :author "Zachary Beane <xach@xach.com>"
  :license "BSD"
  :serial t
  :depends-on ("asdf")
  :components ((:file "package")
               (:file "directory")
               (:file "system-bundler")))

(defmethod perform ((op test-op) (system (eql (find-system "system-bundler"))))
  (asdf:load-system "system-bundler-test")
  (eval (read-from-string "(fiveam:run! 'system-bundler-test:system-bundler)")))
