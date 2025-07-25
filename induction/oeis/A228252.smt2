(define-fun-rec
  v4
  ((x Int) (y Int) (z Int)) Int (ite (<= x 0) z (v4 (- x 1) y z)))
(define-fun-rec
  v2
  ((x Int) (y Int) (z Int)) Int (ite (<= x 0) z (v2 (- x 1) y z)))
(define-fun-rec
  u6
  ((x Int) (y Int)) Int (ite (<= x 0) y (* (u6 (- x 1) y) x)))
(define-fun
  v6
  ((x Int)) Int (u6 x 1))
(define-fun-rec
  u4
  ((x Int) (y Int) (z Int)) Int
  (ite (<= x 0) y (* (u4 (- x 1) y z) (v4 (- x 1) y z))))
(define-fun-rec
  u3
  ((x Int) (y Int)) Int (ite (<= x 0) y (* (u3 (- x 1) y) x)))
(define-fun-rec
  u2
  ((x Int) (y Int) (z Int)) Int
  (ite (<= x 0) y (* (u2 (- x 1) y z) (v2 (- x 1) y z))))
(define-fun-rec
  u1
  ((x Int) (y Int)) Int (ite (<= x 0) y (* (u1 (- x 1) y) x)))
(define-fun
  v1
  ((x Int)) Int (u1 x 1))
(define-fun
  j4
  ((x Int)) Int x)
(define-fun
  h7
  ((x Int)) Int x)
(define-fun
  h4
  ((x Int)) Int (- x 2))
(define-fun
  w4
  ((x Int)) Int (u4 (h4 x) 1 x))
(define-fun
  h2
  ((x Int)) Int (- x 2))
(define-fun
  h0
  ((x Int)) Int (+ 1 x))
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
  ((x Int)) Int (u7 x 1 2))
(define-fun
  g6
  ((x Int)) Int x)
(define-fun
  g4
  ((x Int) (y Int)) Int y)
(define-fun
  g3
  ((x Int)) Int (- x 1))
(define-fun
  v3
  ((x Int)) Int (u3 (g3 x) 1))
(define-fun
  w2
  ((x Int)) Int (u2 (h2 x) 1 (v3 x)))
(define-fun
  g2
  ((x Int) (y Int)) Int y)
(define-fun
  g1
  ((x Int)) Int x)
(define-fun
  g0
  ((x Int) (y Int)) Int (+ y y))
(define-funs-rec
  ((v0
    ((x Int) (y Int) (z Int)) Int)
   (u0
    ((x Int) (y Int) (z Int)) Int))
  ((ite (<= x 0) z (g0 (u0 (- x 1) y z) (v0 (- x 1) y z)))
   (ite (<= x 0) y (* (u0 (- x 1) y z) (v0 (- x 1) y z)))))
(define-fun
  w0
  ((x Int)) Int (u0 (h0 x) 1 (v1 x)))
(define-fun
  f5
  ((x Int)) Int (* (* x x) x))
(define-fun-rec
  u5
  ((x Int) (y Int)) Int (ite (<= x 0) y (f5 (u5 (- x 1) y))))
(define-fun
  v5
  ((x Int)) Int (u5 1 (v6 x)))
(define-fun
  fast
  ((x Int)) Int (* (* (* (w2 x) (w4 x)) (v5 x)) (w7 x)))
(assert-not
  (forall ((c Int)) (or (not (>= c 0)) (= (w0 c) (fast c)))))
