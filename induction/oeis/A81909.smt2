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
  j3
  () Int (+ 1 (* 2 (+ 2 2))))
(define-fun
  j2
  () Int (+ 1 2))
(define-fun
  j0
  () Int (+ 1 2))
(define-fun
  i2
  ((x Int)) Int x)
(define-fun
  i0
  ((x Int)) Int x)
(define-fun
  h3
  ((x Int)) Int (div x 2))
(define-fun
  h2
  ((x Int)) Int (- x 2))
(define-fun
  w2
  ((x Int)) Int (u2 (h2 x) x j2))
(define-fun
  h0
  ((x Int)) Int (- x 2))
(define-fun
  w0
  ((x Int)) Int (u0 (h0 x) x j0))
(define-fun
  g4
  ((x Int)) Int (mod x 2))
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
  f4
  () Int (+ 1 2))
(define-fun
  u4
  ((x Int) (y Int)) Int (ite (<= x 0) y f4))
(define-fun
  v4
  ((x Int)) Int (u4 (g4 x) 1))
(define-fun
  w3
  ((x Int)) Int (u3 (h3 x) (v4 x) j3))
(define-fun
  fast
  ((x Int)) Int (+ (div (* (- x 1) (w2 x)) 2) (w3 x)))
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
  ((x Int)) Int (+ (div (* (- x 1) (w0 x)) 2) (v1 x)))
(assert-not
  (forall ((c Int)) (or (not (>= c 0)) (= (small c) (fast c)))))
