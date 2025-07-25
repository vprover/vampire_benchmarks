(define-fun-rec
  v6
  ((x Int) (y Int) (z Int)) Int (ite (<= x 0) z (v6 (- x 1) y z)))
(define-fun-rec
  v4
  ((x Int) (y Int) (z Int)) Int (ite (<= x 0) z (v4 (- x 1) y z)))
(define-fun-rec
  v2
  ((x Int) (y Int) (z Int)) Int (ite (<= x 0) z (v2 (- x 1) y z)))
(define-fun
  v1
  ((x Int) (y Int) (z Int)) Int (ite (<= x 0) z 0))
(define-fun-rec
  u6
  ((x Int) (y Int) (z Int)) Int
  (ite (<= x 0) y (* (u6 (- x 1) y z) (v6 (- x 1) y z))))
(define-fun-rec
  u4
  ((x Int) (y Int) (z Int)) Int
  (ite (<= x 0) y (* (u4 (- x 1) y z) (v4 (- x 1) y z))))
(define-fun-rec
  u2
  ((x Int) (y Int) (z Int)) Int
  (ite (<= x 0) y (* (u2 (- x 1) y z) (v2 (- x 1) y z))))
(define-fun
  j1
  ((x Int)) Int x)
(define-fun
  i1
  ((x Int)) Int x)
(define-fun
  h6
  ((x Int)) Int x)
(define-fun
  h5
  () Int (+ 1 2))
(define-fun
  h4
  ((x Int)) Int x)
(define-fun
  h3
  () Int (+ 1 2))
(define-fun
  h2
  ((x Int)) Int x)
(define-fun
  h1
  ((x Int) (y Int)) Int (+ y y))
(define-fun
  g7
  ((x Int)) Int x)
(define-fun
  g6
  ((x Int) (y Int)) Int y)
(define-fun
  g5
  ((x Int)) Int (- x 1))
(define-fun
  g4
  ((x Int) (y Int)) Int y)
(define-fun
  g3
  ((x Int)) Int x)
(define-fun
  g2
  ((x Int) (y Int)) Int y)
(define-fun
  g0
  ((x Int)) Int x)
(define-fun
  f7
  ((x Int)) Int (+ x x))
(define-fun-rec
  u7
  ((x Int) (y Int)) Int (ite (<= x 0) y (f7 (u7 (- x 1) y))))
(define-fun
  v7
  ((x Int)) Int (u7 x 2))
(define-fun
  w6
  ((x Int)) Int (u6 x 1 (v7 x)))
(define-fun
  f5
  ((x Int)) Int (+ x x))
(define-fun-rec
  u5
  ((x Int) (y Int)) Int (ite (<= x 0) y (f5 (u5 (- x 1) y))))
(define-fun
  v5
  ((x Int)) Int (u5 (g5 x) h5))
(define-fun
  w4
  ((x Int)) Int (u4 x 1 (v5 x)))
(define-fun
  f3
  ((x Int)) Int (+ x x))
(define-fun-rec
  u3
  ((x Int) (y Int)) Int (ite (<= x 0) y (f3 (u3 (- x 1) y))))
(define-fun
  v3
  ((x Int)) Int (u3 x h3))
(define-fun
  w2
  ((x Int)) Int (u2 x 1 (v3 x)))
(define-fun
  fast
  ((x Int)) Int (* (* (w2 x) (w4 x)) (w6 x)))
(define-fun
  f1
  ((x Int) (y Int)) Int (+ (* 2 (* 2 (+ x x))) y))
(define-fun-rec
  u1
  ((x Int) (y Int) (z Int)) Int
  (ite (<= x 0) y (f1 (u1 (- x 1) y z) (v1 (- x 1) y z))))
(define-fun
  w1
  ((x Int) (y Int)) Int (u1 (h1 x y) x x))
(define-fun-rec
  u0
  ((x Int) (y Int)) Int (ite (<= x 0) y (w1 (u0 (- x 1) y) x)))
(define-fun
  v0
  ((x Int)) Int (u0 x 1))
(assert-not
  (forall ((c Int)) (or (not (>= c 0)) (= (v0 c) (fast c)))))
