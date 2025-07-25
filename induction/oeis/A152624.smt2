(define-fun
  j0
  () Int (+ 2 2))
(define-fun
  h0
  ((x Int)) Int x)
(define-fun
  g1
  ((x Int)) Int (- 2 x))
(define-fun
  g0
  () Int (- 0 1))
(define-fun
  v0
  ((x Int) (y Int) (z Int)) Int (ite (<= x 0) z g0))
(define-fun
  u0
  ((x Int) (y Int) (z Int)) Int (ite (<= x 0) y (v0 (- x 1) y z)))
(define-fun
  w0
  ((x Int)) Int (u0 x 2 j0))
(define-fun
  small
  ((x Int)) Int (+ 1 (w0 x)))
(define-fun
  f1
  ((x Int)) Int (+ 1 (ite (<= x 0) (+ 2 2) 2)))
(define-fun-rec
  u1
  ((x Int) (y Int)) Int (ite (<= x 0) y (f1 (u1 (- x 1) y))))
(define-fun
  v1
  ((x Int)) Int (u1 (g1 x) 0))
(define-fun
  f0
  ((x Int) (y Int)) Int y)
(assert-not
  (forall ((c Int)) (or (not (>= c 0)) (= (small c) (v1 c)))))
