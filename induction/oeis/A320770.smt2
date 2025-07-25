(define-fun-rec
  v2
  ((x Int) (y Int) (z Int)) Int (ite (<= x 0) z (v2 (- x 1) y z)))
(define-fun-rec
  u2
  ((x Int) (y Int) (z Int)) Int
  (ite (<= x 0) y (* (u2 (- x 1) y z) (v2 (- x 1) y z))))
(define-fun
  j2
  () Int (- 0 (+ 2 2)))
(define-fun
  i2
  ((x Int)) Int (+ 1 (mod x 2)))
(define-fun
  h2
  ((x Int)) Int (div x 2))
(define-fun
  w2
  ((x Int)) Int (u2 (h2 x) (i2 x) j2))
(define-fun-rec
  u1
  ((x Int) (y Int)) Int (ite (<= x 0) y (w2 (u1 (- x 1) y))))
(define-fun
  h1
  ((x Int)) Int (div x 2))
(define-fun
  v1
  ((x Int)) Int (u1 1 (h1 x)))
(define-fun
  h0
  ((x Int)) Int (div x 2))
(define-fun
  g2
  ((x Int) (y Int)) Int y)
(define-fun
  g0
  ((x Int) (y Int)) Int (- 0 y))
(define-funs-rec
  ((v0
    ((x Int) (y Int) (z Int)) Int)
   (u0
    ((x Int) (y Int) (z Int)) Int))
  ((ite (<= x 0) z (g0 (u0 (- x 1) y z) (v0 (- x 1) y z)))
   (ite (<= x 0) y (* (u0 (- x 1) y z) (v0 (- x 1) y z)))))
(define-fun
  w0
  ((x Int)) Int (u0 (h0 x) 1 2))
(assert-not
  (forall ((c Int)) (or (not (>= c 0)) (= (w0 c) (v1 c)))))
