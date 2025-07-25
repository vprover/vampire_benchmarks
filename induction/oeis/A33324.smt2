(define-fun-rec
  u1
  ((x Int) (y Int)) Int (ite (<= x 0) y (+ (u1 (- x 1) y) x)))
(define-fun
  small
  ((x Int)) Int (div (+ 2 2) (+ 1 x)))
(define-fun
  g1
  ((x Int) (y Int)) Int (- y 2))
(define-fun
  v1
  ((x Int) (y Int)) Int (u1 (g1 x y) 1))
(define-fun-rec
  u0
  ((x Int) (y Int)) Int (ite (<= x 0) y (v1 (u0 (- x 1) y) x)))
(define-fun
  g0
  ((x Int)) Int (+ 2 (- 2 x)))
(define-fun
  v0
  ((x Int)) Int (u0 (g0 x) 0))
(assert-not
  (forall ((c Int)) (or (not (>= c 0)) (= (small c) (v0 c)))))
