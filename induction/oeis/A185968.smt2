(define-fun
  v0
  ((x Int) (y Int) (z Int)) Int (ite (<= x 0) z 2))
(define-fun-rec
  u0
  ((x Int) (y Int) (z Int)) Int
  (ite (<= x 0) y (* (u0 (- x 1) y z) (v0 (- x 1) y z))))
(define-fun
  j1
  () Int (+ 2 2))
(define-fun
  j0
  ((x Int)) Int x)
(define-fun
  i2
  ((x Int)) Int x)
(define-fun
  i1
  ((x Int)) Int x)
(define-fun
  i0
  ((x Int)) Int x)
(define-fun
  h2
  ((x Int)) Int (- x 1))
(define-fun
  h1
  ((x Int)) Int (- x 1))
(define-fun
  h0
  ((x Int)) Int (* x x))
(define-fun
  w0
  ((x Int)) Int (u0 (h0 x) x x))
(define-fun
  g2
  ((x Int) (y Int)) Int (+ y y))
(define-funs-rec
  ((v2
    ((x Int) (y Int) (z Int)) Int)
   (u2
    ((x Int) (y Int) (z Int)) Int))
  ((ite (<= x 0) z (g2 (u2 (- x 1) y z) (v2 (- x 1) y z)))
   (ite (<= x 0) y (* (u2 (- x 1) y z) (v2 (- x 1) y z)))))
(define-fun
  w2
  ((x Int)) Int (u2 (h2 x) x 2))
(define-fun
  g1
  ((x Int) (y Int)) Int (+ y y))
(define-funs-rec
  ((v1
    ((x Int) (y Int) (z Int)) Int)
   (u1
    ((x Int) (y Int) (z Int)) Int))
  ((ite (<= x 0) z (g1 (u1 (- x 1) y z) (v1 (- x 1) y z)))
   (ite (<= x 0) y (* (u1 (- x 1) y z) (v1 (- x 1) y z)))))
(define-fun
  w1
  ((x Int)) Int (u1 (h1 x) x j1))
(define-fun
  fast
  ((x Int)) Int (* (w1 x) (w2 x)))
(assert-not
  (forall ((c Int)) (or (not (>= c 0)) (= (w0 c) (fast c)))))
