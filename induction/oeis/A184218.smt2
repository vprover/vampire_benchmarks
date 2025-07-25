(define-fun
  u2
  ((x Int) (y Int)) Int (ite (<= x 0) y 2))
(define-fun-rec
  u1
  ((x Int) (y Int)) Int (ite (<= x 0) y (+ (u1 (- x 1) y) x)))
(define-fun
  v1
  ((x Int)) Int (u1 x 0))
(define-fun
  u0
  ((x Int) (y Int)) Int (ite (<= x 0) y 1))
(define-fun
  h2
  ((x Int)) Int (+ (* x x) x))
(define-fun
  g2
  ((x Int)) Int (+ 2 (- 2 x)))
(define-fun
  v2
  ((x Int)) Int (u2 (g2 x) (h2 x)))
(define-fun
  g1
  ((x Int)) Int x)
(define-fun
  g0
  ((x Int)) Int (+ 2 (- 2 x)))
(define-fun
  v0
  ((x Int)) Int (u0 (g0 x) (v1 x)))
(define-fun
  small
  ((x Int)) Int (- (v0 x) 1))
(define-fun
  fast
  ((x Int)) Int (- (div (v2 x) 2) 1))
(assert-not
  (forall ((c Int)) (or (not (>= c 0)) (= (small c) (fast c)))))
