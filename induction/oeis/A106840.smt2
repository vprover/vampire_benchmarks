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
  ((x Int)) Int (div x 2))
(define-fun
  h3
  ((x Int)) Int x)
(define-fun
  h2
  ((x Int)) Int (div x 2))
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
  ((x Int)) Int (div x 2))
(define-fun
  h1
  ((x Int)) Int x)
(define-fun
  g8
  ((x Int)) Int (+ 1 x))
(define-fun
  g7
  ((x Int)) Int (mod x 2))
(define-fun
  g6
  ((x Int)) Int (mod x 2))
(define-fun
  g3
  ((x Int)) Int (mod x 2))
(define-fun
  g2
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
  g0
  ((x Int)) Int (+ 1 x))
(define-fun
  f7
  () Int (+ 2 (+ 2 2)))
(define-fun
  u7
  ((x Int) (y Int)) Int (ite (<= x 0) y f7))
(define-fun
  v7
  ((x Int)) Int (u7 (g7 x) 1))
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
  ((x Int)) Int (u5 (v7 x) x))
(define-fun
  f4
  ((x Int)) Int (+ 1 (v5 x)))
(define-fun-rec
  u4
  ((x Int) (y Int)) Int (ite (<= x 0) y (f4 (u4 (- x 1) y))))
(define-fun
  v4
  ((x Int)) Int (u4 1 (h4 x)))
(define-fun-rec
  u3
  ((x Int) (y Int)) Int (ite (<= x 0) y (v4 (u3 (- x 1) y))))
(define-fun
  v3
  ((x Int)) Int (u3 (g3 x) x))
(define-fun
  f2
  ((x Int)) Int (div (v3 x) 2))
(define-fun-rec
  u2
  ((x Int) (y Int)) Int (ite (<= x 0) y (f2 (u2 (- x 1) y))))
(define-fun
  v2
  ((x Int)) Int (u2 (g2 x) (h2 x)))
(define-fun
  f15
  () Int (+ 2 (+ 2 2)))
(define-fun
  u15
  ((x Int) (y Int)) Int (ite (<= x 0) y f15))
(define-fun
  v15
  ((x Int)) Int (u15 (g15 x) 1))
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
  ((x Int)) Int (u10 (g10 x) (h10 x)))
(define-fun
  f9
  ((x Int)) Int (+ (+ (mod (+ (v10 x) 1) 2) 1) x))
(define-fun-rec
  u9
  ((x Int) (y Int)) Int (ite (<= x 0) y (f9 (u9 (- x 1) y))))
(define-fun
  v9
  ((x Int)) Int (u9 2 x))
(define-fun
  f8
  ((x Int)) Int (mod (- (mod (- (v9 x) x) (+ 1 2)) 1) (+ 1 x)))
(define-fun-rec
  t8
  ((x Int)) Int (ite (<= (f8 x) 0) x (t8 (+ x 1))))
(define-fun-rec
  u8
  ((x Int)) Int (ite (<= x 0) (t8 0) (t8 (+ (u8 (- x 1)) 1))))
(define-fun
  v8
  ((x Int)) Int (u8 (g8 x)))
(define-fun
  fast
  ((x Int)) Int (- (+ (div (+ (v8 x) 1) 2) x) x))
(define-fun
  f1
  ((x Int)) Int (+ (+ (mod (+ (v2 x) 1) 2) 1) x))
(define-fun-rec
  u1
  ((x Int) (y Int)) Int (ite (<= x 0) y (f1 (u1 (- x 1) y))))
(define-fun
  v1
  ((x Int)) Int (u1 2 x))
(define-fun
  f0
  ((x Int)) Int (mod (* (mod (div (- (v1 x) x) 2) 2) 2) (+ 1 x)))
(define-fun-rec
  t0
  ((x Int)) Int (ite (<= (f0 x) 0) x (t0 (+ x 1))))
(define-fun-rec
  u0
  ((x Int)) Int (ite (<= x 0) (t0 0) (t0 (+ (u0 (- x 1)) 1))))
(define-fun
  v0
  ((x Int)) Int (u0 (g0 x)))
(define-fun
  small
  ((x Int)) Int (+ (div (v0 x) 2) 1))
(assert-not
  (forall ((c Int)) (or (not (>= c 0)) (= (small c) (fast c)))))
