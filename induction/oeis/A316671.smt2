(define-fun-rec
  u0
  ((x Int) (y Int)) Int (ite (<= x 0) y (+ (u0 (- x 1) y) x)))
(define-fun
  h1
  ((x Int)) Int (+ 1 (- x (div x 2))))
(define-fun
  h0
  ((x Int)) Int (mod x 2))
(define-fun
  g0
  ((x Int)) Int (+ (mod x 2) x))
(define-fun
  v0
  ((x Int)) Int (u0 (g0 x) (h0 x)))
(define-fun
  small
  ((x Int)) Int (+ 1 (v0 x)))
(define-fun
  f1
  ((x Int)) Int (- (* 2 (* x x)) x))
(define-fun-rec
  u1
  ((x Int) (y Int)) Int (ite (<= x 0) y (f1 (u1 (- x 1) y))))
(define-fun
  v1
  ((x Int)) Int (u1 1 (h1 x)))
(define-fun
  fast
  ((x Int)) Int (- (v1 x) x))
(assert-not
  (forall ((c Int)) (or (not (>= c 0)) (= (small c) (fast c)))))
