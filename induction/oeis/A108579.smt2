(define-fun
  small
  ((x Int)) Int (- (* (div (- x 1) 2) (div x 2)) (div x (+ 1 2))))
(define-fun
  fast
  ((x Int)) Int
  (- (- 0 (div x (+ 1 2))) (div (* (- 2 x) x) (+ 2 2))))
(assert-not
  (forall ((c Int)) (or (not (>= c 0)) (= (small c) (fast c)))))
