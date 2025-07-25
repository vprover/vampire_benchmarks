(define-fun-rec
  v19
  ((x Int) (y Int) (z Int)) Int (ite (<= x 0) z (v19 (- x 1) y z)))
(define-fun-rec
  v18
  ((x Int) (y Int) (z Int)) Int (ite (<= x 0) z (v18 (- x 1) y z)))
(define-fun-rec
  v17
  ((x Int) (y Int) (z Int)) Int (ite (<= x 0) z (v17 (- x 1) y z)))
(define-fun-rec
  u19
  ((x Int) (y Int) (z Int)) Int
  (ite (<= x 0) y (* (u19 (- x 1) y z) (v19 (- x 1) y z))))
(define-fun-rec
  u18
  ((x Int) (y Int) (z Int)) Int
  (ite (<= x 0) y (* (u18 (- x 1) y z) (v18 (- x 1) y z))))
(define-fun-rec
  u17
  ((x Int) (y Int) (z Int)) Int
  (ite (<= x 0) y (* (u17 (- x 1) y z) (v17 (- x 1) y z))))
(define-fun
  j6
  () Int (+ 1 2))
(define-fun
  j19
  () Int (+ 1 2))
(define-fun
  w19
  ((x Int)) Int (u19 x 1 j19))
(define-fun
  j18
  () Int (+ 1 2))
(define-fun
  w18
  ((x Int)) Int (u18 x 1 j18))
(define-fun
  j17
  () Int (+ 1 2))
(define-fun
  w17
  ((x Int)) Int (u17 x 1 j17))
(define-fun
  j16
  () Int (+ 2 2))
(define-fun
  h6
  ((x Int)) Int x)
(define-fun
  h5
  ((x Int) (y Int)) Int y)
(define-fun
  h3
  ((x Int) (y Int)) Int y)
(define-fun
  h19
  ((x Int)) Int x)
(define-fun
  h18
  ((x Int)) Int x)
(define-fun
  h17
  ((x Int)) Int x)
(define-fun
  h16
  ((x Int)) Int x)
(define-fun
  h15
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
  g9
  ((x Int)) Int x)
(define-fun
  g8
  ((x Int)) Int x)
(define-fun
  g7
  ((x Int)) Int x)
(define-fun
  g6
  ((x Int) (y Int)) Int (+ (+ y y) y))
(define-fun
  g4
  ((x Int)) Int x)
(define-fun
  g2
  ((x Int)) Int x)
(define-fun
  g19
  ((x Int) (y Int)) Int y)
(define-fun
  g18
  ((x Int) (y Int)) Int y)
(define-fun
  g17
  ((x Int) (y Int)) Int y)
(define-fun
  g16
  ((x Int) (y Int)) Int (+ 1 (+ (+ y y) y)))
(define-fun
  g14
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
  f9
  ((x Int)) Int (+ (+ x x) x))
(define-fun-rec
  u9
  ((x Int) (y Int)) Int (ite (<= x 0) y (f9 (u9 (- x 1) y))))
(define-fun
  v9
  ((x Int)) Int (u9 x 1))
(define-fun
  f8
  ((x Int)) Int (+ (+ x x) x))
(define-fun-rec
  u8
  ((x Int) (y Int)) Int (ite (<= x 0) y (f8 (u8 (- x 1) y))))
(define-fun
  v8
  ((x Int)) Int (u8 x 1))
(define-fun
  f7
  ((x Int)) Int (+ (+ x x) x))
(define-fun-rec
  u7
  ((x Int) (y Int)) Int (ite (<= x 0) y (f7 (u7 (- x 1) y))))
(define-fun
  v7
  ((x Int)) Int (u7 x 1))
(define-fun
  f6
  ((x Int) (y Int)) Int (+ (* (+ (div y 2) y) y) x))
(define-funs-rec
  ((u6
    ((x Int) (y Int) (z Int)) Int)
   (v6
    ((x Int) (y Int) (z Int)) Int))
  ((ite (<= x 0) y (f6 (u6 (- x 1) y z) (v6 (- x 1) y z)))
   (ite (<= x 0) z (g6 (u6 (- x 1) y z) (v6 (- x 1) y z)))))
(define-fun
  w6
  ((x Int)) Int (u6 x 1 j6))
(define-fun
  f5
  ((x Int)) Int (* (w6 x) (v7 x)))
(define-fun-rec
  u5
  ((x Int) (y Int)) Int (ite (<= x 0) y (f5 (u5 (- x 1) y))))
(define-fun
  v5
  ((x Int) (y Int)) Int (u5 1 y))
(define-fun
  f4
  ((x Int) (y Int)) Int (+ (v5 x y) x))
(define-fun-rec
  u4
  ((x Int) (y Int)) Int (ite (<= x 0) y (f4 (u4 (- x 1) y) x)))
(define-fun
  v4
  ((x Int)) Int (u4 x 1))
(define-fun
  f3
  ((x Int)) Int (* (v4 x) (v8 x)))
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
  f16
  ((x Int) (y Int)) Int (+ (+ (* 2 (* 2 (+ x x))) x) y))
(define-funs-rec
  ((u16
    ((x Int) (y Int) (z Int)) Int)
   (v16
    ((x Int) (y Int) (z Int)) Int))
  ((ite (<= x 0) y (f16 (u16 (- x 1) y z) (v16 (- x 1) y z)))
   (ite (<= x 0) z (g16 (u16 (- x 1) y z) (v16 (- x 1) y z)))))
(define-fun
  w16
  ((x Int)) Int (u16 x 1 j16))
(define-fun
  f15
  ((x Int)) Int (* (w16 x) (w17 x)))
(define-fun-rec
  u15
  ((x Int) (y Int)) Int (ite (<= x 0) y (f15 (u15 (- x 1) y))))
(define-fun
  v15
  ((x Int) (y Int)) Int (u15 1 y))
(define-fun
  f14
  ((x Int) (y Int)) Int (+ (v15 x y) x))
(define-fun-rec
  u14
  ((x Int) (y Int)) Int (ite (<= x 0) y (f14 (u14 (- x 1) y) x)))
(define-fun
  v14
  ((x Int)) Int (u14 x 1))
(define-fun
  f13
  ((x Int)) Int (* (v14 x) (w18 x)))
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
  ((x Int)) Int (* (v12 x) (w19 x)))
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
  f1
  ((x Int)) Int (* (v2 x) (v9 x)))
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
  (forall ((c Int)) (or (not (>= c 0)) (= (v0 c) (v10 c)))))
