(define-fun-rec
  u0
  ((x Int) (y Int)) Int (ite (<= x 0) y (+ (u0 (- x 1) y) x)))
(define-fun
  g0
  ((x Int)) Int (- x 2))
(define-fun
  v0
  ((x Int)) Int (u0 (g0 x) 2))
(define-fun
  small
  ((x Int)) Int (+ (+ (div (v0 x) (+ 1 2)) 1) (div x 2)))
(define-fun
  fast
  ((x Int)) Int
  (+
    (- (* (div (+ (div (* x x) (+ 2 (+ 2 2))) x) 2) 2)
      (ite (<= x 0) 1 x))
    2))
(assert-not
  (forall ((c Int)) (or (not (>= c 0)) (= (small c) (fast c)))))
