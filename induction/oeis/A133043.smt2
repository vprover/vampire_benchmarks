(define-fun
  small
  ((x Int)) Int (+ (+ 2 (- 2 (div (- 2 x) (+ 2 x)))) x))
(define-fun
  fast
  ((x Int)) Int
  (+ 1 (+ 2 (+ (ite (<= (- x 2) 0) (ite (<= x 0) 0 1) 2) x))))
(assert-not
  (forall ((c Int)) (or (not (>= c 0)) (= (small c) (fast c)))))
