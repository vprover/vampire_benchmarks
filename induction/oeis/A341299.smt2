(define-fun
  small
  ((x Int)) Int
  (div (* (+ (- (* 2 (+ 2 x)) (div (div x 2) (+ 1 2))) x) (+ 1 x))
    (+ 2 2)))
(define-fun
  fast
  ((x Int)) Int
  (+
    (+
      (div (* (+ 1 x) (+ (+ (- x (div x (+ 2 (+ 2 2)))) x) x)) (+ 2 2))
      1)
    x))
(assert-not
  (forall ((c Int)) (or (not (>= c 0)) (= (small c) (fast c)))))
