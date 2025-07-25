(define-fun
  u6
  ((x Int) (y Int)) Int (ite (<= x 0) y x))
(define-fun
  u3
  ((x Int) (y Int)) Int (ite (<= x 0) y 1))
(define-fun
  v3
  ((x Int)) Int (u3 x x))
(define-fun
  j4
  ((x Int)) Int (+ 1 x))
(define-fun
  j1
  ((x Int)) Int x)
(define-fun
  h5
  ((x Int) (y Int)) Int y)
(define-fun
  h4
  () Int (+ 2 (+ 2 2)))
(define-fun
  h3
  ((x Int)) Int x)
(define-fun
  h2
  ((x Int) (y Int)) Int y)
(define-fun
  h1
  ((x Int)) Int x)
(define-fun
  h0
  ((x Int)) Int (+ 1 x))
(define-fun
  g6
  ((x Int)) Int (mod x 2))
(define-fun
  v6
  ((x Int)) Int (u6 (g6 x) 2))
(define-fun
  g4
  ((x Int) (y Int)) Int (div y 2))
(define-fun
  g3
  ((x Int)) Int x)
(define-fun
  g1
  ((x Int) (y Int)) Int (div y 2))
(define-fun
  f6
  ((x Int) (y Int)) Int y)
(define-fun
  f5
  ((x Int)) Int (mod (+ (v6 x) x) (+ 1 x)))
(define-fun-rec
  u5
  ((x Int) (y Int)) Int (ite (<= x 0) y (f5 (u5 (- x 1) y))))
(define-fun
  v5
  ((x Int) (y Int)) Int (u5 1 y))
(define-fun
  f4
  ((x Int) (y Int)) Int (+ (* (v5 x y) x) x))
(define-funs-rec
  ((u4
    ((x Int) (y Int) (z Int)) Int)
   (v4
    ((x Int) (y Int) (z Int)) Int))
  ((ite (<= x 0) y (f4 (u4 (- x 1) y z) (v4 (- x 1) y z)))
   (ite (<= x 0) z (g4 (u4 (- x 1) y z) (v4 (- x 1) y z)))))
(define-fun
  w4
  ((x Int)) Int (u4 h4 1 (j4 x)))
(define-fun
  fast
  ((x Int)) Int (- (* (w4 x) 2) 1))
(define-fun
  f2
  ((x Int)) Int (mod (+ (v3 x) x) 2))
(define-fun-rec
  u2
  ((x Int) (y Int)) Int (ite (<= x 0) y (f2 (u2 (- x 1) y))))
(define-fun
  v2
  ((x Int) (y Int)) Int (u2 1 y))
(define-fun
  f1
  ((x Int) (y Int)) Int (+ (* (v2 x y) x) x))
(define-funs-rec
  ((u1
    ((x Int) (y Int) (z Int)) Int)
   (v1
    ((x Int) (y Int) (z Int)) Int))
  ((ite (<= x 0) y (f1 (u1 (- x 1) y z) (v1 (- x 1) y z)))
   (ite (<= x 0) z (g1 (u1 (- x 1) y z) (v1 (- x 1) y z)))))
(define-fun
  w1
  ((x Int)) Int (u1 x 1 x))
(define-fun-rec
  u0
  ((x Int) (y Int)) Int (ite (<= x 0) y (w1 (u0 (- x 1) y))))
(define-fun
  v0
  ((x Int)) Int (u0 1 (h0 x)))
(define-fun
  small
  ((x Int)) Int (- (* (v0 x) 2) 1))
(assert-not
  (forall ((c Int)) (or (not (>= c 0)) (= (small c) (fast c)))))
