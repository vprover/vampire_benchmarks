(define-fun-rec
  v8
  ((x Int) (y Int) (z Int)) Int (ite (<= x 0) z (v8 (- x 1) y z)))
(define-fun-rec
  v7
  ((x Int) (y Int) (z Int)) Int (ite (<= x 0) z (v7 (- x 1) y z)))
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
  u8
  ((x Int) (y Int) (z Int)) Int
  (ite (<= x 0) y (* (u8 (- x 1) y z) (v8 (- x 1) y z))))
(define-fun-rec
  u7
  ((x Int) (y Int) (z Int)) Int
  (ite (<= x 0) y (* (u7 (- x 1) y z) (v7 (- x 1) y z))))
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
  j8
  () Int (+ 2 2))
(define-fun
  w8
  ((x Int)) Int (u8 x 1 j8))
(define-fun
  j7
  () Int (+ 2 2))
(define-fun
  w7
  ((x Int)) Int (u7 x 1 j7))
(define-fun
  j19
  () Int (+ 2 2))
(define-fun
  w19
  ((x Int)) Int (u19 x 1 j19))
(define-fun
  j18
  () Int (+ 2 2))
(define-fun
  w18
  ((x Int)) Int (u18 x 1 j18))
(define-fun
  j17
  () Int (+ 2 2))
(define-fun
  w17
  ((x Int)) Int (u17 x 1 j17))
(define-fun
  h8
  ((x Int)) Int x)
(define-fun
  h7
  ((x Int)) Int x)
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
  h14
  ((x Int) (y Int)) Int y)
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
  g8
  ((x Int) (y Int)) Int y)
(define-fun
  g7
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
  ((x Int)) Int x)
(define-fun
  g13
  ((x Int)) Int x)
(define-fun
  g11
  ((x Int)) Int x)
(define-fun
  g0
  ((x Int)) Int x)
(define-fun
  f6
  ((x Int)) Int (* x x))
(define-fun-rec
  u6
  ((x Int) (y Int)) Int (ite (<= x 0) y (f6 (u6 (- x 1) y))))
(define-fun
  v6
  () Int (u6 2 2))
(define-fun
  f5
  ((x Int)) Int (+ 1 (* v6 x)))
(define-fun-rec
  u5
  ((x Int) (y Int)) Int (ite (<= x 0) y (f5 (u5 (- x 1) y))))
(define-fun
  v5
  ((x Int) (y Int)) Int (u5 y 1))
(define-fun
  f4
  ((x Int) (y Int)) Int (+ (v5 x y) (* 2 (+ x x))))
(define-fun-rec
  u4
  ((x Int) (y Int)) Int (ite (<= x 0) y (f4 (u4 (- x 1) y) x)))
(define-fun
  v4
  ((x Int)) Int (u4 x 1))
(define-fun
  f3
  ((x Int)) Int (* (v4 x) (w7 x)))
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
  ((x Int)) Int (+ x x))
(define-fun-rec
  u16
  ((x Int) (y Int)) Int (ite (<= x 0) y (f16 (u16 (- x 1) y))))
(define-fun
  v16
  ((x Int)) Int (u16 x 2))
(define-fun
  f15
  ((x Int)) Int (* x x))
(define-fun-rec
  u15
  ((x Int) (y Int)) Int (ite (<= x 0) y (f15 (u15 (- x 1) y))))
(define-fun
  v15
  ((x Int)) Int (u15 1 (v16 x)))
(define-fun
  f14
  ((x Int)) Int (* (div (v15 x) (+ 1 2)) (w17 x)))
(define-fun-rec
  u14
  ((x Int) (y Int)) Int (ite (<= x 0) y (f14 (u14 (- x 1) y))))
(define-fun
  v14
  ((x Int) (y Int)) Int (u14 1 y))
(define-fun
  f13
  ((x Int) (y Int)) Int (+ (v14 x y) x))
(define-fun-rec
  u13
  ((x Int) (y Int)) Int (ite (<= x 0) y (f13 (u13 (- x 1) y) x)))
(define-fun
  v13
  ((x Int)) Int (u13 x 1))
(define-fun
  f12
  ((x Int)) Int (* (v13 x) (w18 x)))
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
  ((x Int)) Int (* (v11 x) (w19 x)))
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
  f1
  ((x Int)) Int (* (v2 x) (w8 x)))
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
  (forall ((c Int)) (or (not (>= c 0)) (= (v0 c) (v9 c)))))
