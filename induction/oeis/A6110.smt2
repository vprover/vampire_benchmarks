(define-fun
  h9
  ((x Int) (y Int)) Int y)
(define-fun
  h5
  ((x Int) (y Int)) Int y)
(define-fun
  h3
  ((x Int) (y Int)) Int y)
(define-fun
  h13
  ((x Int) (y Int)) Int y)
(define-fun
  h11
  ((x Int) (y Int)) Int y)
(define-fun
  h1
  ((x Int) (y Int)) Int y)
(define-fun
  g8
  ((x Int)) Int x)
(define-fun
  g7
  ((x Int)) Int x)
(define-fun
  g6
  ((x Int)) Int x)
(define-fun
  g5
  ((x Int) (y Int)) Int (+ y y))
(define-fun
  g4
  ((x Int)) Int x)
(define-fun
  g2
  ((x Int)) Int x)
(define-fun
  g17
  ((x Int)) Int x)
(define-fun
  g16
  ((x Int)) Int x)
(define-fun
  g15
  ((x Int)) Int x)
(define-fun
  g12
  ((x Int)) Int x)
(define-fun
  g10
  ((x Int)) Int x)
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
  ((x Int)) Int (u7 x 1))
(define-fun
  f6
  ((x Int)) Int (+ x x))
(define-fun-rec
  u6
  ((x Int) (y Int)) Int (ite (<= x 0) y (f6 (u6 (- x 1) y))))
(define-fun
  v6
  ((x Int)) Int (u6 x 1))
(define-fun
  f5
  ((x Int) (y Int)) Int (+ (* (+ (- y 1) y) (* y y)) x))
(define-funs-rec
  ((u5
    ((x Int) (y Int) (z Int)) Int)
   (v5
    ((x Int) (y Int) (z Int)) Int))
  ((ite (<= x 0) y (f5 (u5 (- x 1) y z) (v5 (- x 1) y z)))
   (ite (<= x 0) z (g5 (u5 (- x 1) y z) (v5 (- x 1) y z)))))
(define-fun
  w5
  ((x Int) (y Int)) Int (u5 y 1 2))
(define-fun
  f4
  ((x Int) (y Int)) Int (+ (+ (w5 x y) x) x))
(define-fun-rec
  u4
  ((x Int) (y Int)) Int (ite (<= x 0) y (f4 (u4 (- x 1) y) x)))
(define-fun
  v4
  ((x Int)) Int (u4 x 1))
(define-fun
  f3
  ((x Int)) Int (* (v4 x) (v6 x)))
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
  f17
  ((x Int)) Int (+ x x))
(define-fun-rec
  u17
  ((x Int) (y Int)) Int (ite (<= x 0) y (f17 (u17 (- x 1) y))))
(define-fun
  v17
  ((x Int)) Int (u17 x 1))
(define-fun
  f16
  ((x Int)) Int (+ x x))
(define-fun-rec
  u16
  ((x Int) (y Int)) Int (ite (<= x 0) y (f16 (u16 (- x 1) y))))
(define-fun
  v16
  ((x Int)) Int (u16 x 1))
(define-fun
  f15
  ((x Int)) Int (+ x x))
(define-fun-rec
  u15
  ((x Int) (y Int)) Int (ite (<= x 0) y (f15 (u15 (- x 1) y))))
(define-fun
  v15
  ((x Int)) Int (u15 x 2))
(define-fun
  f14
  ((x Int)) Int (* (+ (- x 1) x) (- (* x x) x)))
(define-fun-rec
  u14
  ((x Int) (y Int)) Int (ite (<= x 0) y (f14 (u14 (- x 1) y))))
(define-fun
  v14
  ((x Int)) Int (u14 1 (v15 x)))
(define-fun
  f13
  ((x Int)) Int (div (+ (div (v14 x) (+ 1 2)) 1) 2))
(define-fun-rec
  u13
  ((x Int) (y Int)) Int (ite (<= x 0) y (f13 (u13 (- x 1) y))))
(define-fun
  v13
  ((x Int) (y Int)) Int (u13 1 y))
(define-fun
  f12
  ((x Int) (y Int)) Int (+ (v13 x y) x))
(define-fun-rec
  u12
  ((x Int) (y Int)) Int (ite (<= x 0) y (f12 (u12 (- x 1) y) x)))
(define-fun
  v12
  ((x Int)) Int (u12 x 1))
(define-fun
  f11
  ((x Int)) Int (* (v12 x) (v16 x)))
(define-fun-rec
  u11
  ((x Int) (y Int)) Int (ite (<= x 0) y (f11 (u11 (- x 1) y))))
(define-fun
  v11
  ((x Int) (y Int)) Int (u11 1 y))
(define-fun
  f10
  ((x Int) (y Int)) Int (+ (v11 x y) x))
(define-fun-rec
  u10
  ((x Int) (y Int)) Int (ite (<= x 0) y (f10 (u10 (- x 1) y) x)))
(define-fun
  v10
  ((x Int)) Int (u10 x 1))
(define-fun
  f9
  ((x Int)) Int (* (v10 x) (v17 x)))
(define-fun-rec
  u9
  ((x Int) (y Int)) Int (ite (<= x 0) y (f9 (u9 (- x 1) y))))
(define-fun
  v9
  ((x Int) (y Int)) Int (u9 1 y))
(define-fun
  f8
  ((x Int) (y Int)) Int (+ (v9 x y) x))
(define-fun-rec
  u8
  ((x Int) (y Int)) Int (ite (<= x 0) y (f8 (u8 (- x 1) y) x)))
(define-fun
  v8
  ((x Int)) Int (u8 x 1))
(define-fun
  f1
  ((x Int)) Int (* (v2 x) (v7 x)))
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
  (forall ((c Int)) (or (not (>= c 0)) (= (v0 c) (v8 c)))))
