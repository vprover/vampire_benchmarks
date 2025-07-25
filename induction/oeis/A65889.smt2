(define-fun-rec
  v3
  ((x Int) (y Int) (z Int)) Int (ite (<= x 0) z (v3 (- x 1) y z)))
(define-fun-rec
  v0
  ((x Int) (y Int) (z Int)) Int (ite (<= x 0) z (v0 (- x 1) y z)))
(define-fun-rec
  u3
  ((x Int) (y Int) (z Int)) Int
  (ite (<= x 0) y (* (u3 (- x 1) y z) (v3 (- x 1) y z))))
(define-fun-rec
  u1
  ((x Int) (y Int)) Int (ite (<= x 0) y (+ (u1 (- x 1) y) x)))
(define-fun
  v1
  ((x Int)) Int (u1 x x))
(define-fun-rec
  u0
  ((x Int) (y Int) (z Int)) Int
  (ite (<= x 0) y (* (u0 (- x 1) y z) (v0 (- x 1) y z))))
(define-fun
  j3
  ((x Int)) Int (+ 2 (+ 2 x)))
(define-fun
  w3
  ((x Int)) Int (u3 x 1 (j3 x)))
(define-fun
  j2
  ((x Int)) Int x)
(define-fun
  j0
  ((x Int)) Int (+ 2 (+ 2 x)))
(define-fun
  i2
  ((x Int)) Int (+ 2 x))
(define-fun
  i0
  ((x Int)) Int (+ 1 (v1 x)))
(define-fun
  w0
  ((x Int)) Int (u0 x (i0 x) (j0 x)))
(define-fun
  small
  ((x Int)) Int (* (w0 x) (+ 1 (+ 2 x))))
(define-fun
  h3
  ((x Int)) Int x)
(define-fun
  h1
  ((x Int)) Int x)
(define-fun
  h0
  ((x Int)) Int x)
(define-fun
  g3
  ((x Int) (y Int)) Int y)
(define-fun
  g2
  ((x Int)) Int x)
(define-fun
  g1
  ((x Int)) Int x)
(define-fun
  g0
  ((x Int) (y Int)) Int y)
(define-fun
  f2
  ((x Int) (y Int)) Int (+ (* x y) x))
(define-funs-rec
  ((u2
    ((x Int) (y Int) (z Int)) Int)
   (v2
    ((x Int) (y Int) (z Int)) Int))
  ((ite (<= x 0) y (f2 (u2 (- x 1) y z) (v2 (- x 1) y z)))
   (ite (<= x 0) z (u2 (- x 1) y z))))
(define-fun
  w2
  ((x Int)) Int (u2 2 (i2 x) x))
(define-fun
  fast
  ((x Int)) Int (* (div (w2 x) 2) (w3 x)))
(assert-not
  (forall ((c Int)) (or (not (>= c 0)) (= (small c) (fast c)))))
