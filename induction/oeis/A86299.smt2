(define-fun
  h2
  () Int (+ 2 2))
(define-fun
  g0
  () Int (* 2 (+ 2 2)))
(define-fun
  f2
  ((x Int)) Int (+ (* x x) x))
(define-fun-rec
  u2
  ((x Int) (y Int)) Int (ite (<= x 0) y (f2 (u2 (- x 1) y))))
(define-fun
  v2
  () Int (u2 2 h2))
(define-fun
  f1
  ((x Int)) Int (* (* (* (* x x) x) x) x))
(define-fun-rec
  u1
  ((x Int) (y Int)) Int (ite (<= x 0) y (f1 (u1 (- x 1) y))))
(define-fun
  v1
  () Int (u1 1 v2))
(define-fun
  fast
  ((x Int)) Int (ite (<= (mod v1 (+ 1 x)) 0) 1 0))
(define-fun
  f0
  ((x Int) (y Int)) Int (* (* x x) y))
(define-fun-rec
  u0
  ((x Int) (y Int)) Int (ite (<= x 0) y (f0 (u0 (- x 1) y) x)))
(define-fun
  v0
  () Int (u0 g0 1))
(define-fun
  small
  ((x Int)) Int (ite (<= (mod v0 (+ 1 x)) 0) 1 0))
(assert-not
  (forall ((c Int)) (or (not (>= c 0)) (= (small c) (fast c)))))
