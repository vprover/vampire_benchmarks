(define-fun
  u1
  ((x Int) (y Int)) Int (ite (<= x 0) y 0))
(define-fun
  v1
  ((x Int)) Int (u1 x 2))
(define-fun
  j2
  ((x Int)) Int (+ 1 x))
(define-fun
  j0
  ((x Int)) Int x)
(define-fun
  i2
  ((x Int)) Int (ite (<= x 0) (- 1 2) 1))
(define-fun
  h2
  ((x Int)) Int (- x 1))
(define-fun
  h0
  ((x Int)) Int (- x 1))
(define-fun
  g2
  ((x Int) (y Int)) Int (+ 2 y))
(define-funs-rec
  ((v2
    ((x Int) (y Int) (z Int)) Int)
   (u2
    ((x Int) (y Int) (z Int)) Int))
  ((ite (<= x 0) z (g2 (u2 (- x 1) y z) (v2 (- x 1) y z)))
   (ite (<= x 0) y (* (u2 (- x 1) y z) (v2 (- x 1) y z)))))
(define-fun
  w2
  ((x Int)) Int (u2 (h2 x) (i2 x) (j2 x)))
(define-fun
  g1
  ((x Int)) Int x)
(define-fun
  g0
  ((x Int) (y Int)) Int (+ 2 y))
(define-fun
  f0
  ((x Int) (y Int)) Int (+ (* x y) x))
(define-funs-rec
  ((u0
    ((x Int) (y Int) (z Int)) Int)
   (v0
    ((x Int) (y Int) (z Int)) Int))
  ((ite (<= x 0) y (f0 (u0 (- x 1) y z) (v0 (- x 1) y z)))
   (ite (<= x 0) z (g0 (u0 (- x 1) y z) (v0 (- x 1) y z)))))
(define-fun
  w0
  ((x Int)) Int (u0 (h0 x) 1 x))
(define-fun
  small
  ((x Int)) Int (- (w0 x) (v1 x)))
(assert-not
  (forall ((c Int)) (or (not (>= c 0)) (= (small c) (w2 c)))))
