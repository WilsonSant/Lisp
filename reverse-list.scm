(define insertLast
  (lambda (a lat)
    (cond
     ((null? lat) (cons a lat))
     (else (cons (car lat) (insertLast a (cdr lat)))
      )
     )
    )
  )

(define rev
  (lambda (lat)
    (cond
     ((null? lat) (quote ()))
     ((null? (cdr lat)) lat)
     (else
      (insertLast (car lat) (rev1 (cdr lat)) )))))

