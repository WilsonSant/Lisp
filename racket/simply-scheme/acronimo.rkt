#lang simply-scheme

(define (rember list atom)
(cond
  ((null? list) '())
  (else
  (cond
  ((eq? atom (car list)) (cdr list))
  (else
  (cons (car list) (rember  (cdr list) atom)
   ))
  ))))

(define (removeD phrase)
  (rember (every first phrase) 'd)
  )
  
(define (acronimo frase)
 (accumulate word (removeD frase)))

(acronimo '(Código de Endereçamento Postal))
