(define-fun-rec
  v2
  ((x Int) (y Int) (z Int)) Int (ite (<= x 0) z (v2 (- x 1) y z)))
(define-fun
  j2
  () Int (* 2 (+ 2 (+ 2 2))))
(define-fun
  h2
  ((x Int)) Int x)
(define-fun
  h1
  ((x Int)) Int x)
(define-fun
  g2
  ((x Int) (y Int)) Int y)
(define-fun
  g0
  ((x Int)) Int (+ 1 x))
(define-fun
  f2
  ((x Int) (y Int)) Int (+ 2 (* x y)))
(define-fun-rec
  u2
  ((x Int) (y Int) (z Int)) Int
  (ite (<= x 0) y (f2 (u2 (- x 1) y z) (v2 (- x 1) y z))))
(define-fun
  w2
  ((x Int)) Int (u2 x 2 j2))
(define-fun
  fast
  ((x Int)) Int (+ (* (+ 1 2) (w2 x)) 1))
(define-fun
  f1
  ((x Int) (y Int)) Int (- (* (+ 2 y) x) 1))
(define-fun-rec
  u1
  ((x Int) (y Int)) Int (ite (<= x 0) y (f1 (u1 (- x 1) y) x)))
(define-fun
  v1
  ((x Int)) Int (u1 2 x))
(define-fun-rec
  u0
  ((x Int) (y Int)) Int (ite (<= x 0) y (v1 (u0 (- x 1) y))))
(define-fun
  v0
  ((x Int)) Int (u0 (g0 x) 1))
(assert-not
  (forall ((c Int)) (or (not (>= c 0)) (= (v0 c) (fast c)))))
