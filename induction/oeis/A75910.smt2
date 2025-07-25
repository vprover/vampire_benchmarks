(define-fun
  h9
  ((x Int) (y Int)) Int y)
(define-fun
  h6
  ((x Int) (y Int)) Int y)
(define-fun
  h3
  ((x Int) (y Int)) Int y)
(define-fun
  h14
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
  ((x Int)) Int (+ x x))
(define-fun
  g6
  ((x Int) (y Int)) Int (+ y y))
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
  g18
  ((x Int)) Int x)
(define-fun
  g16
  ((x Int)) Int x)
(define-fun
  g13
  ((x Int) (y Int)) Int y)
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
  ((x Int)) Int (u7 (g7 x) 1))
(define-fun
  f6
  ((x Int) (y Int)) Int (+ (- (* 2 (* y y)) y) x))
(define-funs-rec
  ((u6
    ((x Int) (y Int) (z Int)) Int)
   (v6
    ((x Int) (y Int) (z Int)) Int))
  ((ite (<= x 0) y (f6 (u6 (- x 1) y z) (v6 (- x 1) y z)))
   (ite (<= x 0) z (g6 (u6 (- x 1) y z) (v6 (- x 1) y z)))))
(define-fun
  w6
  ((x Int) (y Int)) Int (u6 y 1 2))
(define-fun
  f5
  ((x Int) (y Int)) Int (+ (+ (w6 x y) (* 2 (+ (+ x x) x))) x))
(define-fun-rec
  u5
  ((x Int) (y Int)) Int (ite (<= x 0) y (f5 (u5 (- x 1) y) x)))
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
(define-fun-rec
  u3
  ((x Int) (y Int)) Int (ite (<= x 0) y (v4 (u3 (- x 1) y))))
(define-fun
  v3
  ((x Int) (y Int)) Int (u3 1 y))
(define-fun
  f2
  ((x Int) (y Int)) Int (+ (+ (+ (+ (+ (v3 x y) x) x) x) x) x))
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
  f18
  ((x Int)) Int (+ x x))
(define-fun-rec
  u18
  ((x Int) (y Int)) Int (ite (<= x 0) y (f18 (u18 (- x 1) y))))
(define-fun
  v18
  ((x Int)) Int (u18 x 1))
(define-fun
  f17
  ((x Int)) Int (* x x))
(define-fun-rec
  u17
  ((x Int) (y Int)) Int (ite (<= x 0) y (f17 (u17 (- x 1) y))))
(define-fun
  v17
  ((x Int)) Int (u17 1 (v18 x)))
(define-fun
  f16
  ((x Int)) Int (+ 2 (+ x x)))
(define-fun-rec
  u16
  ((x Int) (y Int)) Int (ite (<= x 0) y (f16 (u16 (- x 1) y))))
(define-fun
  v16
  ((x Int)) Int (u16 x 2))
(define-fun
  f15
  ((x Int)) Int (+ (* x x) x))
(define-fun-rec
  u15
  ((x Int) (y Int)) Int (ite (<= x 0) y (f15 (u15 (- x 1) y))))
(define-fun
  v15
  ((x Int)) Int (u15 1 (v16 x)))
(define-fun
  f14
  ((x Int)) Int (div (div (v15 x) 2) (+ 1 2)))
(define-fun-rec
  u14
  ((x Int) (y Int)) Int (ite (<= x 0) y (f14 (u14 (- x 1) y))))
(define-fun
  v14
  ((x Int) (y Int)) Int (u14 1 y))
(define-fun
  f13
  ((x Int) (y Int)) Int (+ (+ (+ (v14 x y) x) x) x))
(define-fun-rec
  u13
  ((x Int) (y Int)) Int (ite (<= x 0) y (f13 (u13 (- x 1) y) x)))
(define-fun
  v13
  ((x Int) (y Int)) Int (u13 y 1))
(define-fun
  f12
  ((x Int) (y Int)) Int (+ (+ (v13 x y) (* (+ x x) 2)) x))
(define-fun-rec
  u12
  ((x Int) (y Int)) Int (ite (<= x 0) y (f12 (u12 (- x 1) y) x)))
(define-fun
  v12
  ((x Int)) Int (u12 x 1))
(define-fun-rec
  u11
  ((x Int) (y Int)) Int (ite (<= x 0) y (v12 (u11 (- x 1) y))))
(define-fun
  v11
  ((x Int) (y Int)) Int (u11 1 y))
(define-fun
  f10
  ((x Int) (y Int)) Int
  (+ (+ (+ (+ (+ (+ (+ (v11 x y) x) x) x) x) x) x) x))
(define-fun-rec
  u10
  ((x Int) (y Int)) Int (ite (<= x 0) y (f10 (u10 (- x 1) y) x)))
(define-fun
  v10
  ((x Int)) Int (u10 x 1))
(define-fun-rec
  u9
  ((x Int) (y Int)) Int (ite (<= x 0) y (v10 (u9 (- x 1) y))))
(define-fun
  v9
  ((x Int) (y Int)) Int (u9 1 y))
(define-fun
  f8
  ((x Int) (y Int)) Int (+ (v9 x y) (* (+ (+ x x) x) 2)))
(define-fun-rec
  u8
  ((x Int) (y Int)) Int (ite (<= x 0) y (f8 (u8 (- x 1) y) x)))
(define-fun
  v8
  ((x Int)) Int (u8 x 1))
(define-fun
  fast
  ((x Int)) Int (* (v8 x) (v17 x)))
(define-fun
  f0
  ((x Int) (y Int)) Int (+ (v1 x y) (* (+ (+ x x) x) 2)))
(define-fun-rec
  u0
  ((x Int) (y Int)) Int (ite (<= x 0) y (f0 (u0 (- x 1) y) x)))
(define-fun
  v0
  ((x Int)) Int (u0 x 1))
(define-fun
  small
  ((x Int)) Int (* (v0 x) (v7 x)))
(assert-not
  (forall ((c Int)) (or (not (>= c 0)) (= (small c) (fast c)))))
