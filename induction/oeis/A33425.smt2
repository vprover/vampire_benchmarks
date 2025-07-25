(define-fun
  h2
  ((x Int)) Int (* x x))
(define-fun
  h1
  () Int (+ 2 (* 2 (+ 2 2))))
(define-fun
  g0
  () Int (+ 1 2))
(define-fun
  f2
  ((x Int)) Int (* (* x x) x))
(define-fun-rec
  u2
  ((x Int) (y Int)) Int (ite (<= x 0) y (f2 (u2 (- x 1) y))))
(define-fun
  v2
  ((x Int)) Int (u2 1 (h2 x)))
(define-fun
  f1
  ((x Int)) Int (* (v2 x) x))
(define-fun-rec
  u1
  ((x Int) (y Int)) Int (ite (<= x 0) y (f1 (u1 (- x 1) y))))
(define-fun
  v1
  () Int (u1 1 h1))
(define-fun
  fast
  ((x Int)) Int (div v1 (+ 1 x)))
(define-fun
  f0
  ((x Int)) Int (* (+ 1 (+ 2 2)) (* x x)))
(define-fun-rec
  u0
  ((x Int) (y Int)) Int (ite (<= x 0) y (f0 (u0 (- x 1) y))))
(define-fun
  v0
  () Int (u0 g0 2))
(define-fun
  small
  ((x Int)) Int (div (div v0 (+ 1 x)) 2))
(assert-not
  (forall ((c Int)) (or (not (>= c 0)) (= (small c) (fast c)))))
