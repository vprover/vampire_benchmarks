(define-fun-rec
  u9
  ((x Int) (y Int)) Int (ite (<= x 0) y (+ (u9 (- x 1) y) x)))
(define-fun
  v9
  ((x Int) (y Int)) Int (u9 y x))
(define-fun-rec
  u8
  ((x Int) (y Int)) Int (ite (<= x 0) y (v9 (u8 (- x 1) y) x)))
(define-fun-rec
  u4
  ((x Int) (y Int)) Int (ite (<= x 0) y (+ (u4 (- x 1) y) x)))
(define-fun
  h9
  ((x Int)) Int x)
(define-fun
  h8
  ((x Int)) Int x)
(define-fun
  h7
  ((x Int)) Int x)
(define-fun
  h6
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
  h1
  ((x Int)) Int x)
(define-fun
  g9
  ((x Int) (y Int)) Int y)
(define-fun
  g8
  ((x Int) (y Int)) Int (- y 1))
(define-fun
  v8
  ((x Int) (y Int)) Int (u8 (g8 x y) x))
(define-fun
  g7
  ((x Int) (y Int)) Int (- y 1))
(define-fun
  g6
  ((x Int) (y Int)) Int (- y 2))
(define-fun
  g5
  ((x Int)) Int x)
(define-fun
  g4
  ((x Int) (y Int)) Int (- y 2))
(define-fun
  v4
  ((x Int) (y Int)) Int (u4 (g4 x y) x))
(define-fun-rec
  u3
  ((x Int) (y Int)) Int (ite (<= x 0) y (v4 (u3 (- x 1) y) x)))
(define-fun
  v3
  ((x Int) (y Int)) Int (u3 y x))
(define-fun
  g3
  ((x Int) (y Int)) Int y)
(define-fun
  g2
  ((x Int) (y Int)) Int (- y 2))
(define-fun
  g1
  ((x Int) (y Int)) Int y)
(define-fun
  g0
  ((x Int)) Int x)
(define-fun
  f7
  ((x Int) (y Int)) Int (+ (v8 x y) y))
(define-fun-rec
  u7
  ((x Int) (y Int)) Int (ite (<= x 0) y (f7 (u7 (- x 1) y) x)))
(define-fun
  v7
  ((x Int) (y Int)) Int (u7 (g7 x y) x))
(define-fun
  f6
  ((x Int) (y Int)) Int (+ (v7 x y) y))
(define-fun-rec
  u6
  ((x Int) (y Int)) Int (ite (<= x 0) y (f6 (u6 (- x 1) y) x)))
(define-fun
  v6
  ((x Int) (y Int)) Int (u6 (g6 x y) x))
(define-fun
  f5
  ((x Int) (y Int)) Int (+ (v6 x y) y))
(define-fun-rec
  u5
  ((x Int) (y Int)) Int (ite (<= x 0) y (f5 (u5 (- x 1) y) x)))
(define-fun
  v5
  ((x Int)) Int (u5 x 1))
(define-fun
  f2
  ((x Int) (y Int)) Int (+ (v3 x y) y))
(define-fun-rec
  u2
  ((x Int) (y Int)) Int (ite (<= x 0) y (f2 (u2 (- x 1) y) x)))
(define-fun
  v2
  ((x Int) (y Int)) Int (u2 (g2 x y) x))
(define-fun-rec
  u1
  ((x Int) (y Int)) Int (ite (<= x 0) y (v2 (u1 (- x 1) y) x)))
(define-fun
  v1
  ((x Int) (y Int)) Int (u1 y x))
(define-fun
  f0
  ((x Int) (y Int)) Int (+ (v1 x y) y))
(define-fun-rec
  u0
  ((x Int) (y Int)) Int (ite (<= x 0) y (f0 (u0 (- x 1) y) x)))
(define-fun
  v0
  ((x Int)) Int (u0 x 1))
(assert-not
  (forall ((c Int)) (or (not (>= c 0)) (= (v0 c) (v5 c)))))
