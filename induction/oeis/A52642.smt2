(define-fun-rec
  u2
  ((x Int) (y Int)) Int (ite (<= x 0) y (* (u2 (- x 1) y) x)))
(define-fun
  u1
  ((x Int) (y Int)) Int (ite (<= x 0) y x))
(define-fun-rec
  u0
  ((x Int) (y Int)) Int (ite (<= x 0) y (* (u0 (- x 1) y) x)))
(define-fun
  v0
  ((x Int)) Int (u0 x 1))
(define-fun
  h2
  ((x Int)) Int (ite (<= (- (- x 1) 2) 0) x 2))
(define-fun
  v2
  ((x Int)) Int (u2 x (h2 x)))
(define-fun
  g2
  ((x Int)) Int x)
(define-fun
  g1
  ((x Int)) Int (div x 2))
(define-fun
  v1
  ((x Int)) Int (u1 (g1 x) 2))
(define-fun
  small
  ((x Int)) Int (* (v0 x) (div x (v1 x))))
(define-fun
  g0
  ((x Int)) Int x)
(define-fun
  fast
  ((x Int)) Int (* (div (v2 x) 2) 2))
(define-fun
  f1
  ((x Int) (y Int)) Int y)
(assert-not
  (forall ((c Int)) (or (not (>= c 0)) (= (small c) (fast c)))))
