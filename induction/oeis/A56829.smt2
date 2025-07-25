(define-fun
  small
  ((x Int)) Int (div (+ 1 (div (* x x) (+ 1 2))) 2))
(define-fun
  fast
  ((x Int)) Int (+ 1 (div (- (* x x) 2) (+ 2 (+ 2 2)))))
(assert-not
  (forall ((c Int)) (or (not (>= c 0)) (= (small c) (fast c)))))
