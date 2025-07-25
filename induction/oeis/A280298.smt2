(define-fun-rec
  v9
  ((x Int) (y Int) (z Int)) Int (ite (<= x 0) z (v9 (- x 1) y z)))
(define-fun-rec
  v7
  ((x Int) (y Int) (z Int)) Int (ite (<= x 0) z (v7 (- x 1) y z)))
(define-fun-rec
  v2
  ((x Int) (y Int) (z Int)) Int (ite (<= x 0) z (v2 (- x 1) y z)))
(define-fun-rec
  v0
  ((x Int) (y Int) (z Int)) Int (ite (<= x 0) z (v0 (- x 1) y z)))
(define-fun-rec
  u4
  ((x Int) (y Int)) Int (ite (<= x 0) y (* (u4 (- x 1) y) x)))
(define-fun
  v4
  ((x Int)) Int (u4 x 1))
(define-fun
  j9
  ((x Int)) Int x)
(define-fun
  j7
  ((x Int)) Int x)
(define-fun
  j2
  ((x Int)) Int x)
(define-fun
  j0
  ((x Int)) Int x)
(define-fun
  h8
  ((x Int) (y Int)) Int y)
(define-fun
  h6
  ((x Int)) Int (* x x))
(define-fun
  h14
  ((x Int)) Int (* x x))
(define-fun
  h11
  ((x Int)) Int x)
(define-fun
  h1
  ((x Int) (y Int)) Int y)
(define-fun
  g9
  ((x Int) (y Int)) Int y)
(define-fun
  g7
  ((x Int) (y Int)) Int y)
(define-fun
  g4
  ((x Int)) Int x)
(define-fun
  g3
  ((x Int) (y Int)) Int (+ 1 y))
(define-fun
  g2
  ((x Int) (y Int)) Int y)
(define-fun
  g12
  ((x Int)) Int (div (- x 1) 2))
(define-fun
  g11
  ((x Int)) Int (mod (+ 1 x) 2))
(define-fun
  g10
  ((x Int) (y Int)) Int (+ 1 y))
(define-fun
  g0
  ((x Int) (y Int)) Int y)
(define-fun
  f6
  ((x Int)) Int (* x x))
(define-fun-rec
  u6
  ((x Int) (y Int)) Int (ite (<= x 0) y (f6 (u6 (- x 1) y))))
(define-fun
  v6
  ((x Int)) Int (u6 2 (h6 x)))
(define-fun
  f5
  ((x Int)) Int (* x x))
(define-fun-rec
  u5
  ((x Int) (y Int)) Int (ite (<= x 0) y (f5 (u5 (- x 1) y))))
(define-fun
  v5
  ((x Int)) Int (u5 2 (v6 x)))
(define-fun
  f3
  ((x Int)) Int (mod (+ 1 (v4 x)) (+ 1 x)))
(define-fun-rec
  t3
  ((x Int)) Int (ite (<= (f3 x) 0) x (t3 (+ x 1))))
(define-fun-rec
  u3
  ((x Int)) Int (ite (<= x 0) (t3 0) (t3 (+ (u3 (- x 1)) 1))))
(define-fun
  v3
  ((x Int) (y Int)) Int (u3 (g3 x y)))
(define-fun
  f2
  ((x Int) (y Int)) Int (* (+ (v3 x y) 1) (v5 x)))
(define-fun-rec
  u2
  ((x Int) (y Int) (z Int)) Int
  (ite (<= x 0) y (f2 (u2 (- x 1) y z) (v2 (- x 1) y z))))
(define-fun
  w2
  ((x Int)) Int (u2 2 1 x))
(define-fun-rec
  u1
  ((x Int) (y Int)) Int (ite (<= x 0) y (w2 (u1 (- x 1) y))))
(define-fun
  v1
  ((x Int) (y Int)) Int (u1 1 y))
(define-fun
  f14
  ((x Int)) Int (* x x))
(define-fun-rec
  u14
  ((x Int) (y Int)) Int (ite (<= x 0) y (f14 (u14 (- x 1) y))))
(define-fun
  v14
  ((x Int)) Int (u14 2 (h14 x)))
(define-fun
  f13
  ((x Int)) Int (* x x))
(define-fun-rec
  u13
  ((x Int) (y Int)) Int (ite (<= x 0) y (f13 (u13 (- x 1) y))))
(define-fun
  v13
  ((x Int)) Int (u13 2 (v14 x)))
(define-fun
  f12
  ((x Int)) Int (+ x x))
(define-fun-rec
  u12
  ((x Int) (y Int)) Int (ite (<= x 0) y (f12 (u12 (- x 1) y))))
(define-fun
  v12
  ((x Int)) Int (u12 (g12 x) 2))
(define-fun
  f11
  ((x Int)) Int (mod (- 1 (v12 x)) (+ 1 x)))
(define-fun-rec
  u11
  ((x Int) (y Int)) Int (ite (<= x 0) y (f11 (u11 (- x 1) y))))
(define-fun
  v11
  ((x Int)) Int (u11 (g11 x) x))
(define-fun
  f10
  ((x Int)) Int (- (v11 x) 2))
(define-fun-rec
  t10
  ((x Int)) Int (ite (<= (f10 x) 0) x (t10 (+ x 1))))
(define-fun-rec
  u10
  ((x Int)) Int (ite (<= x 0) (t10 0) (t10 (+ (u10 (- x 1)) 1))))
(define-fun
  v10
  ((x Int) (y Int)) Int (u10 (g10 x y)))
(define-fun
  f9
  ((x Int) (y Int)) Int (* (+ (v10 x y) 1) (v13 x)))
(define-fun-rec
  u9
  ((x Int) (y Int) (z Int)) Int
  (ite (<= x 0) y (f9 (u9 (- x 1) y z) (v9 (- x 1) y z))))
(define-fun
  w9
  ((x Int)) Int (u9 2 1 x))
(define-fun-rec
  u8
  ((x Int) (y Int)) Int (ite (<= x 0) y (w9 (u8 (- x 1) y))))
(define-fun
  v8
  ((x Int) (y Int)) Int (u8 1 y))
(define-fun
  f7
  ((x Int) (y Int)) Int (* (v8 x y) x))
(define-fun-rec
  u7
  ((x Int) (y Int) (z Int)) Int
  (ite (<= x 0) y (f7 (u7 (- x 1) y z) (v7 (- x 1) y z))))
(define-fun
  w7
  ((x Int)) Int (u7 2 1 x))
(define-fun
  f0
  ((x Int) (y Int)) Int (* (v1 x y) x))
(define-fun-rec
  u0
  ((x Int) (y Int) (z Int)) Int
  (ite (<= x 0) y (f0 (u0 (- x 1) y z) (v0 (- x 1) y z))))
(define-fun
  w0
  ((x Int)) Int (u0 2 1 x))
(assert-not
  (forall ((c Int)) (or (not (>= c 0)) (= (w0 c) (w7 c)))))
