(define-fun
  h8
  ((x Int) (y Int)) Int y)
(define-fun
  h13
  ((x Int) (y Int)) Int y)
(define-fun
  h10
  ((x Int) (y Int)) Int y)
(define-fun
  g9
  ((x Int)) Int x)
(define-fun
  g7
  ((x Int)) Int x)
(define-fun
  g6
  ((x Int)) Int x)
(define-fun
  g5
  ((x Int) (y Int)) Int y)
(define-fun
  g4
  ((x Int) (y Int)) Int y)
(define-fun
  g3
  ((x Int) (y Int)) Int y)
(define-fun
  g2
  ((x Int) (y Int)) Int y)
(define-fun
  g16
  ((x Int)) Int x)
(define-fun
  g15
  ((x Int)) Int x)
(define-fun
  g12
  ((x Int) (y Int)) Int y)
(define-fun
  g11
  ((x Int)) Int x)
(define-fun
  g1
  ((x Int) (y Int)) Int y)
(define-fun
  g0
  ((x Int)) Int x)
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
  ((x Int)) Int (+ 1 (* 2 (+ (+ x x) x))))
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
  ((x Int) (y Int)) Int (u4 y 1))
(define-fun
  f3
  ((x Int) (y Int)) Int (+ (+ (v4 x y) (* 2 (+ x x))) x))
(define-fun-rec
  u3
  ((x Int) (y Int)) Int (ite (<= x 0) y (f3 (u3 (- x 1) y) x)))
(define-fun
  v3
  ((x Int) (y Int)) Int (u3 y 1))
(define-fun
  f2
  ((x Int) (y Int)) Int (+ (+ (v3 x y) x) x))
(define-fun-rec
  u2
  ((x Int) (y Int)) Int (ite (<= x 0) y (f2 (u2 (- x 1) y) x)))
(define-fun
  v2
  ((x Int) (y Int)) Int (u2 y 1))
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
  ((x Int)) Int (+ 2 (+ x x)))
(define-fun-rec
  u15
  ((x Int) (y Int)) Int (ite (<= x 0) y (f15 (u15 (- x 1) y))))
(define-fun
  v15
  ((x Int)) Int (u15 x 2))
(define-fun
  f14
  ((x Int)) Int (+ (* x x) x))
(define-fun-rec
  u14
  ((x Int) (y Int)) Int (ite (<= x 0) y (f14 (u14 (- x 1) y))))
(define-fun
  v14
  ((x Int)) Int (u14 1 (v15 x)))
(define-fun
  f13
  ((x Int)) Int (div (div (v14 x) 2) (+ 1 2)))
(define-fun-rec
  u13
  ((x Int) (y Int)) Int (ite (<= x 0) y (f13 (u13 (- x 1) y))))
(define-fun
  v13
  ((x Int) (y Int)) Int (u13 1 y))
(define-fun
  f12
  ((x Int) (y Int)) Int (+ (+ (+ (v13 x y) x) x) x))
(define-fun-rec
  u12
  ((x Int) (y Int)) Int (ite (<= x 0) y (f12 (u12 (- x 1) y) x)))
(define-fun
  v12
  ((x Int) (y Int)) Int (u12 y 1))
(define-fun
  f11
  ((x Int) (y Int)) Int (+ (+ (v12 x y) (* (+ x x) 2)) x))
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
  ((x Int) (y Int)) Int
  (+ (+ (+ (+ (+ (+ (+ (v10 x y) x) x) x) x) x) x) x))
(define-fun-rec
  u9
  ((x Int) (y Int)) Int (ite (<= x 0) y (f9 (u9 (- x 1) y) x)))
(define-fun
  v9
  ((x Int)) Int (u9 x 1))
(define-fun-rec
  u8
  ((x Int) (y Int)) Int (ite (<= x 0) y (v9 (u8 (- x 1) y))))
(define-fun
  v8
  ((x Int) (y Int)) Int (u8 1 y))
(define-fun
  f7
  ((x Int) (y Int)) Int (+ (v8 x y) (* (+ (+ x x) x) 2)))
(define-fun-rec
  u7
  ((x Int) (y Int)) Int (ite (<= x 0) y (f7 (u7 (- x 1) y) x)))
(define-fun
  v7
  ((x Int)) Int (u7 x 1))
(define-fun
  fast
  ((x Int)) Int (* (v7 x) (v16 x)))
(define-fun
  f1
  ((x Int) (y Int)) Int (+ (+ (+ (v2 x y) x) x) x))
(define-fun-rec
  u1
  ((x Int) (y Int)) Int (ite (<= x 0) y (f1 (u1 (- x 1) y) x)))
(define-fun
  v1
  ((x Int) (y Int)) Int (u1 y 1))
(define-fun
  f0
  ((x Int) (y Int)) Int (+ (+ (v1 x y) (* (+ (+ x x) x) 2)) x))
(define-fun-rec
  u0
  ((x Int) (y Int)) Int (ite (<= x 0) y (f0 (u0 (- x 1) y) x)))
(define-fun
  v0
  ((x Int)) Int (u0 x 1))
(define-fun
  small
  ((x Int)) Int (* (v0 x) (v6 x)))
(assert-not
  (forall ((c Int)) (or (not (>= c 0)) (= (small c) (fast c)))))
