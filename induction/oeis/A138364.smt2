(define-fun
  v1
  ((x Int) (y Int) (z Int)) Int (ite (<= x 0) z 1))
(define-fun
  j1
  ((x Int)) Int (div x 2))
(define-fun
  h1
  ((x Int)) Int (mod x 2))
(define-fun
  h0
  ((x Int)) Int (mod x 2))
(define-fun
  g2
  ((x Int) (y Int)) Int y)
(define-fun
  g0
  ((x Int)) Int x)
(define-fun
  f2
  ((x Int) (y Int)) Int (* 2 (+ (- x (div x y)) x)))
(define-fun-rec
  u2
  ((x Int) (y Int)) Int (ite (<= x 0) y (f2 (u2 (- x 1) y) x)))
(define-fun
  v2
  ((x Int) (y Int)) Int (u2 y 1))
(define-fun
  f1
  ((x Int) (y Int)) Int (- (div (v2 x y) (+ 1 y)) x))
(define-fun-rec
  u1
  ((x Int) (y Int) (z Int)) Int
  (ite (<= x 0) y (f1 (u1 (- x 1) y z) (v1 (- x 1) y z))))
(define-fun
  w1
  ((x Int)) Int (u1 (h1 x) 0 (j1 x)))
(define-fun
  fast
  ((x Int)) Int (* (w1 x) x))
(define-fun
  f0
  ((x Int) (y Int)) Int (div (* x y) (- y (div y 2))))
(define-fun-rec
  u0
  ((x Int) (y Int)) Int (ite (<= x 0) y (f0 (u0 (- x 1) y) x)))
(define-fun
  v0
  ((x Int)) Int (u0 x (h0 x)))
(assert-not
  (forall ((c Int)) (or (not (>= c 0)) (= (v0 c) (fast c)))))
