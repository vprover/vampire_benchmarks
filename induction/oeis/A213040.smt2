(define-fun-rec
  v11
  ((x Int) (y Int) (z Int)) Int (ite (<= x 0) z (v11 (- x 1) y z)))
(define-fun-rec
  u12
  ((x Int) (y Int)) Int (ite (<= x 0) y (+ (u12 (- x 1) y) x)))
(define-fun
  j11
  ((x Int)) Int (div x 2))
(define-fun
  i11
  () Int (+ 2 2))
(define-fun
  h9
  ((x Int) (y Int)) Int y)
(define-fun
  h7
  ((x Int) (y Int)) Int y)
(define-fun
  h4
  ((x Int)) Int x)
(define-fun
  h3
  ((x Int) (y Int)) Int y)
(define-fun
  h12
  ((x Int) (y Int)) Int y)
(define-fun
  h11
  () Int (+ 1 2))
(define-fun
  h10
  ((x Int)) Int x)
(define-fun
  h1
  ((x Int) (y Int)) Int y)
(define-fun
  g8
  ((x Int)) Int (- x 1))
(define-fun
  g6
  ((x Int)) Int x)
(define-fun
  g5
  ((x Int)) Int x)
(define-fun
  g2
  ((x Int)) Int (- x 1))
(define-fun
  g12
  ((x Int)) Int x)
(define-fun
  g11
  ((x Int) (y Int)) Int y)
(define-fun
  g0
  ((x Int)) Int x)
(define-fun
  f5
  ((x Int) (y Int)) Int (+ (div y (* x x)) x))
(define-fun-rec
  u5
  ((x Int) (y Int)) Int (ite (<= x 0) y (f5 (u5 (- x 1) y) x)))
(define-fun
  v5
  ((x Int)) Int (u5 x 1))
(define-fun
  f4
  ((x Int)) Int (+ (- 1 (v5 x)) x))
(define-fun-rec
  u4
  ((x Int) (y Int)) Int (ite (<= x 0) y (f4 (u4 (- x 1) y))))
(define-fun
  v4
  ((x Int)) Int (u4 2 x))
(define-fun
  f3
  ((x Int)) Int (mod (+ (+ (v4 x) 1) x) 2))
(define-fun-rec
  u3
  ((x Int) (y Int)) Int (ite (<= x 0) y (f3 (u3 (- x 1) y))))
(define-fun
  v3
  ((x Int) (y Int)) Int (u3 1 y))
(define-fun
  f2
  ((x Int) (y Int)) Int (+ (v3 x y) x))
(define-fun-rec
  u2
  ((x Int) (y Int)) Int (ite (<= x 0) y (f2 (u2 (- x 1) y) x)))
(define-fun
  v2
  ((x Int)) Int (u2 (g2 x) 1))
(define-fun
  f11
  ((x Int) (y Int)) Int (div (u12 x y) x))
(define-fun-rec
  u11
  ((x Int) (y Int) (z Int)) Int
  (ite (<= x 0) y (f11 (u11 (- x 1) y z) (v11 (- x 1) y z))))
(define-fun
  w11
  ((x Int)) Int (u11 h11 i11 (j11 x)))
(define-fun
  f10
  ((x Int)) Int (+ (w11 x) x))
(define-fun-rec
  u10
  ((x Int) (y Int)) Int (ite (<= x 0) y (f10 (u10 (- x 1) y))))
(define-fun
  v10
  ((x Int)) Int (u10 2 x))
(define-fun
  f9
  ((x Int)) Int (mod (+ (+ (v10 x) 1) x) 2))
(define-fun-rec
  u9
  ((x Int) (y Int)) Int (ite (<= x 0) y (f9 (u9 (- x 1) y))))
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
  ((x Int)) Int (u8 (g8 x) 1))
(define-fun
  f7
  ((x Int)) Int (- (* (v8 x) 2) x))
(define-fun-rec
  u7
  ((x Int) (y Int)) Int (ite (<= x 0) y (f7 (u7 (- x 1) y))))
(define-fun
  v7
  ((x Int) (y Int)) Int (u7 1 y))
(define-fun
  f6
  ((x Int) (y Int)) Int (+ (v7 x y) x))
(define-fun-rec
  u6
  ((x Int) (y Int)) Int (ite (<= x 0) y (f6 (u6 (- x 1) y) x)))
(define-fun
  v6
  ((x Int)) Int (u6 x 1))
(define-fun
  fast
  ((x Int)) Int (+ (v6 x) x))
(define-fun
  f1
  ((x Int)) Int (- (* (v2 x) 2) x))
(define-fun-rec
  u1
  ((x Int) (y Int)) Int (ite (<= x 0) y (f1 (u1 (- x 1) y))))
(define-fun
  v1
  ((x Int) (y Int)) Int (u1 1 y))
(define-fun
  f0
  ((x Int) (y Int)) Int (+ (v1 x y) x))
(define-fun-rec
  u0
  ((x Int) (y Int)) Int (ite (<= x 0) y (f0 (u0 (- x 1) y) x)))
(define-fun
  v0
  ((x Int)) Int (u0 x 1))
(define-fun
  small
  ((x Int)) Int (+ (v0 x) x))
(assert-not
  (forall ((c Int)) (or (not (>= c 0)) (= (small c) (fast c)))))
