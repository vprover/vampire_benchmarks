(define-fun-rec
  v2
  ((x Int) (y Int) (z Int)) Int (ite (<= x 0) z (v2 (- x 1) y z)))
(define-fun-rec
  u3
  ((x Int) (y Int)) Int (ite (<= x 0) y (+ (u3 (- x 1) y) x)))
(define-fun-rec
  u1
  ((x Int) (y Int)) Int (ite (<= x 0) y (+ (u1 (- x 1) y) x)))
(define-fun
  j2
  ((x Int)) Int (* (+ 1 2) (+ 1 x)))
(define-fun
  i2
  ((x Int)) Int (* (+ 2 (mod x 2)) (+ 2 (+ 2 2))))
(define-fun
  h3
  ((x Int) (y Int)) Int y)
(define-fun
  h2
  () Int (+ 1 2))
(define-fun
  h1
  ((x Int) (y Int)) Int y)
(define-fun
  g3
  ((x Int)) Int x)
(define-fun
  g2
  ((x Int) (y Int)) Int y)
(define-fun
  g1
  ((x Int)) Int x)
(define-fun
  g0
  ((x Int)) Int (* (+ 1 2) (+ 1 x)))
(define-fun
  f2
  ((x Int) (y Int)) Int (div (u3 x y) x))
(define-fun-rec
  u2
  ((x Int) (y Int) (z Int)) Int
  (ite (<= x 0) y (f2 (u2 (- x 1) y z) (v2 (- x 1) y z))))
(define-fun
  w2
  ((x Int)) Int (u2 h2 (i2 x) (j2 x)))
(define-fun
  fast
  ((x Int)) Int (+ (w2 x) x))
(define-fun
  f0
  ((x Int) (y Int)) Int (div (u1 x y) x))
(define-fun-rec
  u0
  ((x Int) (y Int)) Int (ite (<= x 0) y (f0 (u0 (- x 1) y) x)))
(define-fun
  v0
  ((x Int)) Int (u0 (g0 x) 1))
(define-fun
  small
  ((x Int)) Int (+ (v0 x) x))
(assert-not
  (forall ((c Int)) (or (not (>= c 0)) (= (small c) (fast c)))))
