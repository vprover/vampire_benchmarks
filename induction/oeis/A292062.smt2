(define-fun-rec
  u5
  ((x Int) (y Int)) Int (ite (<= x 0) y (* (u5 (- x 1) y) x)))
(define-fun-rec
  u4
  ((x Int) (y Int)) Int (ite (<= x 0) y (* (u4 (- x 1) y) x)))
(define-fun
  v4
  ((x Int) (y Int)) Int (u4 y 1))
(define-fun-rec
  u1
  ((x Int) (y Int)) Int (ite (<= x 0) y (* (u1 (- x 1) y) x)))
(define-fun
  v1
  ((x Int) (y Int)) Int (u1 y 1))
(define-fun
  h5
  ((x Int)) Int (+ 1 x))
(define-fun
  v5
  ((x Int)) Int (u5 x (h5 x)))
(define-fun
  g5
  ((x Int)) Int x)
(define-fun
  g4
  ((x Int) (y Int)) Int y)
(define-fun
  g3
  ((x Int)) Int x)
(define-fun
  g2
  ((x Int)) Int x)
(define-fun
  g1
  ((x Int) (y Int)) Int y)
(define-fun
  g0
  ((x Int)) Int x)
(define-fun
  f3
  ((x Int) (y Int)) Int (+ (* (+ (v4 x y) x) y) x))
(define-fun-rec
  u3
  ((x Int) (y Int)) Int (ite (<= x 0) y (f3 (u3 (- x 1) y) x)))
(define-fun
  v3
  ((x Int)) Int (u3 x 0))
(define-fun
  fast
  ((x Int)) Int (* (v3 x) (div (v5 x) 2)))
(define-fun
  f2
  ((x Int) (y Int)) Int (* (+ 1 y) x))
(define-fun-rec
  u2
  ((x Int) (y Int)) Int (ite (<= x 0) y (f2 (u2 (- x 1) y) x)))
(define-fun
  v2
  ((x Int)) Int (u2 x 1))
(define-fun
  f0
  ((x Int) (y Int)) Int (+ (* (+ (v1 x y) x) y) x))
(define-fun-rec
  u0
  ((x Int) (y Int)) Int (ite (<= x 0) y (f0 (u0 (- x 1) y) x)))
(define-fun
  v0
  ((x Int)) Int (u0 x 0))
(define-fun
  small
  ((x Int)) Int (* (v0 x) (div (v2 x) 2)))
(assert-not
  (forall ((c Int)) (or (not (>= c 0)) (= (small c) (fast c)))))
