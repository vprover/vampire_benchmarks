(define-fun
  v0
  ((x Int) (y Int) (z Int)) Int (ite (<= x 0) z 1))
(define-fun
  u1
  ((x Int) (y Int)) Int (ite (<= x 0) y 0))
(define-fun
  j0
  ((x Int)) Int x)
(define-fun
  i0
  ((x Int)) Int x)
(define-fun
  h2
  ((x Int)) Int x)
(define-fun
  h1
  ((x Int)) Int x)
(define-fun
  h0
  ((x Int)) Int x)
(define-fun
  g2
  ((x Int)) Int (- x 2))
(define-fun
  g1
  ((x Int)) Int (- 2 x))
(define-fun
  v1
  ((x Int)) Int (u1 (g1 x) x))
(define-fun
  f2
  ((x Int)) Int (+ x x))
(define-fun-rec
  u2
  ((x Int) (y Int)) Int (ite (<= x 0) y (f2 (u2 (- x 1) y))))
(define-fun
  v2
  ((x Int)) Int (u2 (g2 x) x))
(define-fun
  fast
  ((x Int)) Int (* (+ 1 (v1 x)) (v2 x)))
(define-fun
  f0
  ((x Int) (y Int)) Int (+ (* x y) x))
(define-fun-rec
  u0
  ((x Int) (y Int) (z Int)) Int
  (ite (<= x 0) y (f0 (u0 (- x 1) y z) (v0 (- x 1) y z))))
(define-fun
  w0
  ((x Int)) Int (u0 x x x))
(define-fun
  small
  ((x Int)) Int (div (w0 x) 2))
(assert-not
  (forall ((c Int)) (or (not (>= c 0)) (= (small c) (fast c)))))
