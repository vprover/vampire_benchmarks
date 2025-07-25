(define-fun
  u1
  ((x Int) (y Int)) Int (ite (<= x 0) y 1))
(define-fun
  h1
  ((x Int)) Int x)
(define-fun
  g2
  ((x Int)) Int (div (- x 2) 2))
(define-fun
  g1
  ((x Int)) Int (mod x 2))
(define-fun
  v1
  ((x Int)) Int (u1 (g1 x) x))
(define-fun
  g0
  ((x Int)) Int (+ 1 x))
(define-fun
  f2
  ((x Int) (y Int)) Int (+ (div (* (+ 1 2) (* x y)) (+ 2 y)) x))
(define-fun-rec
  u2
  ((x Int) (y Int)) Int (ite (<= x 0) y (f2 (u2 (- x 1) y) x)))
(define-fun
  v2
  ((x Int)) Int (u2 (g2 x) 1))
(define-fun
  fast
  ((x Int)) Int (* (v2 x) (ite (<= (mod x 2) 0) 1 x)))
(define-fun
  f0
  ((x Int) (y Int)) Int (div (* x y) (- y (div y 2))))
(define-fun-rec
  u0
  ((x Int) (y Int)) Int (ite (<= x 0) y (f0 (u0 (- x 1) y) x)))
(define-fun
  v0
  ((x Int)) Int (u0 (g0 x) 1))
(define-fun
  small
  ((x Int)) Int (div (v0 x) (+ 1 (v1 x))))
(assert-not
  (forall ((c Int)) (or (not (>= c 0)) (= (small c) (fast c)))))
