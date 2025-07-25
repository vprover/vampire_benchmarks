(define-fun-rec
  v4
  ((x Int) (y Int) (z Int)) Int (ite (<= x 0) z (v4 (- x 1) y z)))
(define-fun-rec
  v3
  ((x Int) (y Int) (z Int)) Int (ite (<= x 0) z (v3 (- x 1) y z)))
(define-fun-rec
  v2
  ((x Int) (y Int) (z Int)) Int (ite (<= x 0) z (v2 (- x 1) y z)))
(define-fun-rec
  v0
  ((x Int) (y Int) (z Int)) Int (ite (<= x 0) z (v0 (- x 1) y z)))
(define-fun-rec
  u4
  ((x Int) (y Int) (z Int)) Int
  (ite (<= x 0) y (* (u4 (- x 1) y z) (v4 (- x 1) y z))))
(define-fun-rec
  u3
  ((x Int) (y Int) (z Int)) Int
  (ite (<= x 0) y (* (u3 (- x 1) y z) (v3 (- x 1) y z))))
(define-fun-rec
  u2
  ((x Int) (y Int) (z Int)) Int
  (ite (<= x 0) y (* (u2 (- x 1) y z) (v2 (- x 1) y z))))
(define-fun-rec
  u0
  ((x Int) (y Int) (z Int)) Int
  (ite (<= x 0) y (* (u0 (- x 1) y z) (v0 (- x 1) y z))))
(define-fun
  w0
  ((x Int)) Int (u0 x 1 x))
(define-fun
  j4
  () Int (+ 1 (* 2 (+ 2 2))))
(define-fun
  j3
  ((x Int)) Int x)
(define-fun
  j2
  ((x Int)) Int x)
(define-fun
  j0
  ((x Int)) Int x)
(define-fun
  i2
  ((x Int)) Int x)
(define-fun
  h4
  ((x Int)) Int (div x 2))
(define-fun
  h3
  ((x Int)) Int (div x 2))
(define-fun
  w3
  ((x Int)) Int (u3 (h3 x) 1 x))
(define-fun
  h2
  ((x Int)) Int (div (- x 1) 2))
(define-fun
  w2
  ((x Int)) Int (u2 (h2 x) x x))
(define-fun
  h0
  ((x Int)) Int x)
(define-fun
  g5
  ((x Int)) Int (mod x 2))
(define-fun
  g4
  ((x Int) (y Int)) Int y)
(define-fun
  g3
  ((x Int) (y Int)) Int y)
(define-fun
  g2
  ((x Int) (y Int)) Int y)
(define-fun
  g1
  ((x Int)) Int x)
(define-fun
  g0
  ((x Int) (y Int)) Int y)
(define-fun
  f5
  () Int (+ 1 2))
(define-fun
  u5
  ((x Int) (y Int)) Int (ite (<= x 0) y f5))
(define-fun
  v5
  ((x Int)) Int (u5 (g5 x) 1))
(define-fun
  w4
  ((x Int)) Int (u4 (h4 x) (v5 x) j4))
(define-fun
  fast
  ((x Int)) Int (mod (* (w2 x) (w3 x)) (w4 x)))
(define-fun
  f1
  ((x Int)) Int (+ (+ x x) x))
(define-fun-rec
  u1
  ((x Int) (y Int)) Int (ite (<= x 0) y (f1 (u1 (- x 1) y))))
(define-fun
  v1
  ((x Int)) Int (u1 x 1))
(define-fun
  small
  ((x Int)) Int (mod (w0 x) (v1 x)))
(assert-not
  (forall ((c Int)) (or (not (>= c 0)) (= (small c) (fast c)))))
