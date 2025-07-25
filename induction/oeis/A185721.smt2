(define-fun
  h2
  () Int (+ 1 (+ 2 2)))
(define-fun
  h0
  ((x Int)) Int x)
(define-fun
  g1
  () Int (+ 1 (+ 2 2)))
(define-fun
  f2
  ((x Int)) Int (* (* (* (* x x) x) x) x))
(define-fun-rec
  u2
  ((x Int) (y Int)) Int (ite (<= x 0) y (f2 (u2 (- x 1) y))))
(define-fun
  v2
  () Int (u2 1 h2))
(define-fun
  fast
  ((x Int)) Int (div (* (* (* (* x x) x) x) x) v2))
(define-fun
  f1
  ((x Int)) Int (+ (* 2 (+ x x)) x))
(define-fun-rec
  u1
  ((x Int) (y Int)) Int (ite (<= x 0) y (f1 (u1 (- x 1) y))))
(define-fun
  v1
  () Int (u1 g1 1))
(define-fun
  f0
  ((x Int)) Int (* x x))
(define-fun-rec
  u0
  ((x Int) (y Int)) Int (ite (<= x 0) y (f0 (u0 (- x 1) y))))
(define-fun
  v0
  ((x Int)) Int (u0 2 x))
(define-fun
  small
  ((x Int)) Int (div (* (v0 x) x) v1))
(assert-not
  (forall ((c Int)) (or (not (>= c 0)) (= (small c) (fast c)))))
