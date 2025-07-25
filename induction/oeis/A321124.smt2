(define-fun-rec
  u1
  ((x Int) (y Int)) Int (ite (<= x 0) y (+ (u1 (- x 1) y) x)))
(define-fun
  h1
  ((x Int)) Int x)
(define-fun
  g1
  ((x Int) (y Int)) Int (- y 2))
(define-fun
  v1
  ((x Int) (y Int)) Int (u1 (g1 x y) x))
(define-fun
  g0
  ((x Int)) Int (+ x x))
(define-fun
  fast
  ((x Int)) Int
  (+ (* (+ (+ (div (* (+ (- x 1) x) (- (* x x) x)) (+ 1 2)) x) x) 2)
    1))
(define-fun
  f0
  ((x Int) (y Int)) Int (+ 2 (v1 x y)))
(define-fun-rec
  u0
  ((x Int) (y Int)) Int (ite (<= x 0) y (f0 (u0 (- x 1) y) x)))
(define-fun
  v0
  ((x Int)) Int (u0 (g0 x) 1))
(assert-not
  (forall ((c Int)) (or (not (>= c 0)) (= (v0 c) (fast c)))))
