(define-fun
  h1
  () Int (+ 2 (* 2 (+ 2 2))))
(define-fun
  h0
  ((x Int)) Int x)
(define-fun
  f1
  ((x Int)) Int (* x x))
(define-fun-rec
  u1
  ((x Int) (y Int)) Int (ite (<= x 0) y (f1 (u1 (- x 1) y))))
(define-fun
  v1
  () Int (u1 1 h1))
(define-fun
  fast
  ((x Int)) Int (ite (<= (- (- v1 1) x) 0) 2 (ite (<= x 0) 0 1)))
(define-fun
  f0
  ((x Int) (y Int)) Int (+ (div x (- 1 (* 2 (+ 2 2)))) y))
(define-fun-rec
  u0
  ((x Int) (y Int)) Int (ite (<= x 0) y (f0 (u0 (- x 1) y) x)))
(define-fun
  v0
  ((x Int)) Int (u0 2 x))
(define-fun
  small
  ((x Int)) Int (div (v0 x) 2))
(assert-not
  (forall ((c Int)) (or (not (>= c 0)) (= (small c) (fast c)))))
