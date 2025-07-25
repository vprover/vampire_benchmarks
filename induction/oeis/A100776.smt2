(define-fun
  h2
  () Int (+ 2 (* 2 (+ 2 2))))
(define-fun
  h1
  ((x Int)) Int x)
(define-fun
  f2
  ((x Int)) Int (* (* x x) x))
(define-fun-rec
  u2
  ((x Int) (y Int)) Int (ite (<= x 0) y (f2 (u2 (- x 1) y))))
(define-fun
  v2
  () Int (u2 1 h2))
(define-fun
  fast
  ((x Int)) Int (+ (* (+ 1 v2) (+ 1 x)) (* (* 2 (- 2 x)) 2)))
(define-fun
  f1
  ((x Int) (y Int)) Int (* (+ 2 y) x))
(define-fun-rec
  u1
  ((x Int) (y Int)) Int (ite (<= x 0) y (f1 (u1 (- x 1) y) x)))
(define-fun
  v1
  ((x Int)) Int (u1 2 x))
(define-fun
  f0
  ((x Int)) Int (+ (* (* x x) x) x))
(define-fun-rec
  u0
  ((x Int) (y Int)) Int (ite (<= x 0) y (f0 (u0 (- x 1) y))))
(define-fun
  v0
  () Int (u0 2 2))
(define-fun
  small
  ((x Int)) Int (- (* (+ 1 x) (- v0 1)) (v1 x)))
(assert-not
  (forall ((c Int)) (or (not (>= c 0)) (= (small c) (fast c)))))
