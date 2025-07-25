(define-fun
  h1
  ((x Int)) Int (+ (div x 2) x))
(define-fun
  h0
  ((x Int)) Int x)
(define-fun
  f1
  ((x Int)) Int (+ (* (+ 1 2) (div x 2)) x))
(define-fun-rec
  u1
  ((x Int) (y Int)) Int (ite (<= x 0) y (f1 (u1 (- x 1) y))))
(define-fun
  v1
  ((x Int)) Int (u1 1 (h1 x)))
(define-fun
  f0
  ((x Int) (y Int)) Int (+ (* (+ (- y 1) y) (div x 2)) x))
(define-fun-rec
  u0
  ((x Int) (y Int)) Int (ite (<= x 0) y (f0 (u0 (- x 1) y) x)))
(define-fun
  v0
  ((x Int)) Int (u0 2 x))
(assert-not
  (forall ((c Int)) (or (not (>= c 0)) (= (v0 c) (v1 c)))))
