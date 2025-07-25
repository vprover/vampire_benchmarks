(define-fun-rec
  u5
  ((x Int) (y Int)) Int (ite (<= x 0) y (* (u5 (- x 1) y) x)))
(define-fun-rec
  u4
  ((x Int) (y Int)) Int (ite (<= x 0) y (* (u4 (- x 1) y) x)))
(define-fun-rec
  u1
  ((x Int) (y Int)) Int (ite (<= x 0) y (* (u1 (- x 1) y) x)))
(define-fun
  v1
  ((x Int) (y Int)) Int (u1 y x))
(define-fun-rec
  u0
  ((x Int) (y Int)) Int (ite (<= x 0) y (v1 (u0 (- x 1) y) x)))
(define-fun
  h4
  ((x Int) (y Int)) Int y)
(define-fun
  h1
  ((x Int)) Int x)
(define-fun
  g6
  ((x Int)) Int x)
(define-fun
  g5
  ((x Int)) Int (- x 1))
(define-fun
  v5
  ((x Int)) Int (u5 (g5 x) 1))
(define-fun
  g4
  ((x Int) (y Int)) Int (- y 1))
(define-fun
  v4
  ((x Int) (y Int)) Int (u4 (g4 x y) y))
(define-fun
  g3
  ((x Int)) Int (- x 2))
(define-fun
  g2
  ((x Int)) Int x)
(define-fun
  g1
  ((x Int) (y Int)) Int y)
(define-fun
  g0
  ((x Int)) Int (- x 1))
(define-fun
  f6
  ((x Int) (y Int)) Int (+ 1 (* x y)))
(define-fun-rec
  u6
  ((x Int) (y Int)) Int (ite (<= x 0) y (f6 (u6 (- x 1) y) x)))
(define-fun
  v6
  ((x Int)) Int (u6 x 1))
(define-fun
  f3
  ((x Int) (y Int)) Int (* (v4 x y) x))
(define-fun-rec
  u3
  ((x Int) (y Int)) Int (ite (<= x 0) y (f3 (u3 (- x 1) y) x)))
(define-fun
  v3
  ((x Int)) Int (u3 (g3 x) 1))
(define-fun
  fast
  ((x Int)) Int (* (* (v3 x) (v5 x)) (v6 x)))
(define-fun
  f2
  ((x Int) (y Int)) Int (+ 1 (* x y)))
(define-fun-rec
  u2
  ((x Int) (y Int)) Int (ite (<= x 0) y (f2 (u2 (- x 1) y) x)))
(define-fun
  v2
  ((x Int)) Int (u2 x 1))
(define-fun
  v0
  ((x Int)) Int (u0 (g0 x) (v2 x)))
(assert-not
  (forall ((c Int)) (or (not (>= c 0)) (= (v0 c) (fast c)))))
