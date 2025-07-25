(define-fun-rec
  v4
  ((x Int) (y Int) (z Int)) Int (ite (<= x 0) z (v4 (- x 1) y z)))
(define-fun-rec
  v1
  ((x Int) (y Int) (z Int)) Int (ite (<= x 0) z (v1 (- x 1) y z)))
(define-fun-rec
  u4
  ((x Int) (y Int) (z Int)) Int
  (ite (<= x 0) y (* (u4 (- x 1) y z) (v4 (- x 1) y z))))
(define-fun-rec
  u1
  ((x Int) (y Int) (z Int)) Int
  (ite (<= x 0) y (* (u1 (- x 1) y z) (v1 (- x 1) y z))))
(define-fun
  j4
  ((x Int)) Int x)
(define-fun
  j1
  ((x Int) (y Int)) Int y)
(define-fun
  i4
  ((x Int)) Int (+ 1 x))
(define-fun
  i1
  ((x Int) (y Int)) Int (+ 1 y))
(define-fun
  h4
  ((x Int)) Int (- x 2))
(define-fun
  w4
  ((x Int)) Int (u4 (h4 x) (i4 x) x))
(define-fun
  h3
  ((x Int) (y Int)) Int y)
(define-fun
  h1
  ((x Int) (y Int)) Int (+ 1 y))
(define-fun
  w1
  ((x Int) (y Int)) Int (u1 (h1 x y) (i1 x y) y))
(define-fun
  g4
  ((x Int) (y Int)) Int y)
(define-fun
  g2
  ((x Int)) Int x)
(define-fun
  g1
  ((x Int) (y Int)) Int y)
(define-fun
  g0
  ((x Int)) Int x)
(define-fun
  f3
  ((x Int)) Int (* (w4 x) (* (* x x) x)))
(define-fun-rec
  u3
  ((x Int) (y Int)) Int (ite (<= x 0) y (f3 (u3 (- x 1) y))))
(define-fun
  v3
  ((x Int) (y Int)) Int (u3 1 y))
(define-fun
  f2
  ((x Int) (y Int)) Int (+ (v3 x y) x))
(define-fun-rec
  u2
  ((x Int) (y Int)) Int (ite (<= x 0) y (f2 (u2 (- x 1) y) x)))
(define-fun
  v2
  ((x Int)) Int (u2 x 0))
(define-fun
  fast
  ((x Int)) Int (div (v2 x) 2))
(define-fun
  f0
  ((x Int) (y Int)) Int (+ (w1 x y) x))
(define-fun-rec
  u0
  ((x Int) (y Int)) Int (ite (<= x 0) y (f0 (u0 (- x 1) y) x)))
(define-fun
  v0
  ((x Int)) Int (u0 x 1))
(define-fun
  small
  ((x Int)) Int (div (v0 x) 2))
(assert-not
  (forall ((c Int)) (or (not (>= c 0)) (= (small c) (fast c)))))
