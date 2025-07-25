(define-fun-rec
  v1
  ((x Int) (y Int) (z Int)) Int (ite (<= x 0) z (v1 (- x 1) y z)))
(define-fun-rec
  v0
  ((x Int) (y Int) (z Int)) Int (ite (<= x 0) z (v0 (- x 1) y z)))
(define-fun-rec
  u1
  ((x Int) (y Int) (z Int)) Int
  (ite (<= x 0) y (* (u1 (- x 1) y z) (v1 (- x 1) y z))))
(define-fun-rec
  u0
  ((x Int) (y Int) (z Int)) Int
  (ite (<= x 0) y (* (u0 (- x 1) y z) (v0 (- x 1) y z))))
(define-fun
  j1
  ((x Int)) Int (+ 1 (+ 2 x)))
(define-fun
  w1
  ((x Int)) Int (u1 x 1 (j1 x)))
(define-fun
  j0
  ((x Int)) Int (+ 1 (+ 2 x)))
(define-fun
  i0
  ((x Int)) Int (+ 2 x))
(define-fun
  w0
  ((x Int)) Int (u0 x (i0 x) (j0 x)))
(define-fun
  small
  ((x Int)) Int (* (+ 1 x) (w0 x)))
(define-fun
  h1
  ((x Int)) Int x)
(define-fun
  h0
  ((x Int)) Int x)
(define-fun
  g1
  ((x Int) (y Int)) Int y)
(define-fun
  g0
  ((x Int) (y Int)) Int y)
(define-fun
  fast
  ((x Int)) Int (* (* (+ 1 x) (+ 2 x)) (w1 x)))
(assert-not
  (forall ((c Int)) (or (not (>= c 0)) (= (small c) (fast c)))))
