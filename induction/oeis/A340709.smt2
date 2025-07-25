(define-fun
  small
  ((x Int)) Int
  (div (+ (* 2 (+ (mod x 2) x)) (div x 2)) (+ 2 (mod x 2))))
(define-fun
  fast
  ((x Int)) Int
  (div (+ (* (+ 1 2) (- x (div x 2))) x) (+ 2 (mod x 2))))
(assert-not
  (forall ((c Int)) (or (not (>= c 0)) (= (small c) (fast c)))))
