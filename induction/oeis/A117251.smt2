(define-fun-rec
  u6
  ((x Int) (y Int)) Int (ite (<= x 0) y (* (u6 (- x 1) y) x)))
(define-fun
  v6
  ((x Int)) Int (u6 x 1))
(define-fun-rec
  u4
  ((x Int) (y Int)) Int (ite (<= x 0) y (* (u4 (- x 1) y) x)))
(define-fun
  v4
  ((x Int)) Int (u4 x 1))
(define-fun
  j5
  ((x Int)) Int (- 2 (+ x x)))
(define-fun
  h7
  ((x Int)) Int (- x 2))
(define-fun
  h5
  ((x Int)) Int (- x 1))
(define-fun
  h1
  ((x Int) (y Int)) Int y)
(define-fun
  g7
  ((x Int) (y Int)) Int (+ y y))
(define-funs-rec
  ((v7
    ((x Int) (y Int) (z Int)) Int)
   (u7
    ((x Int) (y Int) (z Int)) Int))
  ((ite (<= x 0) z (g7 (u7 (- x 1) y z) (v7 (- x 1) y z)))
   (ite (<= x 0) y (* (u7 (- x 1) y z) (v7 (- x 1) y z)))))
(define-fun
  w7
  ((x Int)) Int (u7 (h7 x) 1 2))
(define-fun
  g6
  ((x Int)) Int x)
(define-fun
  g5
  ((x Int) (y Int)) Int (+ 1 y))
(define-funs-rec
  ((v5
    ((x Int) (y Int) (z Int)) Int)
   (u5
    ((x Int) (y Int) (z Int)) Int))
  ((ite (<= x 0) z (g5 (u5 (- x 1) y z) (v5 (- x 1) y z)))
   (ite (<= x 0) y (* (u5 (- x 1) y z) (v5 (- x 1) y z)))))
(define-fun
  w5
  ((x Int)) Int (u5 (h5 x) 1 (j5 x)))
(define-fun
  g4
  ((x Int)) Int x)
(define-fun
  g3
  ((x Int)) Int x)
(define-fun
  g2
  ((x Int)) Int x)
(define-fun
  g0
  ((x Int)) Int (- x 1))
(define-fun
  fast
  ((x Int)) Int (* (div (w5 x) (v6 x)) (w7 x)))
(define-fun
  f3
  ((x Int)) Int (- x 2))
(define-fun-rec
  u3
  ((x Int) (y Int)) Int (ite (<= x 0) y (f3 (u3 (- x 1) y))))
(define-fun
  v3
  ((x Int)) Int (u3 x 1))
(define-fun
  f2
  ((x Int)) Int (+ x x))
(define-fun-rec
  u2
  ((x Int) (y Int)) Int (ite (<= x 0) y (f2 (u2 (- x 1) y))))
(define-fun
  v2
  ((x Int)) Int (u2 x (v3 x)))
(define-fun-rec
  u1
  ((x Int) (y Int)) Int (ite (<= x 0) y (v2 (u1 (- x 1) y))))
(define-fun
  v1
  ((x Int) (y Int)) Int (u1 1 y))
(define-fun
  f0
  ((x Int) (y Int)) Int (* (v1 x y) x))
(define-fun-rec
  u0
  ((x Int) (y Int)) Int (ite (<= x 0) y (f0 (u0 (- x 1) y) x)))
(define-fun
  v0
  ((x Int)) Int (u0 (g0 x) 1))
(define-fun
  small
  ((x Int)) Int (div (v0 x) (v4 x)))
(assert-not
  (forall ((c Int)) (or (not (>= c 0)) (= (small c) (fast c)))))
