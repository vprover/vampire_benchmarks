(define-fun-rec
  u0
  ((x Int) (y Int)) Int (ite (<= x 0) y (+ (u0 (- x 1) y) x)))
(define-fun
  h0
  ((x Int)) Int (ite (<= (div x 2) 0) 2 1))
(define-fun
  v0
  ((x Int)) Int (u0 x (h0 x)))
(define-fun
  small
  ((x Int)) Int (* (+ (* x x) (v0 x)) 2))
(define-fun
  g1
  ((x Int)) Int (- 2 x))
(define-fun
  g0
  ((x Int)) Int x)
(define-fun
  f1
  () Int (+ 2 2))
(define-fun
  u1
  ((x Int) (y Int)) Int (ite (<= x 0) y f1))
(define-fun
  v1
  ((x Int)) Int (u1 (g1 x) 2))
(define-fun
  fast
  ((x Int)) Int (+ (+ (* (+ 1 2) (* x x)) (v1 x)) x))
(assert-not
  (forall ((c Int)) (or (not (>= c 0)) (= (small c) (fast c)))))
