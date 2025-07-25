(define-fun-rec
  u4
  ((x Int) (y Int)) Int (ite (<= x 0) y (* (u4 (- x 1) y) x)))
(define-fun
  v4
  ((x Int)) Int (u4 x 1))
(define-fun-rec
  u1
  ((x Int) (y Int)) Int (ite (<= x 0) y (* (u1 (- x 1) y) x)))
(define-fun
  v1
  ((x Int)) Int (u1 x 1))
(define-fun
  j3
  ((x Int) (y Int)) Int (+ 1 (+ 2 (+ 2 (+ 2 y)))))
(define-fun
  j2
  ((x Int)) Int x)
(define-fun
  j0
  ((x Int)) Int (* 2 (+ 2 x)))
(define-fun
  i2
  ((x Int)) Int x)
(define-fun
  h3
  ((x Int)) Int x)
(define-fun
  h0
  ((x Int)) Int x)
(define-fun
  g4
  ((x Int)) Int x)
(define-fun
  g3
  ((x Int) (y Int)) Int (+ 1 y))
(define-funs-rec
  ((v3
    ((x Int) (y Int) (z Int)) Int)
   (u3
    ((x Int) (y Int) (z Int)) Int))
  ((ite (<= x 0) z (g3 (u3 (- x 1) y z) (v3 (- x 1) y z)))
   (ite (<= x 0) y (* (u3 (- x 1) y z) (v3 (- x 1) y z)))))
(define-fun
  w3
  ((x Int) (y Int)) Int (u3 x 1 (j3 x y)))
(define-fun
  g2
  ((x Int)) Int (* (+ 2 x) x))
(define-fun
  g1
  ((x Int)) Int x)
(define-fun
  g0
  ((x Int) (y Int)) Int (- y 1))
(define-fun
  f2
  ((x Int) (y Int)) Int (* (div (w3 x y) (v4 x)) (+ 1 (+ 2 x))))
(define-funs-rec
  ((u2
    ((x Int) (y Int) (z Int)) Int)
   (v2
    ((x Int) (y Int) (z Int)) Int))
  ((ite (<= x 0) y (f2 (u2 (- x 1) y z) (v2 (- x 1) y z)))
   (ite (<= x 0) z (g2 (u2 (- x 1) y z)))))
(define-fun
  w2
  ((x Int)) Int (u2 1 x x))
(define-fun
  f0
  ((x Int) (y Int)) Int (* (+ 2 y) x))
(define-funs-rec
  ((u0
    ((x Int) (y Int) (z Int)) Int)
   (v0
    ((x Int) (y Int) (z Int)) Int))
  ((ite (<= x 0) y (f0 (u0 (- x 1) y z) (v0 (- x 1) y z)))
   (ite (<= x 0) z (g0 (u0 (- x 1) y z) (v0 (- x 1) y z)))))
(define-fun
  w0
  ((x Int)) Int (u0 x 1 (j0 x)))
(define-fun
  small
  ((x Int)) Int (* (div (w0 x) (v1 x)) (+ 1 (+ 2 x))))
(assert-not
  (forall ((c Int)) (or (not (>= c 0)) (= (small c) (w2 c)))))
