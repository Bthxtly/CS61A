(define (ascending? s)
  (if (or (null? s) (null? (cdr s)))
    #t
    (and (<= (car s) (car (cdr s)))
         (ascending? (cdr s)))))

(define (my-filter pred s)
  (if (null? s)
      '()
      (if (pred (car s))
          (cons (car s) (my-filter pred (cdr s)))
          (my-filter pred (cdr s)))))

(define (interleave lst1 lst2)
  (cond
    ((null? lst1) lst2)
    ((null? lst2) lst1)
    (else (cons (car lst1)
                (cons (car lst2)
                      (interleave (cdr lst1) (cdr lst2)))))))

(define (no-repeats s)
  (define (exist? n seq)
    (cond
      ((null? seq) #f)
      ((= n (car seq)) #t)
      (else (exist? n (cdr seq)))))
  (if (null? s)
      '()
      (if (exist? (car s) (cdr s))
          (no-repeats (cdr s))
          (cons (car s) (no-repeats (cdr s))))))

; answer:
; (define (no-repeats s)
;   (if (null? s) s
;     (cons (car s)
;       (no-repeats (filter (lambda (x) (not (= (car s) x))) (cdr s))))))
