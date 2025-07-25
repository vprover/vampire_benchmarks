(define-fun-rec
  v15
  ((x Int) (y Int) (z Int)) Int (ite (<= x 0) z (v15 (- x 1) y z)))
(define-fun-rec
  v14
  ((x Int) (y Int) (z Int)) Int (ite (<= x 0) z (v14 (- x 1) y z)))
(define-fun-rec
  u15
  ((x Int) (y Int) (z Int)) Int
  (ite (<= x 0) y (* (u15 (- x 1) y z) (v15 (- x 1) y z))))
(define-fun-rec
  u14
  ((x Int) (y Int) (z Int)) Int
  (ite (<= x 0) y (* (u14 (- x 1) y z) (v14 (- x 1) y z))))
(define-fun
  j15
  () Int (+ 1 2))
(define-fun
  w15
  ((x Int)) Int (u15 x 1 j15))
(define-fun
  j14
  () Int (+ 1 2))
(define-fun
  w14
  ((x Int)) Int (u14 x 1 j14))
(define-fun
  j13
  () Int (+ 2 2))
(define-fun
  h8
  ((x Int)) Int x)
(define-fun
  h6
  ((x Int)) Int x)
(define-fun
  h3
  ((x Int) (y Int)) Int y)
(define-fun
  h15
  ((x Int)) Int x)
(define-fun
  h14
  ((x Int)) Int x)
(define-fun
  h13
  ((x Int)) Int x)
(define-fun
  h12
  ((x Int) (y Int)) Int y)
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
  g5
  ((x Int) (y Int)) Int y)
(define-fun
  g4
  ((x Int)) Int x)
(define-fun
  g2
  ((x Int)) Int x)
(define-fun
  g15
  ((x Int) (y Int)) Int y)
(define-fun
  g14
  ((x Int) (y Int)) Int y)
(define-fun
  g13
  ((x Int) (y Int)) Int (+ 1 (+ (+ y y) y)))
(define-fun
  g11
  ((x Int)) Int x)
(define-fun
  g0
  ((x Int)) Int x)
(define-fun
  f8
  ((x Int)) Int (+ (+ x x) x))
(define-fun-rec
  u8
  ((x Int) (y Int)) Int (ite (<= x 0) y (f8 (u8 (- x 1) y))))
(define-fun
  v8
  ((x Int)) Int (u8 2 x))
(define-fun-rec
  u7
  ((x Int) (y Int)) Int (ite (<= x 0) y (v8 (u7 (- x 1) y))))
(define-fun
  v7
  ((x Int)) Int (u7 x 1))
(define-fun
  f6
  ((x Int)) Int (+ (+ x x) x))
(define-fun-rec
  u6
  ((x Int) (y Int)) Int (ite (<= x 0) y (f6 (u6 (- x 1) y))))
(define-fun
  v6
  ((x Int)) Int (u6 2 x))
(define-fun
  f5
  ((x Int)) Int (+ 1 (v6 x)))
(define-fun-rec
  u5
  ((x Int) (y Int)) Int (ite (<= x 0) y (f5 (u5 (- x 1) y))))
(define-fun
  v5
  ((x Int) (y Int)) Int (u5 y 1))
(define-fun
  f4
  ((x Int) (y Int)) Int (+ (+ (+ (v5 x y) x) x) x))
(define-fun-rec
  u4
  ((x Int) (y Int)) Int (ite (<= x 0) y (f4 (u4 (- x 1) y) x)))
(define-fun
  v4
  ((x Int)) Int (u4 x 1))
(define-fun
  f3
  ((x Int)) Int (* (v4 x) (v7 x)))
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
(define-fun-rec
  u1
  ((x Int) (y Int)) Int (ite (<= x 0) y (v2 (u1 (- x 1) y))))
(define-fun
  v1
  ((x Int) (y Int)) Int (u1 1 y))
(define-fun
  f13
  ((x Int) (y Int)) Int (+ (+ (* 2 (* 2 (+ x x))) x) y))
(define-funs-rec
  ((u13
    ((x Int) (y Int) (z Int)) Int)
   (v13
    ((x Int) (y Int) (z Int)) Int))
  ((ite (<= x 0) y (f13 (u13 (- x 1) y z) (v13 (- x 1) y z)))
   (ite (<= x 0) z (g13 (u13 (- x 1) y z) (v13 (- x 1) y z)))))
(define-fun
  w13
  ((x Int)) Int (u13 x 1 j13))
(define-fun
  f12
  ((x Int)) Int (* (w13 x) (w14 x)))
(define-fun-rec
  u12
  ((x Int) (y Int)) Int (ite (<= x 0) y (f12 (u12 (- x 1) y))))
(define-fun
  v12
  ((x Int) (y Int)) Int (u12 1 y))
(define-fun
  f11
  ((x Int) (y Int)) Int (+ (v12 x y) x))
(define-fun-rec
  u11
  ((x Int) (y Int)) Int (ite (<= x 0) y (f11 (u11 (- x 1) y) x)))
(define-fun
  v11
  ((x Int)) Int (u11 x 1))
(define-fun
  f10
  ((x Int)) Int (* (v11 x) (w15 x)))
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
  f0
  ((x Int) (y Int)) Int (+ (+ (+ (v1 x y) x) x) x))
(define-fun-rec
  u0
  ((x Int) (y Int)) Int (ite (<= x 0) y (f0 (u0 (- x 1) y) x)))
(define-fun
  v0
  ((x Int)) Int (u0 x 1))
(assert-not
  (forall ((c Int)) (or (not (>= c 0)) (= (v0 c) (v9 c)))))
