(define-fun
  v3
  ((x Int) (y Int) (z Int)) Int (ite (<= x 0) z 2))
(define-fun
  v1
  ((x Int) (y Int) (z Int)) Int (ite (<= x 0) z 2))
(define-fun
  u3
  ((x Int) (y Int) (z Int)) Int (ite (<= x 0) y (v3 (- x 1) y z)))
(define-fun-rec
  u2
  ((x Int) (y Int)) Int (ite (<= x 0) y (* (u2 (- x 1) y) x)))
(define-fun
  u1
  ((x Int) (y Int) (z Int)) Int (ite (<= x 0) y (v1 (- x 1) y z)))
(define-fun-rec
  u0
  ((x Int) (y Int)) Int (ite (<= x 0) y (* (u0 (- x 1) y) x)))
(define-fun
  j3
  ((x Int)) Int x)
(define-fun
  j1
  ((x Int)) Int x)
(define-fun
  h3
  ((x Int)) Int (+ 2 (- 2 x)))
(define-fun
  w3
  ((x Int)) Int (u3 (h3 x) 2 x))
(define-fun
  v2
  ((x Int)) Int (u2 x (w3 x)))
(define-fun
  h1
  ((x Int)) Int (- x 2))
(define-fun
  w1
  ((x Int)) Int (u1 (h1 x) 2 x))
(define-fun
  v0
  ((x Int)) Int (u0 x (w1 x)))
(define-fun
  g2
  ((x Int)) Int x)
(define-fun
  g0
  ((x Int)) Int x)
(define-fun
  f3
  ((x Int) (y Int)) Int y)
(define-fun
  f1
  ((x Int) (y Int)) Int y)
(assert-not
  (forall ((c Int)) (or (not (>= c 0)) (= (v0 c) (v2 c)))))
