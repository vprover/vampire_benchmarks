(define-fun
  i2
  ((x Int)) Int (ite (<= x 0) 0 2))
(define-fun
  i0
  ((x Int)) Int (ite (<= x 0) 0 2))
(define-fun
  h3
  () Int (+ 2 (* 2 (+ 2 2))))
(define-fun
  h2
  ((x Int)) Int (- x 1))
(define-fun
  h0
  ((x Int)) Int (- x 1))
(define-fun
  g2
  ((x Int)) Int x)
(define-fun
  g0
  ((x Int)) Int x)
(define-fun
  f3
  ((x Int)) Int (* x x))
(define-fun-rec
  u3
  ((x Int) (y Int)) Int (ite (<= x 0) y (f3 (u3 (- x 1) y))))
(define-fun
  v3
  () Int (u3 1 h3))
(define-fun
  f2
  ((x Int) (y Int)) Int (- (* v3 x) y))
(define-funs-rec
  ((u2
    ((x Int) (y Int) (z Int)) Int)
   (v2
    ((x Int) (y Int) (z Int)) Int))
  ((ite (<= x 0) y (f2 (u2 (- x 1) y z) (v2 (- x 1) y z)))
   (ite (<= x 0) z (u2 (- x 1) y z))))
(define-fun
  w2
  ((x Int)) Int (u2 (h2 x) (i2 x) 0))
(define-fun
  fast
  ((x Int)) Int (* (w2 x) (+ 1 (+ 2 2))))
(define-fun
  f1
  ((x Int)) Int (+ 1 (* (+ 2 x) x)))
(define-fun-rec
  u1
  ((x Int) (y Int)) Int (ite (<= x 0) y (f1 (u1 (- x 1) y))))
(define-fun
  v1
  () Int (u1 2 2))
(define-fun
  f0
  ((x Int) (y Int)) Int (- (* v1 x) y))
(define-funs-rec
  ((u0
    ((x Int) (y Int) (z Int)) Int)
   (v0
    ((x Int) (y Int) (z Int)) Int))
  ((ite (<= x 0) y (f0 (u0 (- x 1) y z) (v0 (- x 1) y z)))
   (ite (<= x 0) z (u0 (- x 1) y z))))
(define-fun
  w0
  ((x Int)) Int (u0 (h0 x) (i0 x) 0))
(define-fun
  small
  ((x Int)) Int (* (w0 x) (+ 1 (+ 2 2))))
(assert-not
  (forall ((c Int)) (or (not (>= c 0)) (= (small c) (fast c)))))
