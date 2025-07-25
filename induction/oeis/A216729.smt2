(define-fun-rec
  v5
  ((x Int) (y Int) (z Int)) Int (ite (<= x 0) z (v5 (- x 1) y z)))
(define-fun-rec
  v4
  ((x Int) (y Int) (z Int)) Int (ite (<= x 0) z (v4 (- x 1) y z)))
(define-fun-rec
  v2
  ((x Int) (y Int) (z Int)) Int (ite (<= x 0) z (v2 (- x 1) y z)))
(define-fun-rec
  u5
  ((x Int) (y Int) (z Int)) Int
  (ite (<= x 0) y (* (u5 (- x 1) y z) (v5 (- x 1) y z))))
(define-fun-rec
  u4
  ((x Int) (y Int) (z Int)) Int
  (ite (<= x 0) y (* (u4 (- x 1) y z) (v4 (- x 1) y z))))
(define-fun-rec
  u3
  ((x Int) (y Int)) Int (ite (<= x 0) y (* (u3 (- x 1) y) x)))
(define-fun-rec
  u2
  ((x Int) (y Int) (z Int)) Int
  (ite (<= x 0) y (* (u2 (- x 1) y z) (v2 (- x 1) y z))))
(define-fun-rec
  u0
  ((x Int) (y Int)) Int (ite (<= x 0) y (* (u0 (- x 1) y) x)))
(define-fun
  j5
  ((x Int)) Int (+ 1 (+ (+ x x) x)))
(define-fun
  j4
  () Int (+ 2 (+ 2 2)))
(define-fun
  w4
  ((x Int)) Int (u4 x 1 j4))
(define-fun
  j2
  ((x Int)) Int (+ 1 (+ (+ x x) x)))
(define-fun
  h5
  ((x Int)) Int (- x 1))
(define-fun
  w5
  ((x Int)) Int (u5 (h5 x) 1 (j5 x)))
(define-fun
  h4
  ((x Int)) Int x)
(define-fun
  h2
  ((x Int)) Int (- x 1))
(define-fun
  w2
  ((x Int)) Int (u2 (h2 x) 1 (j2 x)))
(define-fun
  g5
  ((x Int) (y Int)) Int y)
(define-fun
  g4
  ((x Int) (y Int)) Int y)
(define-fun
  g3
  ((x Int)) Int (+ (+ x x) x))
(define-fun
  v3
  ((x Int)) Int (u3 (g3 x) 1))
(define-fun
  g2
  ((x Int) (y Int)) Int y)
(define-fun
  g1
  ((x Int)) Int x)
(define-fun
  g0
  ((x Int)) Int (+ (+ x x) x))
(define-fun
  v0
  ((x Int)) Int (u0 (g0 x) 1))
(define-fun
  fast
  ((x Int)) Int (* (div (v3 x) (w4 x)) (w5 x)))
(define-fun
  f1
  ((x Int)) Int (* 2 (+ (+ x x) x)))
(define-fun-rec
  u1
  ((x Int) (y Int)) Int (ite (<= x 0) y (f1 (u1 (- x 1) y))))
(define-fun
  v1
  ((x Int)) Int (u1 x 1))
(define-fun
  small
  ((x Int)) Int (* (div (v0 x) (v1 x)) (w2 x)))
(assert-not
  (forall ((c Int)) (or (not (>= c 0)) (= (small c) (fast c)))))
