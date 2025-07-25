(define-fun
  u1
  ((x Int) (y Int)) Int (ite (<= x 0) y 1))
(define-fun
  h1
  ((x Int)) Int (- x 2))
(define-fun
  h0
  ((x Int)) Int x)
(define-fun
  g1
  ((x Int)) Int (- 2 x))
(define-fun
  v1
  ((x Int)) Int (u1 (g1 x) (h1 x)))
(define-fun
  g0
  ((x Int)) Int x)
(define-fun
  fast
  ((x Int)) Int (+ (div (+ (* (v1 x) (- x 2)) x) 2) 2))
(define-fun
  f0
  ((x Int) (y Int)) Int (- (mod 2 x) y))
(define-fun-rec
  u0
  ((x Int) (y Int)) Int (ite (<= x 0) y (f0 (u0 (- x 1) y) x)))
(define-fun
  v0
  ((x Int)) Int (u0 x x))
(define-fun
  small
  ((x Int)) Int (- 1 (v0 x)))
(assert-not
  (forall ((c Int)) (or (not (>= c 0)) (= (small c) (fast c)))))
