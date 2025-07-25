(define-fun-rec
  v6
  ((x Int) (y Int) (z Int)) Int (ite (<= x 0) z (v6 (- x 1) y z)))
(define-fun-rec
  u7
  ((x Int) (y Int)) Int (ite (<= x 0) y (* (u7 (- x 1) y) x)))
(define-fun
  v7
  ((x Int)) Int (u7 x 1))
(define-fun-rec
  u6
  ((x Int) (y Int) (z Int)) Int
  (ite (<= x 0) y (* (u6 (- x 1) y z) (v6 (- x 1) y z))))
(define-fun
  w6
  ((x Int)) Int (u6 x 1 2))
(define-fun-rec
  u5
  ((x Int) (y Int)) Int (ite (<= x 0) y (* (u5 (- x 1) y) x)))
(define-fun-rec
  u3
  ((x Int) (y Int)) Int (ite (<= x 0) y (* (u3 (- x 1) y) x)))
(define-fun
  v3
  ((x Int)) Int (u3 x 1))
(define-fun-rec
  u1
  ((x Int) (y Int)) Int (ite (<= x 0) y (* (u1 (- x 1) y) x)))
(define-fun
  h6
  ((x Int)) Int x)
(define-fun
  g7
  ((x Int)) Int x)
(define-fun
  g6
  ((x Int) (y Int)) Int y)
(define-fun
  g5
  ((x Int) (y Int)) Int (- y 1))
(define-fun
  v5
  ((x Int) (y Int)) Int (u5 (g5 x y) 1))
(define-fun
  g4
  ((x Int)) Int x)
(define-fun
  g3
  ((x Int)) Int x)
(define-fun
  g2
  ((x Int)) Int x)
(define-fun
  g1
  ((x Int) (y Int)) Int (- y 1))
(define-fun
  v1
  ((x Int) (y Int)) Int (u1 (g1 x y) 1))
(define-fun
  g0
  ((x Int)) Int x)
(define-fun
  f4
  ((x Int) (y Int)) Int (+ (v5 x y) (* x y)))
(define-fun-rec
  u4
  ((x Int) (y Int)) Int (ite (<= x 0) y (f4 (u4 (- x 1) y) x)))
(define-fun
  v4
  ((x Int)) Int (u4 x 0))
(define-fun
  fast
  ((x Int)) Int (mod (- (* (v4 x) (w6 x)) (v7 x)) (+ 1 x)))
(define-fun
  f2
  ((x Int)) Int (+ x x))
(define-fun-rec
  u2
  ((x Int) (y Int)) Int (ite (<= x 0) y (f2 (u2 (- x 1) y))))
(define-fun
  v2
  ((x Int)) Int (u2 x 1))
(define-fun
  f0
  ((x Int) (y Int)) Int (+ (* x y) (v1 x y)))
(define-fun-rec
  u0
  ((x Int) (y Int)) Int (ite (<= x 0) y (f0 (u0 (- x 1) y) x)))
(define-fun
  v0
  ((x Int)) Int (u0 x 0))
(define-fun
  small
  ((x Int)) Int (mod (- (* (v0 x) (v2 x)) (v3 x)) (+ 1 x)))
(assert-not
  (forall ((c Int)) (or (not (>= c 0)) (= (small c) (fast c)))))
