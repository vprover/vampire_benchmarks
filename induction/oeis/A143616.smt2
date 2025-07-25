(define-fun-rec
  v0
  ((x Int) (y Int) (z Int)) Int (ite (<= x 0) z (v0 (- x 1) y z)))
(define-fun
  u1
  ((x Int) (y Int)) Int (ite (<= x 0) y 1))
(define-fun
  j0
  ((x Int)) Int x)
(define-fun
  g1
  ((x Int)) Int (+ 2 (- 2 x)))
(define-fun
  v1
  ((x Int)) Int (u1 (g1 x) 2))
(define-fun
  g0
  ((x Int) (y Int)) Int y)
(define-fun
  fast
  ((x Int)) Int (+ 1 (+ (+ 2 (+ 2 x)) (v1 x))))
(define-fun
  f0
  ((x Int) (y Int)) Int (+ (div (* 2 (+ x y)) x) x))
(define-fun-rec
  u0
  ((x Int) (y Int) (z Int)) Int
  (ite (<= x 0) y (f0 (u0 (- x 1) y z) (v0 (- x 1) y z))))
(define-fun
  w0
  ((x Int)) Int (u0 2 2 x))
(assert-not
  (forall ((c Int)) (or (not (>= c 0)) (= (w0 c) (fast c)))))
