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
(define-fun-rec
  u0
  ((x Int) (y Int) (z Int)) Int
  (ite (<= x 0) y (* (u0 (- x 1) y z) (v0 (- x 1) y z))))
(define-fun
  j2
  ((x Int)) Int x)
(define-fun
  j1
  ((x Int)) Int (+ 1 x))
(define-fun
  j0
  ((x Int)) Int (+ 1 x))
(define-fun
  h2
  ((x Int)) Int (mod x 2))
(define-fun
  w2
  ((x Int)) Int (u2 (h2 x) 1 x))
(define-fun
  h1
  ((x Int)) Int (- x 1))
(define-fun
  w1
  ((x Int)) Int (u1 (h1 x) 1 (j1 x)))
(define-fun
  h0
  ((x Int)) Int (+ 1 x))
(define-fun
  w0
  ((x Int)) Int (u0 (h0 x) 1 (j0 x)))
(define-fun
  small
  ((x Int)) Int (- (* (ite (<= (mod x 2) 0) 1 x) (w0 x)) x))
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
  ((x Int)) Int (- (* (* (w1 x) (+ (* (+ 2 x) x) 1)) (w2 x)) x))
(assert-not
  (forall ((c Int)) (or (not (>= c 0)) (= (small c) (fast c)))))
