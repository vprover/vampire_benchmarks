(define-fun-rec
  v5
  ((x Int) (y Int) (z Int)) Int (ite (<= x 0) z (v5 (- x 1) y z)))
(define-fun-rec
  u5
  ((x Int) (y Int) (z Int)) Int
  (ite (<= x 0) y (* (u5 (- x 1) y z) (v5 (- x 1) y z))))
(define-fun
  j5
  () Int (+ 1 2))
(define-fun
  i5
  () Int (+ 1 2))
(define-fun
  w5
  ((x Int)) Int (u5 x i5 j5))
(define-fun
  h5
  ((x Int)) Int x)
(define-fun
  g5
  ((x Int) (y Int)) Int y)
(define-fun
  g4
  ((x Int)) Int x)
(define-fun
  g2
  ((x Int)) Int x)
(define-fun
  g1
  ((x Int)) Int x)
(define-fun
  f4
  ((x Int)) Int (+ x x))
(define-fun-rec
  u4
  ((x Int) (y Int)) Int (ite (<= x 0) y (f4 (u4 (- x 1) y))))
(define-fun
  v4
  ((x Int)) Int (u4 x 1))
(define-fun
  f3
  ((x Int)) Int (+ (* (+ 2 (+ 2 (+ 2 x))) x) x))
(define-fun-rec
  u3
  ((x Int) (y Int)) Int (ite (<= x 0) y (f3 (u3 (- x 1) y))))
(define-fun
  v3
  ((x Int)) Int (u3 1 (v4 x)))
(define-fun
  fast
  ((x Int)) Int (- (div (- (v3 x) (w5 x)) 2) 1))
(define-fun
  f2
  ((x Int)) Int (+ 1 (+ (+ x x) x)))
(define-fun-rec
  u2
  ((x Int) (y Int)) Int (ite (<= x 0) y (f2 (u2 (- x 1) y))))
(define-fun
  v2
  ((x Int)) Int (u2 x 1))
(define-fun
  f1
  ((x Int)) Int (+ x x))
(define-fun-rec
  u1
  ((x Int) (y Int)) Int (ite (<= x 0) y (f1 (u1 (- x 1) y))))
(define-fun
  v1
  ((x Int)) Int (u1 x 1))
(define-fun
  f0
  ((x Int)) Int (+ (* (+ 2 (+ 2 (+ 2 x))) x) x))
(define-fun-rec
  u0
  ((x Int) (y Int)) Int (ite (<= x 0) y (f0 (u0 (- x 1) y))))
(define-fun
  v0
  ((x Int)) Int (u0 1 (v1 x)))
(define-fun
  small
  ((x Int)) Int (- (- (div (- (v0 x) 1) 2) 1) (v2 x)))
(assert-not
  (forall ((c Int)) (or (not (>= c 0)) (= (small c) (fast c)))))
