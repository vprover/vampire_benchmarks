(define-fun
  small
  ((x Int)) Int
  (div (+ (div (- 2 (div (div x 2) 2)) 2) (ite (<= x 0) 1 x)) 2))
(define-fun
  fast
  ((x Int)) Int
  (div (+ 2 (+ (- x (div x (+ 2 2))) x)) (* (ite (<= x 0) 1 2) 2)))
(assert-not
  (forall ((c Int)) (or (not (>= c 0)) (= (small c) (fast c)))))
