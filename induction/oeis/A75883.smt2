(define-fun-rec
  u3
  ((x Int) (y Int)) Int (ite (<= x 0) y (* (u3 (- x 1) y) x)))
(define-fun-rec
  u1
  ((x Int) (y Int)) Int (ite (<= x 0) y (* (u1 (- x 1) y) x)))
(define-fun
  v1
  ((x Int)) Int (u1 x 1))
(define-funs-rec
  ((u0
    ((x Int) (y Int) (z Int)) Int)
   (v0
    ((x Int) (y Int) (z Int)) Int))
  ((ite (<= x 0) y (+ (u0 (- x 1) y z) (v0 (- x 1) y z)))
   (ite (<= x 0) z (v1 (u0 (- x 1) y z)))))
(define-fun
  w0
  ((x Int)) Int (u0 x 1 0))
(define-fun
  i2
  ((x Int)) Int (ite (<= (- x 1) 0) 1 2))
(define-fun
  h3
  ((x Int) (y Int)) Int y)
(define-fun
  h2
  ((x Int)) Int (- x 2))
(define-fun
  h0
  ((x Int)) Int x)
(define-fun
  g3
  ((x Int) (y Int)) Int (- y 1))
(define-fun
  v3
  ((x Int) (y Int)) Int (u3 (g3 x y) y))
(define-fun
  g2
  ((x Int)) Int x)
(define-fun
  g1
  ((x Int)) Int x)
(define-fun
  f2
  ((x Int) (y Int)) Int (+ (v3 x y) x))
(define-funs-rec
  ((u2
    ((x Int) (y Int) (z Int)) Int)
   (v2
    ((x Int) (y Int) (z Int)) Int))
  ((ite (<= x 0) y (f2 (u2 (- x 1) y z) (v2 (- x 1) y z)))
   (ite (<= x 0) z (u2 (- x 1) y z))))
(define-fun
  w2
  ((x Int)) Int (u2 (h2 x) (i2 x) 1))
(assert-not
  (forall ((c Int)) (or (not (>= c 0)) (= (w0 c) (w2 c)))))
