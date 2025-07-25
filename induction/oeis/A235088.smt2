(define-fun
  u2
  ((x Int) (y Int)) Int (ite (<= x 0) y 0))
(define-fun
  u1
  ((x Int) (y Int)) Int (ite (<= x 0) y 0))
(define-fun-rec
  u0
  ((x Int) (y Int)) Int (ite (<= x 0) y (+ (u0 (- x 1) y) x)))
(define-fun
  g2
  ((x Int)) Int (mod x 2))
(define-fun
  v2
  ((x Int)) Int (u2 (g2 x) 2))
(define-fun
  g1
  ((x Int)) Int (mod x 2))
(define-fun
  v1
  ((x Int)) Int (u1 (g1 x) 2))
(define-fun
  g0
  ((x Int)) Int (+ 1 (+ x x)))
(define-fun
  v0
  ((x Int)) Int (u0 (g0 x) (v1 x)))
(define-fun
  fast
  ((x Int)) Int (+ (* (+ 1 (+ x x)) (+ 1 x)) (v2 x)))
(assert-not
  (forall ((c Int)) (or (not (>= c 0)) (= (v0 c) (fast c)))))
