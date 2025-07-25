(define-fun-rec
  v2
  ((x Int) (y Int) (z Int)) Int (ite (<= x 0) z (v2 (- x 1) y z)))
(define-fun-rec
  v0
  ((x Int) (y Int) (z Int)) Int (ite (<= x 0) z (v0 (- x 1) y z)))
(define-funs-rec
  ((u5
    ((x Int) (y Int) (z Int)) Int)
   (v5
    ((x Int) (y Int) (z Int)) Int))
  ((ite (<= x 0) y (+ (u5 (- x 1) y z) (v5 (- x 1) y z)))
   (ite (<= x 0) z (u5 (- x 1) y z))))
(define-funs-rec
  ((u3
    ((x Int) (y Int) (z Int)) Int)
   (v3
    ((x Int) (y Int) (z Int)) Int))
  ((ite (<= x 0) y (+ (u3 (- x 1) y z) (v3 (- x 1) y z)))
   (ite (<= x 0) z (u3 (- x 1) y z))))
(define-fun-rec
  u2
  ((x Int) (y Int) (z Int)) Int
  (ite (<= x 0) y (* (u2 (- x 1) y z) (v2 (- x 1) y z))))
(define-funs-rec
  ((u1
    ((x Int) (y Int) (z Int)) Int)
   (v1
    ((x Int) (y Int) (z Int)) Int))
  ((ite (<= x 0) y (+ (u1 (- x 1) y z) (v1 (- x 1) y z)))
   (ite (<= x 0) z (u1 (- x 1) y z))))
(define-fun
  w1
  ((x Int) (y Int)) Int (u1 y 0 x))
(define-fun-rec
  u0
  ((x Int) (y Int) (z Int)) Int
  (ite (<= x 0) y (w1 (u0 (- x 1) y z) (v0 (- x 1) y z))))
(define-fun
  w0
  ((x Int)) Int (u0 x 1 x))
(define-fun
  j1
  ((x Int)) Int x)
(define-fun
  j0
  ((x Int)) Int x)
(define-fun
  h5
  ((x Int)) Int (- x 2))
(define-fun
  w5
  ((x Int)) Int (u5 (h5 x) 1 1))
(define-fun
  h3
  ((x Int)) Int (- x 2))
(define-fun
  w3
  ((x Int)) Int (u3 (h3 x) 1 1))
(define-fun
  h2
  ((x Int)) Int (- x 2))
(define-fun
  w2
  ((x Int)) Int (u2 (h2 x) 1 (w3 x)))
(define-fun
  h1
  ((x Int) (y Int)) Int y)
(define-fun
  h0
  ((x Int)) Int x)
(define-fun
  g5
  ((x Int)) Int x)
(define-fun
  g3
  ((x Int)) Int x)
(define-fun
  g2
  ((x Int) (y Int)) Int y)
(define-fun
  g1
  ((x Int)) Int x)
(define-fun
  g0
  ((x Int) (y Int)) Int y)
(define-fun
  f4
  ((x Int)) Int (* x x))
(define-fun-rec
  u4
  ((x Int) (y Int)) Int (ite (<= x 0) y (f4 (u4 (- x 1) y))))
(define-fun
  v4
  ((x Int)) Int (u4 1 (w5 x)))
(define-fun
  fast
  ((x Int)) Int (* (w2 x) (v4 x)))
(assert-not
  (forall ((c Int)) (or (not (>= c 0)) (= (w0 c) (fast c)))))
