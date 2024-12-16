#lang info

(define license 'MIT)
(define collection "dynamic-case")
(define version "0.0")

(define pkg-desc "Dynamic Case")

(define deps '("base"))
(define build-deps '("scribble-lib" "rackunit-lib" "racket-doc"))

(define scribblings '(("scribblings/dynamic-case.scrbl")))

(define clean '("compiled" "private/compiled"))
(define test-omit-paths '(#px"^((?!/tests/).)*$"))
