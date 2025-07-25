(define-fun
  h1
  () Int (+ 1 (+ 2 2)))
(define-fun
  h0
  () Int (+ 2 (* 2 (+ 2 2))))
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
  ((x Int)) Int (* (+ (* (- (* 2 v1) 1) (+ (- x 2) x)) x) x))
(define-fun
  f0
  ((x Int)) Int (* (* x x) x))
(define-fun-rec
  u0
  ((x Int) (y Int)) Int (ite (<= x 0) y (f0 (u0 (- x 1) y))))
(define-fun
  v0
  () Int (u0 1 h0))
(define-fun
  small
  ((x Int)) Int (+ (* (- v0 2) (div (- (* x x) x) 2)) x))
(assert-not
  (forall ((c Int)) (or (not (>= c 0)) (= (small c) (fast c)))))
