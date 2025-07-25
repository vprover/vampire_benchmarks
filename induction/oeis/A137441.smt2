(define-fun-rec
  u4
  ((x Int) (y Int)) Int (ite (<= x 0) y (* (u4 (- x 1) y) x)))
(define-fun
  v4
  ((x Int)) Int (u4 x 1))
(define-fun
  h8
  ((x Int) (y Int)) Int y)
(define-fun
  h6
  ((x Int) (y Int)) Int y)
(define-fun
  h3
  ((x Int) (y Int)) Int y)
(define-fun
  h10
  ((x Int) (y Int)) Int y)
(define-fun
  h1
  ((x Int)) Int x)
(define-fun
  h0
  ((x Int)) Int x)
(define-fun
  g9
  ((x Int)) Int (div x 2))
(define-fun
  g7
  ((x Int)) Int x)
(define-fun
  g5
  ((x Int)) Int x)
(define-fun
  g4
  ((x Int)) Int x)
(define-fun
  g2
  ((x Int) (y Int)) Int y)
(define-fun
  g11
  ((x Int)) Int x)
(define-fun
  g1
  ((x Int) (y Int)) Int (- y 1))
(define-fun
  g0
  ((x Int)) Int x)
(define-fun
  f3
  ((x Int)) Int (mod (mod (v4 x) (+ 2 x)) 2))
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
  ((x Int) (y Int)) Int (u2 y 1))
(define-fun
  f11
  ((x Int)) Int (+ x x))
(define-fun-rec
  u11
  ((x Int) (y Int)) Int (ite (<= x 0) y (f11 (u11 (- x 1) y))))
(define-fun
  v11
  ((x Int)) Int (u11 x 1))
(define-fun
  f10
  ((x Int)) Int
  (ite (<= (- (mod (+ 1 (v11 x)) (+ 1 (+ x x))) 2) 0) 1 0))
(define-fun-rec
  u10
  ((x Int) (y Int)) Int (ite (<= x 0) y (f10 (u10 (- x 1) y))))
(define-fun
  v10
  ((x Int) (y Int)) Int (u10 1 y))
(define-fun
  f9
  ((x Int) (y Int)) Int (+ (v10 x y) x))
(define-fun-rec
  u9
  ((x Int) (y Int)) Int (ite (<= x 0) y (f9 (u9 (- x 1) y) x)))
(define-fun
  v9
  ((x Int)) Int (u9 (g9 x) 1))
(define-fun-rec
  u8
  ((x Int) (y Int)) Int (ite (<= x 0) y (v9 (u8 (- x 1) y))))
(define-fun
  v8
  ((x Int) (y Int)) Int (u8 1 y))
(define-fun
  f7
  ((x Int) (y Int)) Int (+ (v8 x y) x))
(define-fun-rec
  u7
  ((x Int) (y Int)) Int (ite (<= x 0) y (f7 (u7 (- x 1) y) x)))
(define-fun
  v7
  ((x Int)) Int (u7 x 1))
(define-fun-rec
  u6
  ((x Int) (y Int)) Int (ite (<= x 0) y (v7 (u6 (- x 1) y))))
(define-fun
  v6
  ((x Int) (y Int)) Int (u6 1 y))
(define-fun
  f5
  ((x Int) (y Int)) Int (+ (v6 x y) x))
(define-fun-rec
  u5
  ((x Int) (y Int)) Int (ite (<= x 0) y (f5 (u5 (- x 1) y) x)))
(define-fun
  v5
  ((x Int)) Int (u5 x 1))
(define-fun
  fast
  ((x Int)) Int (- (- (v5 x) 1) x))
(define-fun
  f1
  ((x Int) (y Int)) Int (+ (v2 x y) x))
(define-fun-rec
  u1
  ((x Int) (y Int)) Int (ite (<= x 0) y (f1 (u1 (- x 1) y) x)))
(define-fun
  v1
  ((x Int) (y Int)) Int (u1 (g1 x y) x))
(define-fun-rec
  u0
  ((x Int) (y Int)) Int (ite (<= x 0) y (v1 (u0 (- x 1) y) x)))
(define-fun
  v0
  ((x Int)) Int (u0 x x))
(assert-not
  (forall ((c Int)) (or (not (>= c 0)) (= (v0 c) (fast c)))))
