(define-fun-rec
  v6
  ((x Int) (y Int) (z Int)) Int (ite (<= x 0) z (v6 (- x 1) y z)))
(define-fun-rec
  v5
  ((x Int) (y Int) (z Int)) Int (ite (<= x 0) z (v5 (- x 1) y z)))
(define-fun-rec
  v13
  ((x Int) (y Int) (z Int)) Int (ite (<= x 0) z (v13 (- x 1) y z)))
(define-fun-rec
  v12
  ((x Int) (y Int) (z Int)) Int (ite (<= x 0) z (v12 (- x 1) y z)))
(define-fun-rec
  v11
  ((x Int) (y Int) (z Int)) Int (ite (<= x 0) z (v11 (- x 1) y z)))
(define-fun-rec
  u6
  ((x Int) (y Int) (z Int)) Int
  (ite (<= x 0) y (* (u6 (- x 1) y z) (v6 (- x 1) y z))))
(define-fun-rec
  u5
  ((x Int) (y Int) (z Int)) Int
  (ite (<= x 0) y (* (u5 (- x 1) y z) (v5 (- x 1) y z))))
(define-fun-rec
  u13
  ((x Int) (y Int) (z Int)) Int
  (ite (<= x 0) y (* (u13 (- x 1) y z) (v13 (- x 1) y z))))
(define-fun-rec
  u12
  ((x Int) (y Int) (z Int)) Int
  (ite (<= x 0) y (* (u12 (- x 1) y z) (v12 (- x 1) y z))))
(define-fun
  j6
  () Int (+ 2 (* 2 (+ 2 2))))
(define-fun
  w6
  ((x Int)) Int (u6 x 1 j6))
(define-fun
  j5
  () Int (+ 2 (* 2 (+ 2 2))))
(define-fun
  w5
  ((x Int)) Int (u5 x 1 j5))
(define-fun
  j13
  () Int (+ 2 (* 2 (+ 2 2))))
(define-fun
  w13
  ((x Int)) Int (u13 x 1 j13))
(define-fun
  j12
  () Int (+ 2 (* 2 (+ 2 2))))
(define-fun
  w12
  ((x Int)) Int (u12 x 1 j12))
(define-fun
  j11
  () Int (+ 2 (* 2 (+ 2 2))))
(define-fun
  h8
  ((x Int) (y Int)) Int y)
(define-fun
  h6
  ((x Int)) Int x)
(define-fun
  h5
  ((x Int)) Int x)
(define-fun
  h3
  ((x Int) (y Int)) Int y)
(define-fun
  h13
  ((x Int)) Int x)
(define-fun
  h12
  ((x Int)) Int x)
(define-fun
  h11
  ((x Int)) Int x)
(define-fun
  h10
  ((x Int) (y Int)) Int y)
(define-fun
  h1
  ((x Int) (y Int)) Int y)
(define-fun
  g9
  ((x Int)) Int x)
(define-fun
  g7
  ((x Int)) Int x)
(define-fun
  g6
  ((x Int) (y Int)) Int y)
(define-fun
  g5
  ((x Int) (y Int)) Int y)
(define-fun
  g4
  ((x Int)) Int x)
(define-fun
  g2
  ((x Int)) Int x)
(define-fun
  g13
  ((x Int) (y Int)) Int y)
(define-fun
  g12
  ((x Int) (y Int)) Int y)
(define-fun
  g11
  ((x Int) (y Int)) Int y)
(define-fun
  g0
  ((x Int)) Int x)
(define-fun
  f4
  ((x Int)) Int (+ 1 (* 2 (+ (* 2 (+ x x)) x))))
(define-fun-rec
  u4
  ((x Int) (y Int)) Int (ite (<= x 0) y (f4 (u4 (- x 1) y))))
(define-fun
  v4
  ((x Int)) Int (u4 x 1))
(define-fun
  f3
  ((x Int)) Int (* (v4 x) (w5 x)))
(define-fun-rec
  u3
  ((x Int) (y Int)) Int (ite (<= x 0) y (f3 (u3 (- x 1) y))))
(define-fun
  v3
  ((x Int) (y Int)) Int (u3 1 y))
(define-fun
  f2
  ((x Int) (y Int)) Int (+ (v3 x y) x))
(define-fun-rec
  u2
  ((x Int) (y Int)) Int (ite (<= x 0) y (f2 (u2 (- x 1) y) x)))
(define-fun
  v2
  ((x Int)) Int (u2 x 1))
(define-fun
  f11
  ((x Int) (y Int)) Int (+ 1 (* x y)))
(define-fun-rec
  u11
  ((x Int) (y Int) (z Int)) Int
  (ite (<= x 0) y (f11 (u11 (- x 1) y z) (v11 (- x 1) y z))))
(define-fun
  w11
  ((x Int)) Int (u11 x 1 j11))
(define-fun
  f10
  ((x Int)) Int (* (w11 x) (w12 x)))
(define-fun-rec
  u10
  ((x Int) (y Int)) Int (ite (<= x 0) y (f10 (u10 (- x 1) y))))
(define-fun
  v10
  ((x Int) (y Int)) Int (u10 1 y))
(define-fun
  f9
  ((x Int) (y Int)) Int (+ (v10 x y) x))
(define-fun-rec
  u9
  ((x Int) (y Int)) Int (ite (<= x 0) y (f9 (u9 (- x 1) y) x)))
(define-fun
  v9
  ((x Int)) Int (u9 x 1))
(define-fun
  f8
  ((x Int)) Int (* (v9 x) (w13 x)))
(define-fun-rec
  u8
  ((x Int) (y Int)) Int (ite (<= x 0) y (f8 (u8 (- x 1) y))))
(define-fun
  v8
  ((x Int) (y Int)) Int (u8 1 y))
(define-fun
  f7
  ((x Int) (y Int)) Int (+ (v8 x y) x))
(define-fun-rec
  u7
  ((x Int) (y Int)) Int (ite (<= x 0) y (f7 (u7 (- x 1) y) x)))
(define-fun
  v7
  ((x Int)) Int (u7 x 1))
(define-fun
  f1
  ((x Int)) Int (* (v2 x) (w6 x)))
(define-fun-rec
  u1
  ((x Int) (y Int)) Int (ite (<= x 0) y (f1 (u1 (- x 1) y))))
(define-fun
  v1
  ((x Int) (y Int)) Int (u1 1 y))
(define-fun
  f0
  ((x Int) (y Int)) Int (+ (v1 x y) x))
(define-fun-rec
  u0
  ((x Int) (y Int)) Int (ite (<= x 0) y (f0 (u0 (- x 1) y) x)))
(define-fun
  v0
  ((x Int)) Int (u0 x 1))
(assert-not
  (forall ((c Int)) (or (not (>= c 0)) (= (v0 c) (v7 c)))))
