(define-fun
  h7
  ((x Int) (y Int)) Int y)
(define-fun
  h5
  ((x Int) (y Int)) Int y)
(define-fun
  h1
  ((x Int) (y Int)) Int y)
(define-fun
  g8
  ((x Int)) Int (div x 2))
(define-fun
  g6
  ((x Int)) Int x)
(define-fun
  g4
  ((x Int)) Int x)
(define-fun
  g3
  ((x Int) (y Int)) Int y)
(define-fun
  g2
  ((x Int)) Int x)
(define-fun
  g0
  ((x Int)) Int x)
(define-fun
  f8
  ((x Int) (y Int)) Int (+ (div (+ (- y x) y) (* x x)) x))
(define-fun-rec
  u8
  ((x Int) (y Int)) Int (ite (<= x 0) y (f8 (u8 (- x 1) y) x)))
(define-fun
  v8
  ((x Int)) Int (u8 (g8 x) 1))
(define-fun-rec
  u7
  ((x Int) (y Int)) Int (ite (<= x 0) y (v8 (u7 (- x 1) y))))
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
  f5
  ((x Int)) Int (ite (<= (mod (v6 x) (+ 1 x)) 0) 1 0))
(define-fun-rec
  u5
  ((x Int) (y Int)) Int (ite (<= x 0) y (f5 (u5 (- x 1) y))))
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
  ((x Int)) Int (u4 x 1))
(define-fun
  f3
  ((x Int) (y Int)) Int (+ (div y (+ (* x x) x)) x))
(define-fun-rec
  u3
  ((x Int) (y Int)) Int (ite (<= x 0) y (f3 (u3 (- x 1) y) x)))
(define-fun
  v3
  ((x Int) (y Int)) Int (u3 y 1))
(define-fun
  f2
  ((x Int) (y Int)) Int (* (v3 x y) x))
(define-fun-rec
  u2
  ((x Int) (y Int)) Int (ite (<= x 0) y (f2 (u2 (- x 1) y) x)))
(define-fun
  v2
  ((x Int)) Int (u2 x 1))
(define-fun
  f1
  ((x Int)) Int (ite (<= (mod (v2 x) (+ 1 x)) 0) 1 0))
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
(assert-not
  (forall ((c Int)) (or (not (>= c 0)) (= (v0 c) (v4 c)))))
