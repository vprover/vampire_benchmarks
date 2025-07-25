(define-fun
  g1
  ((x Int)) Int (- x 1))
(define-fun
  g0
  ((x Int)) Int x)
(define-fun
  f1
  ((x Int) (y Int)) Int (* 2 (+ (+ (div x y) x) x)))
(define-fun-rec
  u1
  ((x Int) (y Int)) Int (ite (<= x 0) y (f1 (u1 (- x 1) y) x)))
(define-fun
  v1
  ((x Int)) Int (u1 (g1 x) 2))
(define-fun
  fast
  ((x Int)) Int (* (div (v1 x) (+ 1 x)) (ite (<= x 0) 0 2)))
(define-fun
  f0
  ((x Int) (y Int)) Int (* 2 (+ (- x (div x y)) x)))
(define-fun-rec
  u0
  ((x Int) (y Int)) Int (ite (<= x 0) y (f0 (u0 (- x 1) y) x)))
(define-fun
  v0
  ((x Int)) Int (u0 x 2))
(define-fun
  small
  ((x Int)) Int (* (div (v0 x) (+ 1 x)) x))
(assert-not
  (forall ((c Int)) (or (not (>= c 0)) (= (small c) (fast c)))))
