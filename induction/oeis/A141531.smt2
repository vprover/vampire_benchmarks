(define-fun-rec
  v1
  ((x Int) (y Int) (z Int)) Int (ite (<= x 0) z (v1 (- x 1) y z)))
(define-fun-rec
  u1
  ((x Int) (y Int) (z Int)) Int
  (ite (<= x 0) y (* (u1 (- x 1) y z) (v1 (- x 1) y z))))
(define-fun
  j1
  () Int (- 0 2))
(define-fun
  h1
  ((x Int)) Int (- x 2))
(define-fun
  w1
  ((x Int)) Int (u1 (h1 x) 1 j1))
(define-fun
  g1
  ((x Int) (y Int)) Int y)
(define-fun
  g0
  ((x Int)) Int (- x 2))
(define-fun
  f0
  ((x Int)) Int (- 0 (+ x x)))
(define-fun-rec
  u0
  ((x Int) (y Int)) Int (ite (<= x 0) y (f0 (u0 (- x 1) y))))
(define-fun
  v0
  ((x Int)) Int (u0 (g0 x) 1))
(assert-not
  (forall ((c Int)) (or (not (>= c 0)) (= (v0 c) (w1 c)))))
