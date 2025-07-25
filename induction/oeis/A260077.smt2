(define-fun-rec
  v0
  ((x Int) (y Int) (z Int)) Int (ite (<= x 0) z (v0 (- x 1) y z)))
(define-fun-rec
  u3
  ((x Int) (y Int)) Int (ite (<= x 0) y (* (u3 (- x 1) y) x)))
(define-fun-rec
  u1
  ((x Int) (y Int)) Int (ite (<= x 0) y (* (u1 (- x 1) y) x)))
(define-fun
  v1
  ((x Int)) Int (u1 x 1))
(define-fun
  h3
  ((x Int)) Int x)
(define-fun
  h0
  () Int (+ 2 2))
(define-fun
  g3
  ((x Int)) Int (- x 1))
(define-fun
  v3
  ((x Int)) Int (u3 (g3 x) x))
(define-fun
  g1
  ((x Int)) Int x)
(define-fun
  g0
  ((x Int) (y Int)) Int y)
(define-fun
  f2
  ((x Int)) Int (* (+ 1 (* x x)) (* (- x 1) x)))
(define-fun-rec
  u2
  ((x Int) (y Int)) Int (ite (<= x 0) y (f2 (u2 (- x 1) y))))
(define-fun
  v2
  ((x Int)) Int (u2 1 (v3 x)))
(define-fun
  fast
  ((x Int)) Int (+ (v2 x) 1))
(define-fun
  f0
  ((x Int) (y Int)) Int (- 1 (* x y)))
(define-fun-rec
  u0
  ((x Int) (y Int) (z Int)) Int
  (ite (<= x 0) y (f0 (u0 (- x 1) y z) (v0 (- x 1) y z))))
(define-fun
  w0
  ((x Int)) Int (u0 h0 1 (v1 x)))
(assert-not
  (forall ((c Int)) (or (not (>= c 0)) (= (w0 c) (fast c)))))
