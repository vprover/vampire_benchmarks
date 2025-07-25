(define-fun-rec
  v1
  ((x Int) (y Int) (z Int)) Int (ite (<= x 0) z (v1 (- x 1) y z)))
(define-fun
  j1
  ((x Int)) Int x)
(define-fun
  h2
  () Int (+ 2 (* 2 (+ 2 2))))
(define-fun
  h1
  ((x Int)) Int x)
(define-fun
  g1
  ((x Int) (y Int)) Int y)
(define-fun
  f2
  ((x Int)) Int (* (* x x) x))
(define-fun-rec
  u2
  ((x Int) (y Int)) Int (ite (<= x 0) y (f2 (u2 (- x 1) y))))
(define-fun
  v2
  () Int (u2 2 h2))
(define-fun
  fast
  ((x Int)) Int (div v2 (+ 1 x)))
(define-fun
  f1
  ((x Int) (y Int)) Int (+ (* x y) x))
(define-fun-rec
  u1
  ((x Int) (y Int) (z Int)) Int
  (ite (<= x 0) y (f1 (u1 (- x 1) y z) (v1 (- x 1) y z))))
(define-fun
  w1
  ((x Int)) Int (u1 x 1 x))
(define-fun-rec
  u0
  ((x Int) (y Int)) Int (ite (<= x 0) y (w1 (u0 (- x 1) y))))
(define-fun
  v0
  () Int (u0 2 2))
(define-fun
  small
  ((x Int)) Int (div v0 (+ 1 x)))
(assert-not
  (forall ((c Int)) (or (not (>= c 0)) (= (small c) (fast c)))))
