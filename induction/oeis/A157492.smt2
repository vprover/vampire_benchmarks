(define-fun-rec
  v3
  ((x Int) (y Int) (z Int)) Int (ite (<= x 0) z (v3 (- x 1) y z)))
(define-fun-rec
  v10
  ((x Int) (y Int) (z Int)) Int (ite (<= x 0) z (v10 (- x 1) y z)))
(define-fun
  j3
  ((x Int)) Int x)
(define-fun
  j10
  ((x Int)) Int x)
(define-fun
  h9
  ((x Int) (y Int)) Int y)
(define-fun
  h8
  ((x Int)) Int x)
(define-fun
  h5
  ((x Int)) Int x)
(define-fun
  h2
  ((x Int) (y Int)) Int y)
(define-fun
  h12
  ((x Int)) Int x)
(define-fun
  h1
  ((x Int)) Int x)
(define-fun
  g8
  ((x Int) (y Int)) Int y)
(define-fun
  g7
  ((x Int)) Int x)
(define-fun
  g6
  ((x Int)) Int (div x 2))
(define-fun
  g5
  ((x Int)) Int (- 1 (mod x 2)))
(define-fun
  g4
  ((x Int) (y Int)) Int y)
(define-fun
  g3
  ((x Int) (y Int)) Int y)
(define-fun
  g13
  ((x Int)) Int (div (- x 1) 2))
(define-fun
  g12
  ((x Int)) Int (mod (+ 1 x) 2))
(define-fun
  g11
  ((x Int) (y Int)) Int (+ 1 y))
(define-fun
  g10
  ((x Int) (y Int)) Int y)
(define-fun
  g1
  ((x Int) (y Int)) Int y)
(define-fun
  g0
  ((x Int)) Int (+ 1 x))
(define-fun
  f6
  ((x Int)) Int (+ x x))
(define-fun-rec
  u6
  ((x Int) (y Int)) Int (ite (<= x 0) y (f6 (u6 (- x 1) y))))
(define-fun
  v6
  ((x Int)) Int (u6 (g6 x) 1))
(define-fun
  f5
  ((x Int)) Int (mod (- 1 (v6 x)) (+ 1 x)))
(define-fun-rec
  u5
  ((x Int) (y Int)) Int (ite (<= x 0) y (f5 (u5 (- x 1) y))))
(define-fun
  v5
  ((x Int)) Int (u5 (g5 x) x))
(define-fun
  f4
  ((x Int)) Int (- (v5 x) 2))
(define-fun-rec
  t4
  ((x Int)) Int (ite (<= (f4 x) 0) x (t4 (+ x 1))))
(define-fun-rec
  u4
  ((x Int)) Int (ite (<= x 0) (t4 0) (t4 (+ (u4 (- x 1)) 1))))
(define-fun
  v4
  ((x Int) (y Int)) Int (u4 y))
(define-fun
  f3
  ((x Int) (y Int)) Int (+ (* (v4 x y) x) x))
(define-fun-rec
  u3
  ((x Int) (y Int) (z Int)) Int
  (ite (<= x 0) y (f3 (u3 (- x 1) y z) (v3 (- x 1) y z))))
(define-fun
  w3
  ((x Int)) Int (u3 2 1 x))
(define-fun-rec
  u2
  ((x Int) (y Int)) Int (ite (<= x 0) y (w3 (u2 (- x 1) y))))
(define-fun
  v2
  ((x Int) (y Int)) Int (u2 1 y))
(define-fun
  f13
  ((x Int)) Int (+ x x))
(define-fun-rec
  u13
  ((x Int) (y Int)) Int (ite (<= x 0) y (f13 (u13 (- x 1) y))))
(define-fun
  v13
  ((x Int)) Int (u13 (g13 x) 2))
(define-fun
  f12
  ((x Int)) Int (mod (- 1 (v13 x)) (+ 1 x)))
(define-fun-rec
  u12
  ((x Int) (y Int)) Int (ite (<= x 0) y (f12 (u12 (- x 1) y))))
(define-fun
  v12
  ((x Int)) Int (u12 (g12 x) x))
(define-fun
  f11
  ((x Int)) Int (- (v12 x) 2))
(define-fun-rec
  t11
  ((x Int)) Int (ite (<= (f11 x) 0) x (t11 (+ x 1))))
(define-fun-rec
  u11
  ((x Int)) Int (ite (<= x 0) (t11 0) (t11 (+ (u11 (- x 1)) 1))))
(define-fun
  v11
  ((x Int) (y Int)) Int (u11 (g11 x y)))
(define-fun
  f10
  ((x Int) (y Int)) Int (* (+ (v11 x y) 1) x))
(define-fun-rec
  u10
  ((x Int) (y Int) (z Int)) Int
  (ite (<= x 0) y (f10 (u10 (- x 1) y z) (v10 (- x 1) y z))))
(define-fun
  w10
  ((x Int)) Int (u10 2 1 x))
(define-fun-rec
  u9
  ((x Int) (y Int)) Int (ite (<= x 0) y (w10 (u9 (- x 1) y))))
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
  ((x Int) (y Int)) Int (u8 y x))
(define-fun-rec
  u7
  ((x Int) (y Int)) Int (ite (<= x 0) y (v8 (u7 (- x 1) y) x)))
(define-fun
  v7
  ((x Int)) Int (u7 x 1))
(define-fun
  fast
  ((x Int)) Int (+ (+ (+ (+ (+ (+ (v7 x) x) 2) x) x) 1) x))
(define-fun
  f1
  ((x Int) (y Int)) Int (+ (v2 x y) x))
(define-fun-rec
  u1
  ((x Int) (y Int)) Int (ite (<= x 0) y (f1 (u1 (- x 1) y) x)))
(define-fun
  v1
  ((x Int) (y Int)) Int (u1 y x))
(define-fun-rec
  u0
  ((x Int) (y Int)) Int (ite (<= x 0) y (v1 (u0 (- x 1) y) x)))
(define-fun
  v0
  ((x Int)) Int (u0 (g0 x) 0))
(assert-not
  (forall ((c Int)) (or (not (>= c 0)) (= (v0 c) (fast c)))))
