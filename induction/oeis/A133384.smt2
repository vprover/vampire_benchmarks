(define-fun-rec
  v2
  ((x Int) (y Int) (z Int)) Int (ite (<= x 0) z (v2 (- x 1) y z)))
(define-fun
  v1
  ((x Int) (y Int) (z Int)) Int (ite (<= x 0) z 2))
(define-fun-rec
  u2
  ((x Int) (y Int) (z Int)) Int
  (ite (<= x 0) y (* (u2 (- x 1) y z) (v2 (- x 1) y z))))
(define-fun
  w2
  ((x Int) (y Int)) Int (u2 y x x))
(define-fun-rec
  u1
  ((x Int) (y Int) (z Int)) Int
  (ite (<= x 0) y (w2 (u1 (- x 1) y z) (v1 (- x 1) y z))))
(define-fun
  j2
  ((x Int)) Int x)
(define-fun
  j1
  ((x Int)) Int x)
(define-fun
  i2
  ((x Int)) Int x)
(define-fun
  i1
  () Int (+ 2 (* (* 2 2) 2)))
(define-fun
  w1
  ((x Int)) Int (u1 1 i1 x))
(define-fun
  h2
  ((x Int) (y Int)) Int y)
(define-fun
  g2
  ((x Int) (y Int)) Int y)
(define-fun
  g0
  ((x Int)) Int (+ 1 x))
(define-fun
  fast
  ((x Int)) Int (+ (w1 x) 2))
(define-fun
  f0
  ((x Int)) Int (* 2 (+ (* 2 (+ x x)) x)))
(define-fun-rec
  u0
  ((x Int) (y Int)) Int (ite (<= x 0) y (f0 (u0 (- x 1) y))))
(define-fun
  v0
  ((x Int)) Int (u0 (g0 x) 1))
(define-fun
  small
  ((x Int)) Int (+ 2 (v0 x)))
(assert-not
  (forall ((c Int)) (or (not (>= c 0)) (= (small c) (fast c)))))
