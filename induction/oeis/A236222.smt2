(define-fun-rec
  v8
  ((x Int) (y Int) (z Int)) Int (ite (<= x 0) z (v8 (- x 1) y z)))
(define-fun-rec
  v6
  ((x Int) (y Int) (z Int)) Int (ite (<= x 0) z (v6 (- x 1) y z)))
(define-fun-rec
  v1
  ((x Int) (y Int) (z Int)) Int (ite (<= x 0) z (v1 (- x 1) y z)))
(define-fun-rec
  u3
  ((x Int) (y Int)) Int (ite (<= x 0) y (* (u3 (- x 1) y) x)))
(define-fun
  v3
  ((x Int)) Int (u3 x 1))
(define-fun
  j8
  ((x Int)) Int x)
(define-fun
  j6
  ((x Int)) Int (- x 1))
(define-fun
  j1
  ((x Int) (y Int)) Int y)
(define-fun
  h8
  () Int (+ 1 2))
(define-fun
  h7
  ((x Int) (y Int)) Int y)
(define-fun
  h5
  ((x Int) (y Int)) Int y)
(define-fun
  h10
  ((x Int)) Int x)
(define-fun
  h1
  () Int (+ 2 (* 2 (+ 2 (+ 2 2)))))
(define-fun
  g9
  ((x Int) (y Int)) Int (+ 1 y))
(define-fun
  g8
  ((x Int) (y Int)) Int y)
(define-fun
  g6
  ((x Int) (y Int)) Int y)
(define-fun
  g4
  ((x Int)) Int (+ 1 x))
(define-fun
  g3
  ((x Int)) Int x)
(define-fun
  g2
  ((x Int) (y Int)) Int y)
(define-fun
  g11
  ((x Int)) Int (div (- x 1) 2))
(define-fun
  g10
  ((x Int)) Int (mod (+ 1 x) 2))
(define-fun
  g1
  ((x Int) (y Int)) Int y)
(define-fun
  g0
  ((x Int)) Int (+ 1 x))
(define-fun
  f2
  ((x Int)) Int (mod (+ 1 (v3 x)) (+ 1 x)))
(define-fun-rec
  t2
  ((x Int)) Int (ite (<= (f2 x) 0) x (t2 (+ x 1))))
(define-fun-rec
  u2
  ((x Int)) Int (ite (<= x 0) (t2 0) (t2 (+ (u2 (- x 1)) 1))))
(define-fun
  v2
  ((x Int) (y Int)) Int (u2 y))
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
  ((x Int) (y Int)) Int (u9 (g9 x y)))
(define-fun
  f8
  ((x Int) (y Int)) Int (* (+ (v9 x y) 1) (* x x)))
(define-fun-rec
  u8
  ((x Int) (y Int) (z Int)) Int
  (ite (<= x 0) y (f8 (u8 (- x 1) y z) (v8 (- x 1) y z))))
(define-fun
  w8
  ((x Int)) Int (u8 h8 1 x))
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
  ((x Int) (y Int) (z Int)) Int
  (ite (<= x 0) y (f6 (u6 (- x 1) y z) (v6 (- x 1) y z))))
(define-fun
  w6
  ((x Int)) Int (u6 2 1 (j6 x)))
(define-fun-rec
  u5
  ((x Int) (y Int)) Int (ite (<= x 0) y (w6 (u5 (- x 1) y))))
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
  ((x Int)) Int (u4 (g4 x) 0))
(define-fun
  f1
  ((x Int) (y Int)) Int (+ (* (v2 x y) x) x))
(define-fun-rec
  u1
  ((x Int) (y Int) (z Int)) Int
  (ite (<= x 0) y (f1 (u1 (- x 1) y z) (v1 (- x 1) y z))))
(define-fun
  w1
  ((x Int) (y Int)) Int (u1 h1 1 y))
(define-fun
  f0
  ((x Int) (y Int)) Int (+ (w1 x y) x))
(define-fun-rec
  u0
  ((x Int) (y Int)) Int (ite (<= x 0) y (f0 (u0 (- x 1) y) x)))
(define-fun
  v0
  ((x Int)) Int (u0 (g0 x) 0))
(assert-not
  (forall ((c Int)) (or (not (>= c 0)) (= (v0 c) (v4 c)))))
