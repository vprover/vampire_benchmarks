(define-fun-rec
  u3
  ((x Int) (y Int)) Int (ite (<= x 0) y (* (u3 (- x 1) y) x)))
(define-fun-rec
  u1
  ((x Int) (y Int)) Int (ite (<= x 0) y (* (u1 (- x 1) y) x)))
(define-fun
  h1
  ((x Int) (y Int)) Int y)
(define-fun
  h0
  ((x Int)) Int (- 0 x))
(define-fun
  g4
  ((x Int)) Int (- 2 x))
(define-fun
  g3
  ((x Int) (y Int)) Int (- y 1))
(define-fun
  v3
  ((x Int) (y Int)) Int (u3 (g3 x y) 1))
(define-fun
  g2
  ((x Int)) Int (- x 2))
(define-fun
  g1
  ((x Int) (y Int)) Int (- y 2))
(define-fun
  v1
  ((x Int) (y Int)) Int (u1 (g1 x y) y))
(define-fun
  g0
  ((x Int)) Int x)
(define-fun
  f4
  ((x Int)) Int (- x 1))
(define-fun-rec
  u4
  ((x Int) (y Int)) Int (ite (<= x 0) y (f4 (u4 (- x 1) y))))
(define-fun
  v4
  ((x Int)) Int (u4 (g4 x) 1))
(define-fun
  f2
  ((x Int) (y Int)) Int (+ (* (+ (v3 x y) x) y) x))
(define-fun-rec
  u2
  ((x Int) (y Int)) Int (ite (<= x 0) y (f2 (u2 (- x 1) y) x)))
(define-fun
  v2
  ((x Int)) Int (u2 (g2 x) 1))
(define-fun
  fast
  ((x Int)) Int (* (* (v2 x) x) (v4 x)))
(define-fun
  f0
  ((x Int) (y Int)) Int (* (+ (v1 x y) x) y))
(define-fun-rec
  u0
  ((x Int) (y Int)) Int (ite (<= x 0) y (f0 (u0 (- x 1) y) x)))
(define-fun
  v0
  ((x Int)) Int (u0 x (h0 x)))
(assert-not
  (forall ((c Int)) (or (not (>= c 0)) (= (v0 c) (fast c)))))
