(define-fun-rec
  v4
  ((x Int) (y Int) (z Int)) Int (ite (<= x 0) z (v4 (- x 1) y z)))
(define-fun-rec
  u4
  ((x Int) (y Int) (z Int)) Int
  (ite (<= x 0) y (* (u4 (- x 1) y z) (v4 (- x 1) y z))))
(define-fun
  j4
  () Int (* 2 (+ 2 (+ 2 2))))
(define-fun
  w4
  ((x Int)) Int (u4 x 1 j4))
(define-fun
  h4
  ((x Int)) Int x)
(define-fun
  h2
  ((x Int)) Int x)
(define-fun
  g4
  ((x Int) (y Int)) Int y)
(define-fun
  g3
  ((x Int)) Int x)
(define-fun
  g1
  ((x Int)) Int x)
(define-fun
  g0
  ((x Int)) Int x)
(define-fun
  f3
  ((x Int) (y Int)) Int (+ 1 (* (* 2 (* 2 (+ (+ y y) y))) x)))
(define-fun-rec
  u3
  ((x Int) (y Int)) Int (ite (<= x 0) y (f3 (u3 (- x 1) y) x)))
(define-fun
  v3
  ((x Int)) Int (u3 x 1))
(define-fun
  fast
  ((x Int)) Int (div (* (v3 x) (+ 1 x)) (w4 x)))
(define-fun
  f2
  ((x Int) (y Int)) Int (* (+ 2 y) x))
(define-fun-rec
  u2
  ((x Int) (y Int)) Int (ite (<= x 0) y (f2 (u2 (- x 1) y) x)))
(define-fun
  v2
  ((x Int)) Int (u2 2 x))
(define-fun-rec
  u1
  ((x Int) (y Int)) Int (ite (<= x 0) y (v2 (u1 (- x 1) y))))
(define-fun
  v1
  ((x Int)) Int (u1 x 1))
(define-fun
  f0
  ((x Int) (y Int)) Int (+ 1 (* (* 2 (* 2 (+ (+ y y) y))) x)))
(define-fun-rec
  u0
  ((x Int) (y Int)) Int (ite (<= x 0) y (f0 (u0 (- x 1) y) x)))
(define-fun
  v0
  ((x Int)) Int (u0 x 1))
(define-fun
  small
  ((x Int)) Int (div (* (v0 x) (+ 1 x)) (v1 x)))
(assert-not
  (forall ((c Int)) (or (not (>= c 0)) (= (small c) (fast c)))))
