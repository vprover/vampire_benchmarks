(define-fun
  u1
  ((x Int) (y Int)) Int (ite (<= x 0) y 1))
(define-fun
  h1
  () Int (* 2 (+ 2 2)))
(define-fun
  h0
  ((x Int)) Int x)
(define-fun
  g1
  ((x Int)) Int (mod x 2))
(define-fun
  v1
  ((x Int)) Int (u1 (g1 x) h1))
(define-fun
  g0
  () Int (+ 1 2))
(define-fun
  v0
  ((x Int) (y Int) (z Int)) Int (ite (<= x 0) z g0))
(define-fun
  fast
  ((x Int)) Int (ite (<= x 0) 0 (v1 x)))
(define-fun
  f0
  ((x Int) (y Int)) Int (- (* y y) x))
(define-fun-rec
  u0
  ((x Int) (y Int) (z Int)) Int
  (ite (<= x 0) y (f0 (u0 (- x 1) y z) (v0 (- x 1) y z))))
(define-fun
  w0
  ((x Int)) Int (u0 x 0 1))
(assert-not
  (forall ((c Int)) (or (not (>= c 0)) (= (w0 c) (fast c)))))
