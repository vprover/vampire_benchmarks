(define-fun
  small
  ((x Int)) Int
  (+ (* (+ 1 (* 2 (+ 2 (+ (- x (mod x 2)) x)))) (div x 2)) x))
(define-fun
  fast
  ((x Int)) Int
  (+ (+ (- (* (+ 1 (+ x x)) (* (+ 1 2) (div x 2))) (* x x)) x) x))
(assert-not
  (forall ((c Int)) (or (not (>= c 0)) (= (small c) (fast c)))))
