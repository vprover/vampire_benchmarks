(define-fun
  small
  ((x Int)) Int (mod (- 0 x) (+ 1 (* (div x 2) x))))
(define-fun
  fast
  ((x Int)) Int (+ 1 (- (* (div x 2) x) (ite (<= x 0) 1 x))))
(assert-not
  (forall ((c Int)) (or (not (>= c 0)) (= (small c) (fast c)))))
