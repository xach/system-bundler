;;;; test.lisp

(defpackage #:system-bundler-test
  (:use #:cl #:fiveam)
  (:import-from #:system-bundler
                #:subdirectoryp)
  (:export #:system-bundler))

(in-package #:system-bundler-test)

(def-suite system-bundler)

(def-suite directory :in system-bundler)

(in-suite directory)

(test subdirectoryp
  (is (subdirectoryp "/tmp/x/" "/tmp/"))
  (is (subdirectoryp "/tmp/" "/"))
  (is (subdirectoryp "/home/xach/src/code/" "/home/xach/src/"))
  (is (not (subdirectoryp "/bob/" "/rob/")))
  (is (not (subdirectoryp "/home/xach/src/vecto/" "/home/xach/src/zs3/"))))



