(define-fun
  h9
  ((x Int)) Int x)
(define-fun
  h6
  ((x Int)) Int x)
(define-fun
  h5
  ((x Int)) Int x)
(define-fun
  h4
  ((x Int)) Int x)
(define-fun
  h3
  ((x Int)) Int x)
(define-fun
  h2
  ((x Int)) Int x)
(define-fun
  h14
  ((x Int)) Int x)
(define-fun
  h13
  ((x Int)) Int x)
(define-fun
  h12
  ((x Int)) Int (div x 2))
(define-fun
  h11
  ((x Int)) Int x)
(define-fun
  h10
  ((x Int)) Int x)
(define-fun
  h0
  ((x Int)) Int x)
(define-fun
  g8
  ((x Int) (y Int)) Int y)
(define-fun
  g7
  ((x Int)) Int x)
(define-fun
  g6
  ((x Int)) Int (mod x 2))
(define-fun
  g5
  () Int (+ 2 (+ 2 2)))
(define-fun
  g4
  ((x Int)) Int (mod x 2))
(define-fun
  g3
  ((x Int)) Int (mod x 2))
(define-fun
  g15
  ((x Int)) Int (mod x 2))
(define-fun
  g14
  ((x Int)) Int (mod x 2))
(define-fun
  g11
  ((x Int)) Int (mod x 2))
(define-fun
  g10
  ((x Int)) Int (mod x 2))
(define-fun
  g1
  ((x Int) (y Int)) Int y)
(define-fun
  g0
  ((x Int)) Int x)
(define-fun
  f6
  ((x Int)) Int (div x 2))
(define-fun-rec
  u6
  ((x Int) (y Int)) Int (ite (<= x 0) y (f6 (u6 (- x 1) y))))
(define-fun
  v6
  ((x Int)) Int (u6 (g6 x) x))
(define-fun-rec
  u5
  ((x Int) (y Int)) Int (ite (<= x 0) y (v6 (u5 (- x 1) y))))
(define-fun
  v5
  ((x Int)) Int (u5 g5 x))
(define-fun
  f4
  ((x Int)) Int (+ 1 (v5 x)))
(define-fun-rec
  u4
  ((x Int) (y Int)) Int (ite (<= x 0) y (f4 (u4 (- x 1) y))))
(define-fun
  v4
  ((x Int)) Int (u4 (g4 x) x))
(define-fun
  f3
  ((x Int)) Int (div (v4 x) 2))
(define-fun-rec
  u3
  ((x Int) (y Int)) Int (ite (<= x 0) y (f3 (u3 (- x 1) y))))
(define-fun
  v3
  ((x Int)) Int (u3 (g3 x) x))
(define-fun-rec
  u2
  ((x Int) (y Int)) Int (ite (<= x 0) y (v3 (u2 (- x 1) y))))
(define-fun
  v2
  ((x Int)) Int (u2 2 x))
(define-fun
  f15
  () Int (+ 2 2))
(define-fun
  u15
  ((x Int) (y Int)) Int (ite (<= x 0) y f15))
(define-fun
  v15
  ((x Int)) Int (u15 (g15 x) 0))
(define-fun
  f14
  ((x Int)) Int (div x 2))
(define-fun-rec
  u14
  ((x Int) (y Int)) Int (ite (<= x 0) y (f14 (u14 (- x 1) y))))
(define-fun
  v14
  ((x Int)) Int (u14 (g14 x) x))
(define-fun-rec
  u13
  ((x Int) (y Int)) Int (ite (<= x 0) y (v14 (u13 (- x 1) y))))
(define-fun
  v13
  ((x Int)) Int (u13 (v15 x) x))
(define-fun
  f12
  ((x Int)) Int (+ 1 (v13 x)))
(define-fun-rec
  u12
  ((x Int) (y Int)) Int (ite (<= x 0) y (f12 (u12 (- x 1) y))))
(define-fun
  v12
  ((x Int)) Int (u12 1 (h12 x)))
(define-fun-rec
  u11
  ((x Int) (y Int)) Int (ite (<= x 0) y (v12 (u11 (- x 1) y))))
(define-fun
  v11
  ((x Int)) Int (u11 (g11 x) x))
(define-fun
  f10
  ((x Int)) Int (div (v11 x) 2))
(define-fun-rec
  u10
  ((x Int) (y Int)) Int (ite (<= x 0) y (f10 (u10 (- x 1) y))))
(define-fun
  v10
  ((x Int)) Int (u10 (g10 x) x))
(define-fun-rec
  u9
  ((x Int) (y Int)) Int (ite (<= x 0) y (v10 (u9 (- x 1) y))))
(define-fun
  v9
  ((x Int)) Int (u9 2 x))
(define-fun
  f8
  ((x Int)) Int (mod (v9 x) 2))
(define-fun-rec
  t8
  ((x Int)) Int (ite (<= (f8 x) 0) x (t8 (+ x 1))))
(define-fun-rec
  u8
  ((x Int)) Int (ite (<= x 0) (t8 0) (t8 (+ (u8 (- x 1)) 1))))
(define-fun
  v8
  ((x Int) (y Int)) Int (u8 y))
(define-fun-rec
  u7
  ((x Int) (y Int)) Int (ite (<= x 0) y (v8 (u7 (- x 1) y) x)))
(define-fun
  v7
  ((x Int)) Int (u7 x 0))
(define-fun
  f1
  ((x Int)) Int (mod (+ (v2 x) 2) 2))
(define-fun-rec
  t1
  ((x Int)) Int (ite (<= (f1 x) 0) x (t1 (+ x 1))))
(define-fun-rec
  u1
  ((x Int)) Int (ite (<= x 0) (t1 0) (t1 (+ (u1 (- x 1)) 1))))
(define-fun
  v1
  ((x Int) (y Int)) Int (u1 y))
(define-fun-rec
  u0
  ((x Int) (y Int)) Int (ite (<= x 0) y (v1 (u0 (- x 1) y) x)))
(define-fun
  v0
  ((x Int)) Int (u0 x x))
(assert-not
  (forall ((c Int)) (or (not (>= c 0)) (= (v0 c) (v7 c)))))
