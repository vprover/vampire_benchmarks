(define-fun-rec
  v5
  ((x Int) (y Int) (z Int)) Int (ite (<= x 0) z (v5 (- x 1) y z)))
(define-fun-rec
  v3
  ((x Int) (y Int) (z Int)) Int (ite (<= x 0) z (v3 (- x 1) y z)))
(define-fun-rec
  u5
  ((x Int) (y Int) (z Int)) Int
  (ite (<= x 0) y (* (u5 (- x 1) y z) (v5 (- x 1) y z))))
(define-fun-rec
  u3
  ((x Int) (y Int) (z Int)) Int
  (ite (<= x 0) y (* (u3 (- x 1) y z) (v3 (- x 1) y z))))
(define-fun
  j3
  () Int (+ 1 (* 2 (+ 2 2))))
(define-fun
  h7
  () Int (+ 1 (+ 2 2)))
(define-fun
  h5
  ((x Int)) Int (div x 2))
(define-fun
  h3
  ((x Int)) Int (div x 2))
(define-fun
  h0
  ((x Int)) Int x)
(define-fun
  g6
  ((x Int)) Int (mod x 2))
(define-fun
  g5
  ((x Int) (y Int)) Int y)
(define-fun
  g4
  ((x Int)) Int (mod x 2))
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
  ((x Int) (y Int)) Int (+ (* 2 (+ y y)) y))
(define-fun
  f7
  ((x Int)) Int (* x x))
(define-fun-rec
  u7
  ((x Int) (y Int)) Int (ite (<= x 0) y (f7 (u7 (- x 1) y))))
(define-fun
  v7
  () Int (u7 1 h7))
(define-fun
  f6
  () Int (+ 1 (+ 2 2)))
(define-fun
  u6
  ((x Int) (y Int)) Int (ite (<= x 0) y f6))
(define-fun
  v6
  ((x Int)) Int (u6 (g6 x) 1))
(define-fun
  w5
  ((x Int)) Int (u5 (h5 x) (v6 x) v7))
(define-fun
  f4
  () Int (+ 1 2))
(define-fun
  u4
  ((x Int) (y Int)) Int (ite (<= x 0) y f4))
(define-fun
  v4
  ((x Int)) Int (u4 (g4 x) 1))
(define-fun
  w3
  ((x Int)) Int (u3 (h3 x) (v4 x) j3))
(define-fun
  f2
  ((x Int)) Int (+ x x))
(define-fun-rec
  u2
  ((x Int) (y Int)) Int (ite (<= x 0) y (f2 (u2 (- x 1) y))))
(define-fun
  v2
  ((x Int)) Int (u2 x 1))
(define-fun
  fast
  ((x Int)) Int (+ (+ (v2 x) (w3 x)) (w5 x)))
(define-fun
  f1
  ((x Int)) Int (+ x x))
(define-fun-rec
  u1
  ((x Int) (y Int)) Int (ite (<= x 0) y (f1 (u1 (- x 1) y))))
(define-fun
  v1
  ((x Int)) Int (u1 x 1))
(define-fun
  f0
  ((x Int) (y Int)) Int (+ (+ (+ x x) x) y))
(define-funs-rec
  ((u0
    ((x Int) (y Int) (z Int)) Int)
   (v0
    ((x Int) (y Int) (z Int)) Int))
  ((ite (<= x 0) y (f0 (u0 (- x 1) y z) (v0 (- x 1) y z)))
   (ite (<= x 0) z (g0 (u0 (- x 1) y z) (v0 (- x 1) y z)))))
(define-fun
  w0
  ((x Int)) Int (u0 x 2 2))
(define-fun
  small
  ((x Int)) Int (+ (w0 x) (v1 x)))
(assert-not
  (forall ((c Int)) (or (not (>= c 0)) (= (small c) (fast c)))))
