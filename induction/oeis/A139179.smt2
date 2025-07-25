(define-fun
  small
  ((x Int)) Int (div (- (* x x) (div (div (div x 2) 2) 2)) (+ 1 x)))
(define-fun
  fast
  ((x Int)) Int
  (- (ite (<= x 0) 1 x) (ite (<= (- (* 2 (* 2 (+ 2 2))) x) 0) 2 1)))
(assert-not
  (forall ((c Int)) (or (not (>= c 0)) (= (small c) (fast c)))))
