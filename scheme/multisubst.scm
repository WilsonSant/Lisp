(define multisubst
  (lambda (old new lat)
    (cond
     ((null? lat) (quote ()))
     (else (cond
	    ((eq? (car lat) old) (multisubst old new (cons new (cdr lat))))
	    (else (cons (car lat) (multisubst old new (cdr lat))))
	    )
      ))))
