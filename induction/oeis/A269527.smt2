(define-fun-rec
  v0
  ((x Int) (y Int) (z Int)) Int (ite (<= x 0) z (v0 (- x 1) y z)))
(define-fun
  j0
  ((x Int)) Int x)
(define-fun
  h2
  ((x Int)) Int (* (* (* (* x x) x) x) x))
(define-fun
  h1
  ((x Int) (y Int)) Int y)
(define-fun
  h0
  () Int (+ 2 2))
(define-fun
  g0
  ((x Int) (y Int)) Int y)
(define-fun
  f2
  ((x Int)) Int (* (+ 1 (* x x)) (+ (* x x) x)))
(define-fun-rec
  u2
  ((x Int) (y Int)) Int (ite (<= x 0) y (f2 (u2 (- x 1) y))))
(define-fun
  v2
  ((x Int)) Int (u2 1 (h2 x)))
(define-fun
  fast
  ((x Int)) Int (+ 1 (v2 x)))
(define-fun
  f1
  ((x Int)) Int (* x x))
(define-fun-rec
  u1
  ((x Int) (y Int)) Int (ite (<= x 0) y (f1 (u1 (- x 1) y))))
(define-fun
  v1
  ((x Int) (y Int)) Int (u1 2 y))
(define-fun
  f0
  ((x Int) (y Int)) Int (+ 1 (* (* (v1 x y) y) x)))
(define-fun-rec
  u0
  ((x Int) (y Int) (z Int)) Int
  (ite (<= x 0) y (f0 (u0 (- x 1) y z) (v0 (- x 1) y z))))
(define-fun
  w0
  ((x Int)) Int (u0 h0 1 x))
(assert-not
  (forall ((c Int)) (or (not (>= c 0)) (= (w0 c) (fast c)))))
