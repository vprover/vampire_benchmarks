(define-fun
  small
  ((x Int)) Int (+ 1 (div (- 2 (div x 2)) (+ 2 x))))
(define-fun
  fast
  ((x Int)) Int
  (ite (<= (+ 2 (+ 2 (- 2 x))) 0) 0 (ite (<= x 0) 2 1)))
(assert-not
  (forall ((c Int)) (or (not (>= c 0)) (= (small c) (fast c)))))
