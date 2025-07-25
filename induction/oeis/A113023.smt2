(define-fun-rec
  v2
  ((x Int) (y Int) (z Int)) Int (ite (<= x 0) z (v2 (- x 1) y z)))
(define-fun
  v0
  ((x Int) (y Int) (z Int)) Int (ite (<= x 0) z 1))
(define-fun-rec
  u2
  ((x Int) (y Int) (z Int)) Int
  (ite (<= x 0) y (* (u2 (- x 1) y z) (v2 (- x 1) y z))))
(define-fun
  u1
  ((x Int) (y Int)) Int (ite (<= x 0) y 0))
(define-fun
  v1
  ((x Int)) Int (u1 x 2))
(define-fun
  j2
  () Int (+ 1 (+ 2 2)))
(define-fun
  i2
  ((x Int)) Int (ite (<= x 0) 1 (+ 2 2)))
(define-fun
  i0
  () Int (+ 1 2))
(define-fun
  h2
  ((x Int)) Int (- x 1))
(define-fun
  w2
  ((x Int)) Int (u2 (h2 x) (i2 x) j2))
(define-fun
  h0
  ((x Int)) Int x)
(define-fun
  g2
  ((x Int) (y Int)) Int y)
(define-fun
  g1
  ((x Int)) Int x)
(define-fun
  fast
  ((x Int)) Int (div (+ 1 (* (+ 1 2) (* (+ 1 2) (w2 x)))) 2))
(define-fun
  f0
  ((x Int) (y Int)) Int (* (+ 2 (+ 2 y)) x))
(define-fun-rec
  u0
  ((x Int) (y Int) (z Int)) Int
  (ite (<= x 0) y (f0 (u0 (- x 1) y z) (v0 (- x 1) y z))))
(define-fun
  w0
  ((x Int)) Int (u0 x i0 2))
(define-fun
  small
  ((x Int)) Int (+ (w0 x) (v1 x)))
(assert-not
  (forall ((c Int)) (or (not (>= c 0)) (= (small c) (fast c)))))
