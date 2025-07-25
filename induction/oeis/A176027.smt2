(define-fun
  v0
  ((x Int) (y Int) (z Int)) Int (ite (<= x 0) z 0))
(define-fun-rec
  u1
  ((x Int) (y Int)) Int (ite (<= x 0) y (+ (u1 (- x 1) y) x)))
(define-fun
  v1
  ((x Int) (y Int)) Int (u1 y x))
(define-fun
  j0
  ((x Int)) Int x)
(define-fun
  i0
  ((x Int)) Int x)
(define-fun
  h2
  ((x Int)) Int (+ 1 (+ 2 (+ 2 x))))
(define-fun
  h1
  ((x Int)) Int x)
(define-fun
  h0
  ((x Int)) Int x)
(define-fun
  g2
  ((x Int)) Int (- x 1))
(define-fun
  g1
  ((x Int) (y Int)) Int y)
(define-fun
  f2
  ((x Int)) Int (+ x x))
(define-fun-rec
  u2
  ((x Int) (y Int)) Int (ite (<= x 0) y (f2 (u2 (- x 1) y))))
(define-fun
  v2
  ((x Int)) Int (u2 (g2 x) (h2 x)))
(define-fun
  fast
  ((x Int)) Int (* (div (v2 x) 2) x))
(define-fun
  f0
  ((x Int) (y Int)) Int (+ (v1 x y) x))
(define-fun-rec
  u0
  ((x Int) (y Int) (z Int)) Int
  (ite (<= x 0) y (f0 (u0 (- x 1) y z) (v0 (- x 1) y z))))
(define-fun
  w0
  ((x Int)) Int (u0 x x x))
(assert-not
  (forall ((c Int)) (or (not (>= c 0)) (= (w0 c) (fast c)))))
