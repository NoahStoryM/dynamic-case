#lang racket/base

(require (for-syntax racket/base syntax/parse)
         racket/match)

(provide (rename-out [case*/equal case*])
         case*/equal
         case*/equal-always
         case*/eq
         case*/eqv)


(define-for-syntax ((make-case* compare-id) stx)
  (syntax-parse stx
    #:datum-literals (else)
    [(_ v)
     (syntax/loc stx (void v))]
    [(_ v [else e* ...+])
     (syntax/loc stx (begin v (let () e* ...)))]
    [(self v [(k ...+) e* ...+] ...)
     (syntax/loc stx (self v [(k ...) e* ...] ... [else (void)]))]
    [(_ v [(k ...+) e* ...+] ... [else x* ...+])
     (quasisyntax/loc stx
       (match v
         [(or (== `k #,compare-id) ...) e* ...]
         ...
         [_ x* ...]))]))

(define-syntax case*/equal
  (make-case* #'equal?))
(define-syntax case*/equal-always
  (make-case* #'equal-always?))
(define-syntax case*/eq
  (make-case* #'eq?))
(define-syntax case*/eqv
  (make-case* #'eqv?))
