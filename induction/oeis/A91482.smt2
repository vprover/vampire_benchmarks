(define-fun-rec
  v2
  ((x Int) (y Int) (z Int)) Int (ite (<= x 0) z (v2 (- x 1) y z)))
(define-fun-rec
  v1
  ((x Int) (y Int) (z Int)) Int (ite (<= x 0) z (v1 (- x 1) y z)))
(define-fun-rec
  v0
  ((x Int) (y Int) (z Int)) Int (ite (<= x 0) z (v0 (- x 1) y z)))
(define-fun-rec
  u2
  ((x Int) (y Int) (z Int)) Int
  (ite (<= x 0) y (* (u2 (- x 1) y z) (v2 (- x 1) y z))))
(define-fun-rec
  u1
  ((x Int) (y Int) (z Int)) Int
  (ite (<= x 0) y (* (u1 (- x 1) y z) (v1 (- x 1) y z))))
(define-fun
  j2
  ((x Int)) Int (+ (+ x x) x))
(define-fun
  j1
  ((x Int)) Int (+ (+ x x) x))
(define-fun
  j0
  ((x Int)) Int x)
(define-fun
  h2
  ((x Int)) Int (div x 2))
(define-fun
  w2
  ((x Int)) Int (u2 (h2 x) 1 (j2 x)))
(define-fun
  h1
  ((x Int)) Int (- x (div x 2)))
(define-fun
  w1
  ((x Int)) Int (u1 (h1 x) 1 (j1 x)))
(define-fun
  h0
  ((x Int)) Int x)
(define-fun
  g2
  ((x Int) (y Int)) Int y)
(define-fun
  g1
  ((x Int) (y Int)) Int y)
(define-fun
  g0
  ((x Int) (y Int)) Int y)
(define-fun
  fast
  ((x Int)) Int (* (w1 x) (w2 x)))
(define-fun
  f0
  ((x Int) (y Int)) Int (* (+ 1 2) (* x y)))
(define-fun-rec
  u0
  ((x Int) (y Int) (z Int)) Int
  (ite (<= x 0) y (f0 (u0 (- x 1) y z) (v0 (- x 1) y z))))
(define-fun
  w0
  ((x Int)) Int (u0 x 1 x))
(assert-not
  (forall ((c Int)) (or (not (>= c 0)) (= (w0 c) (fast c)))))
