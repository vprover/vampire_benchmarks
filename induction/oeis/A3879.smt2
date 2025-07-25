(define-fun
  small
  ((x Int)) Int (+ 1 (+ (ite (<= (- x 2) 0) (mod x 2) 2) x)))
(define-fun
  fast
  ((x Int)) Int
  (+ 1 (ite (<= (- x 2) 0) (ite (<= x 0) 0 2) (+ x 2))))
(assert-not
  (forall ((c Int)) (or (not (>= c 0)) (= (small c) (fast c)))))
