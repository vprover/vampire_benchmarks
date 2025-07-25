(define-fun-rec
  u5
  ((x Int) (y Int)) Int (ite (<= x 0) y (+ (u5 (- x 1) y) x)))
(define-fun
  h5
  ((x Int)) Int x)
(define-fun
  h2
  ((x Int)) Int x)
(define-fun
  h1
  ((x Int)) Int x)
(define-fun
  g5
  ((x Int) (y Int)) Int (- y 2))
(define-fun
  v5
  ((x Int) (y Int)) Int (u5 (g5 x y) x))
(define-fun-rec
  u4
  ((x Int) (y Int)) Int (ite (<= x 0) y (v5 (u4 (- x 1) y) x)))
(define-fun
  g4
  ((x Int)) Int (- x 1))
(define-fun
  v4
  ((x Int)) Int (u4 (g4 x) 0))
(define-fun
  g3
  ((x Int)) Int (- x 1))
(define-fun
  g2
  ((x Int) (y Int)) Int (- y 2))
(define-fun
  g1
  ((x Int) (y Int)) Int y)
(define-fun
  g0
  ((x Int)) Int (- x 1))
(define-fun
  f3
  ((x Int)) Int (+ x x))
(define-fun-rec
  u3
  ((x Int) (y Int)) Int (ite (<= x 0) y (f3 (u3 (- x 1) y))))
(define-fun
  v3
  ((x Int)) Int (u3 (g3 x) 1))
(define-fun
  fast
  ((x Int)) Int (- (v3 x) (v4 x)))
(define-fun
  f2
  ((x Int) (y Int)) Int (+ (- x 2) y))
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
  ((x Int) (y Int)) Int (+ (v1 x y) x))
(define-fun-rec
  u0
  ((x Int) (y Int)) Int (ite (<= x 0) y (f0 (u0 (- x 1) y) x)))
(define-fun
  v0
  ((x Int)) Int (u0 (g0 x) 1))
(assert-not
  (forall ((c Int)) (or (not (>= c 0)) (= (v0 c) (fast c)))))
