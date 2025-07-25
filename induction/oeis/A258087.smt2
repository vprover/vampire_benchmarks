(define-fun
  g0
  ((x Int)) Int (- x 1))
(define-fun
  fast
  ((x Int)) Int
  (div
    (+ (- (* (+ (div (- x 1) 2) x) (div x 2)) (ite (<= x 0) 0 1)) x)
    2))
(define-fun
  f0
  ((x Int) (y Int)) Int (+ (+ (ite (<= (mod y 2) 0) 2 y) x) y))
(define-fun-rec
  u0
  ((x Int) (y Int)) Int (ite (<= x 0) y (f0 (u0 (- x 1) y) x)))
(define-fun
  v0
  ((x Int)) Int (u0 (g0 x) 0))
(define-fun
  small
  ((x Int)) Int (div (v0 x) 2))
(assert-not
  (forall ((c Int)) (or (not (>= c 0)) (= (small c) (fast c)))))
