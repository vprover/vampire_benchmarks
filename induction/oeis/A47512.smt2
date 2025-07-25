(define-fun
  g0
  ((x Int)) Int x)
(define-fun
  fast
  ((x Int)) Int (+ (- x (div (+ (- x 2) x) (+ 1 (+ 2 2)))) x))
(define-fun
  f0
  ((x Int) (y Int)) Int (+ (- y (div (- x 1) (+ 2 2))) y))
(define-fun-rec
  u0
  ((x Int) (y Int)) Int (ite (<= x 0) y (f0 (u0 (- x 1) y) x)))
(define-fun
  v0
  ((x Int)) Int (u0 x 1))
(assert-not
  (forall ((c Int)) (or (not (>= c 0)) (= (v0 c) (fast c)))))
