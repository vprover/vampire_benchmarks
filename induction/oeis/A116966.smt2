(define-fun
  v1
  ((x Int) (y Int) (z Int)) Int (ite (<= x 0) z 1))
(define-fun
  u1
  ((x Int) (y Int) (z Int)) Int (ite (<= x 0) y (v1 (- x 1) y z)))
(define-fun
  h1
  ((x Int)) Int (mod (- 2 x) (+ 2 2)))
(define-fun
  w1
  ((x Int)) Int (u1 (h1 x) 0 2))
(define-fun
  g0
  ((x Int)) Int x)
(define-fun
  fast
  ((x Int)) Int (+ x (w1 x)))
(define-fun
  f1
  ((x Int) (y Int)) Int y)
(define-fun
  f0
  ((x Int) (y Int)) Int (+ (mod x 2) y))
(define-fun-rec
  u0
  ((x Int) (y Int)) Int (ite (<= x 0) y (f0 (u0 (- x 1) y) x)))
(define-fun
  v0
  ((x Int)) Int (u0 x 1))
(define-fun
  small
  ((x Int)) Int (+ (mod x 2) (v0 x)))
(assert-not
  (forall ((c Int)) (or (not (>= c 0)) (= (small c) (fast c)))))
