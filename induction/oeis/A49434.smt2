(define-fun
  h8
  ((x Int) (y Int)) Int y)
(define-fun
  h5
  ((x Int) (y Int)) Int y)
(define-fun
  h3
  ((x Int) (y Int)) Int y)
(define-fun
  h17
  ((x Int) (y Int)) Int y)
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
  ((x Int) (y Int)) Int (+ y y))
(define-fun
  g7
  ((x Int) (y Int)) Int y)
(define-fun
  g6
  ((x Int)) Int x)
(define-fun
  g4
  ((x Int)) Int x)
(define-fun
  g2
  ((x Int)) Int x)
(define-fun
  g19
  ((x Int)) Int x)
(define-fun
  g16
  ((x Int) (y Int)) Int y)
(define-fun
  g15
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
  f8
  ((x Int) (y Int)) Int (+ (+ (* (+ (- y 1) y) (* y y)) x) x))
(define-funs-rec
  ((u8
    ((x Int) (y Int) (z Int)) Int)
   (v8
    ((x Int) (y Int) (z Int)) Int))
  ((ite (<= x 0) y (f8 (u8 (- x 1) y z) (v8 (- x 1) y z)))
   (ite (<= x 0) z (g8 (u8 (- x 1) y z) (v8 (- x 1) y z)))))
(define-fun
  w8
  ((x Int) (y Int)) Int (u8 y 1 2))
(define-fun
  f7
  ((x Int) (y Int)) Int (+ (+ (w8 x y) (* 2 (+ (+ x x) x))) x))
(define-fun-rec
  u7
  ((x Int) (y Int)) Int (ite (<= x 0) y (f7 (u7 (- x 1) y) x)))
(define-fun
  v7
  ((x Int) (y Int)) Int (u7 y 1))
(define-fun
  f6
  ((x Int) (y Int)) Int (+ (+ (+ (v7 x y) x) x) x))
(define-fun-rec
  u6
  ((x Int) (y Int)) Int (ite (<= x 0) y (f6 (u6 (- x 1) y) x)))
(define-fun
  v6
  ((x Int)) Int (u6 x 1))
(define-fun-rec
  u5
  ((x Int) (y Int)) Int (ite (<= x 0) y (v6 (u5 (- x 1) y))))
(define-fun
  v5
  ((x Int) (y Int)) Int (u5 1 y))
(define-fun
  f4
  ((x Int) (y Int)) Int (+ (+ (+ (+ (+ (v5 x y) x) x) x) x) x))
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
  ((x Int) (y Int)) Int (+ (v3 x y) (* (+ (+ x x) x) 2)))
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
  f19
  ((x Int)) Int (+ 2 (+ x x)))
(define-fun-rec
  u19
  ((x Int) (y Int)) Int (ite (<= x 0) y (f19 (u19 (- x 1) y))))
(define-fun
  v19
  ((x Int)) Int (u19 x 2))
(define-fun
  f18
  ((x Int)) Int (+ (* x x) x))
(define-fun-rec
  u18
  ((x Int) (y Int)) Int (ite (<= x 0) y (f18 (u18 (- x 1) y))))
(define-fun
  v18
  ((x Int)) Int (u18 1 (v19 x)))
(define-fun
  f17
  ((x Int)) Int (div (div (v18 x) 2) (+ 1 2)))
(define-fun-rec
  u17
  ((x Int) (y Int)) Int (ite (<= x 0) y (f17 (u17 (- x 1) y))))
(define-fun
  v17
  ((x Int) (y Int)) Int (u17 1 y))
(define-fun
  f16
  ((x Int) (y Int)) Int (+ (+ (+ (v17 x y) x) x) x))
(define-fun-rec
  u16
  ((x Int) (y Int)) Int (ite (<= x 0) y (f16 (u16 (- x 1) y) x)))
(define-fun
  v16
  ((x Int) (y Int)) Int (u16 y 1))
(define-fun
  f15
  ((x Int) (y Int)) Int (+ (v16 x y) (* (* (+ x x) 2) 2)))
(define-fun-rec
  u15
  ((x Int) (y Int)) Int (ite (<= x 0) y (f15 (u15 (- x 1) y) x)))
(define-fun
  v15
  ((x Int)) Int (u15 x 1))
(define-fun-rec
  u14
  ((x Int) (y Int)) Int (ite (<= x 0) y (v15 (u14 (- x 1) y))))
(define-fun
  v14
  ((x Int) (y Int)) Int (u14 1 y))
(define-fun
  f13
  ((x Int) (y Int)) Int (+ (+ (v14 x y) (* (+ (+ x x) x) 2)) x))
(define-fun-rec
  u13
  ((x Int) (y Int)) Int (ite (<= x 0) y (f13 (u13 (- x 1) y) x)))
(define-fun
  v13
  ((x Int)) Int (u13 x 1))
(define-fun-rec
  u12
  ((x Int) (y Int)) Int (ite (<= x 0) y (v13 (u12 (- x 1) y))))
(define-fun
  v12
  ((x Int) (y Int)) Int (u12 1 y))
(define-fun
  f11
  ((x Int) (y Int)) Int (+ (+ (+ (+ (+ (v12 x y) x) x) x) x) x))
(define-fun-rec
  u11
  ((x Int) (y Int)) Int (ite (<= x 0) y (f11 (u11 (- x 1) y) x)))
(define-fun
  v11
  ((x Int)) Int (u11 x 1))
(define-fun-rec
  u10
  ((x Int) (y Int)) Int (ite (<= x 0) y (v11 (u10 (- x 1) y))))
(define-fun
  v10
  ((x Int) (y Int)) Int (u10 1 y))
(define-fun
  f9
  ((x Int) (y Int)) Int (+ (v10 x y) (* (+ (+ x x) x) 2)))
(define-fun-rec
  u9
  ((x Int) (y Int)) Int (ite (<= x 0) y (f9 (u9 (- x 1) y) x)))
(define-fun
  v9
  ((x Int)) Int (u9 x 1))
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
