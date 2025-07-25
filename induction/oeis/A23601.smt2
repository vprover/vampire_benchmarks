(define-fun
  u11
  ((x Int) (y Int)) Int (ite (<= x 0) y x))
(define-fun
  v11
  ((x Int) (y Int)) Int (u11 (- x y) x))
(define-fun-rec
  u10
  ((x Int) (y Int)) Int (ite (<= x 0) y (v11 (u10 (- x 1) y) x)))
(define-fun
  h9
  ((x Int)) Int (div x 2))
(define-fun
  h8
  ((x Int)) Int x)
(define-fun
  h7
  ((x Int)) Int x)
(define-fun
  h4
  ((x Int)) Int x)
(define-fun
  h3
  ((x Int)) Int x)
(define-fun
  h2
  ((x Int)) Int (div x 2))
(define-fun
  h11
  ((x Int)) Int x)
(define-fun
  h10
  ((x Int)) Int (+ 1 x))
(define-fun
  v10
  ((x Int)) Int (u10 x (h10 x)))
(define-fun
  g8
  ((x Int)) Int (- 1 (mod x 2)))
(define-fun
  g6
  ((x Int) (y Int)) Int (+ 1 y))
(define-fun
  g5
  ((x Int)) Int x)
(define-fun
  g3
  ((x Int)) Int x)
(define-fun
  g10
  ((x Int)) Int x)
(define-fun
  g1
  ((x Int) (y Int)) Int y)
(define-fun
  g0
  ((x Int)) Int x)
(define-fun
  f9
  ((x Int)) Int (ite (<= (mod (- (v10 x) 1) (+ 1 x)) 0) 1 0))
(define-fun-rec
  u9
  ((x Int) (y Int)) Int (ite (<= x 0) y (f9 (u9 (- x 1) y))))
(define-fun
  v9
  ((x Int)) Int (u9 1 (h9 x)))
(define-fun
  f8
  ((x Int)) Int (+ (v9 x) x))
(define-fun-rec
  u8
  ((x Int) (y Int)) Int (ite (<= x 0) y (f8 (u8 (- x 1) y))))
(define-fun
  v8
  ((x Int)) Int (u8 (g8 x) x))
(define-fun
  f7
  ((x Int)) Int (+ (- (v8 x) x) 1))
(define-fun-rec
  u7
  ((x Int) (y Int)) Int (ite (<= x 0) y (f7 (u7 (- x 1) y))))
(define-fun
  v7
  ((x Int)) Int (u7 2 x))
(define-fun
  f6
  ((x Int)) Int (mod (+ (v7 x) x) 2))
(define-fun-rec
  t6
  ((x Int)) Int (ite (<= (f6 x) 0) x (t6 (+ x 1))))
(define-fun-rec
  u6
  ((x Int)) Int (ite (<= x 0) (t6 0) (t6 (+ (u6 (- x 1)) 1))))
(define-fun
  v6
  ((x Int) (y Int)) Int (u6 (g6 x y)))
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
  f4
  ((x Int) (y Int)) Int (- y 1))
(define-fun-rec
  u4
  ((x Int) (y Int)) Int (ite (<= x 0) y (f4 (u4 (- x 1) y) x)))
(define-fun
  v4
  ((x Int) (y Int)) Int (u4 (- x y) x))
(define-fun-rec
  u3
  ((x Int) (y Int)) Int (ite (<= x 0) y (v4 (u3 (- x 1) y) x)))
(define-fun
  v3
  ((x Int)) Int (u3 x x))
(define-fun
  f2
  ((x Int)) Int (ite (<= (v3 x) 0) 1 0))
(define-fun-rec
  u2
  ((x Int) (y Int)) Int (ite (<= x 0) y (f2 (u2 (- x 1) y))))
(define-fun
  v2
  ((x Int)) Int (u2 1 (h2 x)))
(define-fun
  f11
  ((x Int) (y Int)) Int y)
(define-fun
  f1
  ((x Int)) Int (+ (+ (mod (+ (v2 x) x) 2) x) 1))
(define-fun-rec
  u1
  ((x Int) (y Int)) Int (ite (<= x 0) y (f1 (u1 (- x 1) y))))
(define-fun
  v1
  ((x Int) (y Int)) Int (u1 y 1))
(define-fun
  f0
  ((x Int) (y Int)) Int (+ (v1 x y) x))
(define-fun-rec
  u0
  ((x Int) (y Int)) Int (ite (<= x 0) y (f0 (u0 (- x 1) y) x)))
(define-fun
  v0
  ((x Int)) Int (u0 x 1))
(assert-not
  (forall ((c Int)) (or (not (>= c 0)) (= (v0 c) (v5 c)))))
