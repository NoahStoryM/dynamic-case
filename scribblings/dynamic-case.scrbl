#lang scribble/manual

@(require (for-label racket/base case/quasi))

@title{Dynamic Case}
@defmodule[case/quasi #:packages ("dynamic-case")]
@author[@author+email["Noah Ma" "noahstorym@gmail.com"]]

@section{Variants of @racket[case*]}

@deftogether[(
@defform[(case* val-expr case-clause ...)]
@defform[(case*/equal val-expr case-clause ...)]
@defform[(case*/equal-always val-expr case-clause ...)]
@defform[(case*/eq val-expr case-clause ...)]
@defform[(case*/eqv val-expr case-clause ...)]
)]{

Like @racket[case], but uing @racket[quasiquote] for each @racket[datum]
in the @racket[case-clause]s instead of @racket[quote].
@racket[case*/equal] is an alias for @racket[case*].}
