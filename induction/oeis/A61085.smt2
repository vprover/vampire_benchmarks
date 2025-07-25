(define-fun
  u2
  ((x Int) (y Int)) Int (ite (<= x 0) y 2))
(define-fun
  u0
  ((x Int) (y Int)) Int (ite (<= x 0) y 2))
(define-fun
  h2
  () Int (+ 1 (* 2 (* 2 (+ 2 2)))))
(define-fun
  g2
  ((x Int)) Int (+ 2 (- 2 x)))
(define-fun
  v2
  ((x Int)) Int (u2 (g2 x) h2))
(define-fun
  g0
  ((x Int)) Int (+ 2 (- 2 x)))
(define-fun
  fast
  ((x Int)) Int (* (* (v2 x) 2) (+ 1 x)))
(define-fun
  f1
  ((x Int)) Int (* x x))
(define-fun-rec
  u1
  ((x Int) (y Int)) Int (ite (<= x 0) y (f1 (u1 (- x 1) y))))
(define-fun
  v1
  () Int (u1 2 2))
(define-fun
  h0
  () Int (+ 1 v1))
(define-fun
  v0
  ((x Int)) Int (u0 (g0 x) h0))
(define-fun
  small
  ((x Int)) Int (* (* (v0 x) 2) (+ 1 x)))
(assert-not
  (forall ((c Int)) (or (not (>= c 0)) (= (small c) (fast c)))))
