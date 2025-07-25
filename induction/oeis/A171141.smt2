(define-fun
  small
  ((x Int)) Int
  (- (* (+ 1 2) (+ 2 (+ (* 2 (+ (+ (+ (mod x 2) x) x) x)) x)))
    (div x 2)))
(define-fun
  fast
  ((x Int)) Int
  (+ (+ 2 (+ (* (+ 1 (* 2 (+ 2 (+ 2 2)))) (+ (- x (div x 2)) x)) x))
    (+ 2 2)))
(assert-not
  (forall ((c Int)) (or (not (>= c 0)) (= (small c) (fast c)))))
