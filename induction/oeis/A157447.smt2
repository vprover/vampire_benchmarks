(define-fun
  h1
  () Int (+ 2 2))
(define-fun
  h0
  ((x Int)) Int x)
(define-fun
  g0
  () Int (+ 2 2))
(define-fun
  f1
  ((x Int)) Int (* (* x x) x))
(define-fun-rec
  u1
  ((x Int) (y Int)) Int (ite (<= x 0) y (f1 (u1 (- x 1) y))))
(define-fun
  v1
  () Int (u1 1 h1))
(define-fun
  fast
  ((x Int)) Int (* (- (* (+ 1 x) v1) 2) (* 2 (+ 2 2))))
(define-fun
  f0
  ((x Int) (y Int)) Int (* 2 (* 2 (- (- y 2) x))))
(define-fun-rec
  u0
  ((x Int) (y Int)) Int (ite (<= x 0) y (f0 (u0 (- x 1) y) x)))
(define-fun
  v0
  ((x Int)) Int (u0 g0 x))
(define-fun
  small
  ((x Int)) Int (* (v0 x) 2))
(assert-not
  (forall ((c Int)) (or (not (>= c 0)) (= (small c) (fast c)))))
