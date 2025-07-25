(define-fun-rec
  v8
  ((x Int) (y Int) (z Int)) Int (ite (<= x 0) z (v8 (- x 1) y z)))
(define-fun-rec
  v2
  ((x Int) (y Int) (z Int)) Int (ite (<= x 0) z (v2 (- x 1) y z)))
(define-fun
  u5
  ((x Int) (y Int)) Int (ite (<= x 0) y 1))
(define-fun
  v5
  ((x Int)) Int (u5 x x))
(define-fun-rec
  u4
  ((x Int) (y Int)) Int (ite (<= x 0) y (* (u4 (- x 1) y) x)))
(define-fun
  v4
  ((x Int)) Int (u4 x 1))
(define-fun
  j8
  ((x Int)) Int x)
(define-fun
  j2
  ((x Int)) Int x)
(define-fun
  h8
  ((x Int)) Int x)
(define-fun
  h7
  ((x Int) (y Int)) Int y)
(define-fun
  h5
  ((x Int)) Int x)
(define-fun
  h2
  ((x Int)) Int x)
(define-fun
  h10
  ((x Int)) Int x)
(define-fun
  h1
  ((x Int) (y Int)) Int y)
(define-fun
  g9
  ((x Int) (y Int)) Int y)
(define-fun
  g8
  ((x Int) (y Int)) Int y)
(define-fun
  g6
  ((x Int)) Int x)
(define-fun
  g5
  ((x Int)) Int x)
(define-fun
  g4
  ((x Int)) Int x)
(define-fun
  g3
  ((x Int) (y Int)) Int y)
(define-fun
  g2
  ((x Int) (y Int)) Int y)
(define-fun
  g12
  ((x Int)) Int (- 1 x))
(define-fun
  g11
  ((x Int)) Int (div (- x 1) 2))
(define-fun
  g10
  ((x Int)) Int (mod (+ 1 x) 2))
(define-fun
  g0
  ((x Int)) Int x)
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
  ((x Int) (y Int)) Int (u3 y))
(define-fun
  f2
  ((x Int) (y Int)) Int (+ (* (v3 x y) x) x))
(define-fun-rec
  u2
  ((x Int) (y Int) (z Int)) Int
  (ite (<= x 0) y (f2 (u2 (- x 1) y z) (v2 (- x 1) y z))))
(define-fun
  w2
  ((x Int)) Int (u2 x 1 x))
(define-fun-rec
  u1
  ((x Int) (y Int)) Int (ite (<= x 0) y (w2 (u1 (- x 1) y))))
(define-fun
  v1
  ((x Int) (y Int)) Int (u1 1 y))
(define-fun
  f12
  ((x Int)) Int (- x 1))
(define-fun-rec
  u12
  ((x Int) (y Int)) Int (ite (<= x 0) y (f12 (u12 (- x 1) y))))
(define-fun
  v12
  ((x Int)) Int (u12 (g12 x) 1))
(define-fun
  f11
  ((x Int)) Int (+ x x))
(define-fun-rec
  u11
  ((x Int) (y Int)) Int (ite (<= x 0) y (f11 (u11 (- x 1) y))))
(define-fun
  v11
  ((x Int)) Int (u11 (g11 x) 2))
(define-fun
  f10
  ((x Int)) Int (mod (- 1 (v11 x)) (+ 1 x)))
(define-fun-rec
  u10
  ((x Int) (y Int)) Int (ite (<= x 0) y (f10 (u10 (- x 1) y))))
(define-fun
  v10
  ((x Int)) Int (u10 (g10 x) x))
(define-fun
  f9
  ((x Int)) Int (- (v10 x) 2))
(define-fun-rec
  t9
  ((x Int)) Int (ite (<= (f9 x) 0) x (t9 (+ x 1))))
(define-fun-rec
  u9
  ((x Int)) Int (ite (<= x 0) (t9 0) (t9 (+ (u9 (- x 1)) 1))))
(define-fun
  v9
  ((x Int) (y Int)) Int (u9 y))
(define-fun
  f8
  ((x Int) (y Int)) Int (* (+ (v9 x y) 1) x))
(define-fun-rec
  u8
  ((x Int) (y Int) (z Int)) Int
  (ite (<= x 0) y (f8 (u8 (- x 1) y z) (v8 (- x 1) y z))))
(define-fun
  w8
  ((x Int)) Int (u8 x 1 x))
(define-fun-rec
  u7
  ((x Int) (y Int)) Int (ite (<= x 0) y (w8 (u7 (- x 1) y))))
(define-fun
  v7
  ((x Int) (y Int)) Int (u7 1 y))
(define-fun
  f6
  ((x Int) (y Int)) Int (* (v7 x y) x))
(define-fun-rec
  u6
  ((x Int) (y Int)) Int (ite (<= x 0) y (f6 (u6 (- x 1) y) x)))
(define-fun
  v6
  ((x Int)) Int (u6 x 1))
(define-fun
  fast
  ((x Int)) Int (- (v6 x) (v12 x)))
(define-fun
  f0
  ((x Int) (y Int)) Int (* (v1 x y) x))
(define-fun-rec
  u0
  ((x Int) (y Int)) Int (ite (<= x 0) y (f0 (u0 (- x 1) y) x)))
(define-fun
  v0
  ((x Int)) Int (u0 x 1))
(define-fun
  small
  ((x Int)) Int (- (v0 x) (v5 x)))
(assert-not
  (forall ((c Int)) (or (not (>= c 0)) (= (small c) (fast c)))))
