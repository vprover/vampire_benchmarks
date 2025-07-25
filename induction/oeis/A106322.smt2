(define-fun-rec
  v0
  ((x Int) (y Int) (z Int)) Int (ite (<= x 0) z (v0 (- x 1) y z)))
(define-fun
  j0
  ((x Int)) Int (+ 1 x))
(define-fun
  i0
  () Int (+ 1 (+ 2 2)))
(define-fun
  h2
  ((x Int)) Int (* (+ 1 (+ 2 2)) (+ 1 x)))
(define-fun
  g0
  ((x Int) (y Int)) Int y)
(define-fun
  f2
  ((x Int)) Int (* x x))
(define-fun-rec
  u2
  ((x Int) (y Int)) Int (ite (<= x 0) y (f2 (u2 (- x 1) y))))
(define-fun
  v2
  ((x Int)) Int (u2 1 (h2 x)))
(define-fun
  h1
  ((x Int)) Int (* (+ 1 x) (v2 x)))
(define-fun
  f1
  ((x Int)) Int (* x x))
(define-fun-rec
  u1
  ((x Int) (y Int)) Int (ite (<= x 0) y (f1 (u1 (- x 1) y))))
(define-fun
  v1
  ((x Int)) Int (u1 1 (h1 x)))
(define-fun
  fast
  ((x Int)) Int (* 2 (v1 x)))
(define-fun
  f0
  ((x Int) (y Int)) Int (* (* (* x x) y) y))
(define-fun-rec
  u0
  ((x Int) (y Int) (z Int)) Int
  (ite (<= x 0) y (f0 (u0 (- x 1) y z) (v0 (- x 1) y z))))
(define-fun
  w0
  ((x Int)) Int (u0 2 i0 (j0 x)))
(define-fun
  small
  ((x Int)) Int (* (w0 x) 2))
(assert-not
  (forall ((c Int)) (or (not (>= c 0)) (= (small c) (fast c)))))
