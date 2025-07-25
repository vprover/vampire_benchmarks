(define-fun
  h8
  ((x Int)) Int x)
(define-fun
  h7
  ((x Int) (y Int)) Int y)
(define-fun
  h3
  ((x Int)) Int x)
(define-fun
  h2
  ((x Int) (y Int)) Int y)
(define-fun
  g9
  ((x Int)) Int (mod x 2))
(define-fun
  g8
  ((x Int)) Int (- 2 (mod x 2)))
(define-fun
  g6
  ((x Int)) Int (div x 2))
(define-fun
  g5
  ((x Int)) Int (+ 1 x))
(define-fun
  g4
  ((x Int)) Int x)
(define-fun
  g11
  ((x Int)) Int (div x 2))
(define-fun
  g1
  ((x Int)) Int (div x 2))
(define-fun
  g0
  ((x Int)) Int (+ 1 x))
(define-fun
  f9
  ((x Int)) Int (+ x x))
(define-fun-rec
  u9
  ((x Int) (y Int)) Int (ite (<= x 0) y (f9 (u9 (- x 1) y))))
(define-fun
  f4
  ((x Int)) Int (+ x x))
(define-fun-rec
  u4
  ((x Int) (y Int)) Int (ite (<= x 0) y (f4 (u4 (- x 1) y))))
(define-fun
  v4
  ((x Int)) Int (u4 x 2))
(define-fun
  f3
  ((x Int)) Int (mod (+ 1 (v4 x)) (+ 1 x)))
(define-fun-rec
  u3
  ((x Int) (y Int)) Int (ite (<= x 0) y (f3 (u3 (- x 1) y))))
(define-fun
  v3
  ((x Int)) Int (u3 2 x))
(define-fun
  f2
  ((x Int)) Int (ite (<= (- (v3 x) 1) 0) (+ 1 x) 1))
(define-fun-rec
  u2
  ((x Int) (y Int)) Int (ite (<= x 0) y (f2 (u2 (- x 1) y))))
(define-fun
  v2
  ((x Int) (y Int)) Int (u2 1 y))
(define-fun
  f11
  ((x Int)) Int (+ x x))
(define-fun-rec
  u11
  ((x Int) (y Int)) Int (ite (<= x 0) y (f11 (u11 (- x 1) y))))
(define-fun
  v11
  ((x Int)) Int (u11 (g11 x) 1))
(define-fun
  f10
  ((x Int)) Int (* x x))
(define-fun-rec
  u10
  ((x Int) (y Int)) Int (ite (<= x 0) y (f10 (u10 (- x 1) y))))
(define-fun
  v10
  ((x Int)) Int (u10 1 (v11 x)))
(define-fun
  v9
  ((x Int)) Int (u9 (g9 x) (v10 x)))
(define-fun
  f8
  ((x Int)) Int (mod (+ 1 (* 2 (v9 x))) (+ 1 x)))
(define-fun-rec
  u8
  ((x Int) (y Int)) Int (ite (<= x 0) y (f8 (u8 (- x 1) y))))
(define-fun
  v8
  ((x Int)) Int (u8 (g8 x) x))
(define-fun
  f7
  ((x Int)) Int (ite (<= (- (v8 x) 1) 0) (+ 1 x) 1))
(define-fun-rec
  u7
  ((x Int) (y Int)) Int (ite (<= x 0) y (f7 (u7 (- x 1) y))))
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
  ((x Int)) Int (u6 (g6 x) 1))
(define-fun
  f5
  ((x Int)) Int (mod (v6 x) (+ 1 x)))
(define-fun-rec
  t5
  ((x Int)) Int (ite (<= (f5 x) 0) x (t5 (+ x 1))))
(define-fun-rec
  u5
  ((x Int)) Int (ite (<= x 0) (t5 0) (t5 (+ (u5 (- x 1)) 1))))
(define-fun
  v5
  ((x Int)) Int (u5 (g5 x)))
(define-fun
  fast
  ((x Int)) Int (+ (v5 x) 1))
(define-fun
  f1
  ((x Int) (y Int)) Int (* (v2 x y) x))
(define-fun-rec
  u1
  ((x Int) (y Int)) Int (ite (<= x 0) y (f1 (u1 (- x 1) y) x)))
(define-fun
  v1
  ((x Int)) Int (u1 (g1 x) 1))
(define-fun
  f0
  ((x Int)) Int (mod (v1 x) (+ 1 x)))
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
  ((x Int)) Int (+ (v0 x) 1))
(assert-not
  (forall ((c Int)) (or (not (>= c 0)) (= (small c) (fast c)))))
