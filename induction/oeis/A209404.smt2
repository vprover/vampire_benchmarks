(define-fun-rec
  u5
  ((x Int) (y Int)) Int (ite (<= x 0) y (+ (u5 (- x 1) y) x)))
(define-fun
  v5
  ((x Int) (y Int)) Int (u5 y x))
(define-fun
  h9
  ((x Int)) Int x)
(define-fun
  h8
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
  h11
  ((x Int)) Int x)
(define-fun
  h10
  ((x Int)) Int x)
(define-fun
  h1
  ((x Int)) Int x)
(define-fun
  g9
  ((x Int) (y Int)) Int y)
(define-fun
  g8
  ((x Int) (y Int)) Int y)
(define-fun
  g7
  ((x Int)) Int (+ 1 x))
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
  g12
  ((x Int)) Int x)
(define-fun
  g11
  ((x Int) (y Int)) Int y)
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
  ((x Int)) Int (u6 x 1))
(define-fun
  f4
  ((x Int) (y Int)) Int (+ (v5 x y) y))
(define-fun-rec
  u4
  ((x Int) (y Int)) Int (ite (<= x 0) y (f4 (u4 (- x 1) y) x)))
(define-fun
  v4
  ((x Int) (y Int)) Int (u4 y x))
(define-fun-rec
  u3
  ((x Int) (y Int)) Int (ite (<= x 0) y (v4 (u3 (- x 1) y) x)))
(define-fun
  v3
  ((x Int) (y Int)) Int (u3 y x))
(define-fun-rec
  u2
  ((x Int) (y Int)) Int (ite (<= x 0) y (v3 (u2 (- x 1) y) x)))
(define-fun
  v2
  ((x Int) (y Int)) Int (u2 y x))
(define-fun-rec
  u1
  ((x Int) (y Int)) Int (ite (<= x 0) y (v2 (u1 (- x 1) y) x)))
(define-fun
  v1
  ((x Int) (y Int)) Int (u1 y x))
(define-fun-rec
  u0
  ((x Int) (y Int)) Int (ite (<= x 0) y (v1 (u0 (- x 1) y) x)))
(define-fun
  v0
  ((x Int)) Int (u0 (g0 x) 0))
(define-fun
  small
  ((x Int)) Int (div (* (v0 x) (v6 x)) 2))
(define-fun
  f12
  ((x Int)) Int (+ x x))
(define-fun-rec
  u12
  ((x Int) (y Int)) Int (ite (<= x 0) y (f12 (u12 (- x 1) y))))
(define-fun
  v12
  ((x Int)) Int (u12 x 1))
(define-fun
  f11
  ((x Int) (y Int)) Int (+ (+ (* (+ 2 y) y) x) y))
(define-fun-rec
  u11
  ((x Int) (y Int)) Int (ite (<= x 0) y (f11 (u11 (- x 1) y) x)))
(define-fun
  v11
  ((x Int) (y Int)) Int (u11 y x))
(define-fun-rec
  u10
  ((x Int) (y Int)) Int (ite (<= x 0) y (v11 (u10 (- x 1) y) x)))
(define-fun
  v10
  ((x Int) (y Int)) Int (u10 y x))
(define-fun-rec
  u9
  ((x Int) (y Int)) Int (ite (<= x 0) y (v10 (u9 (- x 1) y) x)))
(define-fun
  v9
  ((x Int) (y Int)) Int (u9 y x))
(define-fun-rec
  u8
  ((x Int) (y Int)) Int (ite (<= x 0) y (v9 (u8 (- x 1) y) x)))
(define-fun
  v8
  ((x Int) (y Int)) Int (u8 y x))
(define-fun-rec
  u7
  ((x Int) (y Int)) Int (ite (<= x 0) y (v8 (u7 (- x 1) y) x)))
(define-fun
  v7
  ((x Int)) Int (u7 (g7 x) 0))
(define-fun
  fast
  ((x Int)) Int (div (div (* (v7 x) (v12 x)) 2) 2))
(assert-not
  (forall ((c Int)) (or (not (>= c 0)) (= (small c) (fast c)))))
