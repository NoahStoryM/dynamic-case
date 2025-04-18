#lang racket/base

(require "../quasi.rkt" rackunit)


(for ([p (in-list (list (cons  '- "symbol")
                        (cons ',- "(list 'unquote symbol)")
                        (cons   - "procedure")
                        (cons  '$ "none")))])
  (check-equal?
   (cdr p)
   (case* (car p)
     [(   +    -    *    /) "symbol"]
     [(,',+ ,',- ,',* ,',/) "(list 'unquote symbol)"]
     [(  ,+   ,-   ,*   ,/) "procedure"]
     [else "none"])))
