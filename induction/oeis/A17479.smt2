(define-fun-rec
  v0
  ((x Int) (y Int) (z Int)) Int (ite (<= x 0) z (v0 (- x 1) y z)))
(define-fun
  h3
  ((x Int)) Int (* x x))
(define-fun
  h2
  ((x Int)) Int (+ 1 (- (* 2 (* (+ 1 2) (+ 1 (+ x x)))) x)))
(define-fun
  h1
  ((x Int)) Int x)
(define-fun
  h0
  () Int (+ 1 2))
(define-fun
  g0
  ((x Int) (y Int)) Int y)
(define-fun
  f3
  ((x Int)) Int (* (* x x) x))
(define-fun-rec
  u3
  ((x Int) (y Int)) Int (ite (<= x 0) y (f3 (u3 (- x 1) y))))
(define-fun
  v3
  ((x Int)) Int (u3 1 (h3 x)))
(define-fun
  f2
  ((x Int)) Int (* (v3 x) x))
(define-fun-rec
  u2
  ((x Int) (y Int)) Int (ite (<= x 0) y (f2 (u2 (- x 1) y))))
(define-fun
  v2
  ((x Int)) Int (u2 1 (h2 x)))
(define-fun
  f1
  ((x Int) (y Int)) Int (+ (* (+ 2 y) x) y))
(define-fun-rec
  u1
  ((x Int) (y Int)) Int (ite (<= x 0) y (f1 (u1 (- x 1) y) x)))
(define-fun
  v1
  ((x Int)) Int (u1 2 x))
(define-fun
  j0
  ((x Int)) Int (- (v1 x) x))
(define-fun
  f0
  ((x Int) (y Int)) Int (* (+ 1 y) (* x x)))
(define-fun-rec
  u0
  ((x Int) (y Int) (z Int)) Int
  (ite (<= x 0) y (f0 (u0 (- x 1) y z) (v0 (- x 1) y z))))
(define-fun
  w0
  ((x Int)) Int (u0 h0 1 (j0 x)))
(assert-not
  (forall ((c Int)) (or (not (>= c 0)) (= (w0 c) (v2 c)))))
