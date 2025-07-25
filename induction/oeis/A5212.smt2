(define-fun-rec
  u2
  ((x Int) (y Int)) Int (ite (<= x 0) y (* (u2 (- x 1) y) x)))
(define-fun-rec
  u0
  ((x Int) (y Int)) Int (ite (<= x 0) y (* (u0 (- x 1) y) x)))
(define-fun
  j1
  ((x Int)) Int x)
(define-fun
  h1
  ((x Int)) Int (mod x 2))
(define-fun
  h0
  ((x Int)) Int (mod x 2))
(define-fun
  v0
  ((x Int)) Int (u0 x (h0 x)))
(define-fun
  g2
  ((x Int) (y Int)) Int (- y 1))
(define-fun
  v2
  ((x Int) (y Int)) Int (u2 (g2 x y) 1))
(define-fun
  g1
  () Int (+ 1 2))
(define-fun
  v1
  ((x Int) (y Int) (z Int)) Int (ite (<= x 0) z g1))
(define-fun-rec
  u1
  ((x Int) (y Int) (z Int)) Int
  (ite (<= x 0) y (v2 (u1 (- x 1) y z) (v1 (- x 1) y z))))
(define-fun
  w1
  ((x Int)) Int (u1 (h1 x) 0 x))
(define-fun
  g0
  ((x Int)) Int x)
(define-fun
  fast
  ((x Int)) Int (* (w1 x) x))
(assert-not
  (forall ((c Int)) (or (not (>= c 0)) (= (v0 c) (fast c)))))
