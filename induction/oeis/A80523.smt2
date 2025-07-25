(define-fun-rec
  v2
  ((x Int) (y Int) (z Int)) Int (ite (<= x 0) z (v2 (- x 1) y z)))
(define-fun-rec
  v1
  ((x Int) (y Int) (z Int)) Int (ite (<= x 0) z (v1 (- x 1) y z)))
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
  ((x Int) (y Int)) Int (ite (<= x 0) y (- (u0 (- x 1) y) x)))
(define-fun
  j2
  ((x Int)) Int (+ 1 x))
(define-fun
  j1
  ((x Int)) Int (+ 1 x))
(define-fun
  h2
  ((x Int)) Int (- x 1))
(define-fun
  w2
  ((x Int)) Int (u2 (h2 x) 1 (j2 x)))
(define-fun
  h1
  ((x Int)) Int (+ 1 x))
(define-fun
  w1
  ((x Int)) Int (u1 (h1 x) 1 (j1 x)))
(define-fun
  v0
  ((x Int)) Int (u0 x (w1 x)))
(define-fun
  g2
  ((x Int) (y Int)) Int y)
(define-fun
  g1
  ((x Int) (y Int)) Int y)
(define-fun
  g0
  ((x Int)) Int x)
(define-fun
  fast
  ((x Int)) Int
  (- (* (+ 1 (* (+ 2 x) x)) (w2 x)) (div (+ (* x x) x) 2)))
(assert-not
  (forall ((c Int)) (or (not (>= c 0)) (= (v0 c) (fast c)))))
