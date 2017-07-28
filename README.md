# system-bundler

system-bundler will take one or more ASDF system names and bundle them
into a single directory, including their prerequisites. The resulting
"bundle" can be loaded without fetching any additional software.

Does not deal with foreign library dependencies.

Usage:

    (system-bundler:bundle "vecto" :to "/tmp/vecto-bundle/")

After that, (load "/tmp/vecto-bundle/bundle.lisp") will set up an
environment where "vecto" can be loaded via ASDF without using any
additional systems from outside the bundle.



