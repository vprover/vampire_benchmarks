(define-fun-rec
  v4
  ((x Int) (y Int) (z Int)) Int (ite (<= x 0) z (v4 (- x 1) y z)))
(define-fun-rec
  u4
  ((x Int) (y Int) (z Int)) Int
  (ite (<= x 0) y (* (u4 (- x 1) y z) (v4 (- x 1) y z))))
(define-fun
  j4
  () Int (+ 1 (+ 2 (+ 2 2))))
(define-fun
  i4
  () Int (+ 1 2))
(define-fun
  w4
  ((x Int)) Int (u4 x i4 j4))
(define-fun
  h4
  ((x Int)) Int x)
(define-fun
  h3
  ((x Int)) Int (+ 2 x))
(define-fun
  h1
  () Int (+ 1 (* 2 (+ 2 2))))
(define-fun
  h0
  ((x Int)) Int (+ 2 x))
(define-fun
  g4
  ((x Int) (y Int)) Int y)
(define-fun
  g1
  ((x Int)) Int x)
(define-fun
  f5
  ((x Int)) Int (+ 1 (* (+ 2 x) x)))
(define-fun-rec
  u5
  ((x Int) (y Int)) Int (ite (<= x 0) y (f5 (u5 (- x 1) y))))
(define-fun
  v5
  () Int (u5 2 2))
(define-fun
  f3
  ((x Int)) Int (div (- (* (+ 1 2) (w4 x)) 1) v5))
(define-fun-rec
  u3
  ((x Int) (y Int)) Int (ite (<= x 0) y (f3 (u3 (- x 1) y))))
(define-fun
  v3
  ((x Int)) Int (u3 1 (h3 x)))
(define-fun
  fast
  ((x Int)) Int (div (v3 x) 2))
(define-fun
  f2
  ((x Int)) Int (+ 1 (* (+ 2 x) x)))
(define-fun-rec
  u2
  ((x Int) (y Int)) Int (ite (<= x 0) y (f2 (u2 (- x 1) y))))
(define-fun
  v2
  () Int (u2 2 2))
(define-fun
  f1
  ((x Int)) Int (+ (* 2 (+ (+ x x) x)) x))
(define-fun-rec
  u1
  ((x Int) (y Int)) Int (ite (<= x 0) y (f1 (u1 (- x 1) y))))
(define-fun
  v1
  ((x Int)) Int (u1 x h1))
(define-fun
  f0
  ((x Int)) Int (div (v1 x) v2))
(define-fun-rec
  u0
  ((x Int) (y Int)) Int (ite (<= x 0) y (f0 (u0 (- x 1) y))))
(define-fun
  v0
  ((x Int)) Int (u0 1 (h0 x)))
(define-fun
  small
  ((x Int)) Int (div (v0 x) 2))
(assert-not
  (forall ((c Int)) (or (not (>= c 0)) (= (small c) (fast c)))))
