(define-fun
  u1
  ((x Int) (y Int)) Int (ite (<= x 0) y x))
(define-fun
  g1
  ((x Int)) Int (mod (+ 1 x) (+ 2 2)))
(define-fun
  v1
  ((x Int)) Int (u1 (g1 x) 1))
(define-fun
  g0
  ((x Int)) Int x)
(define-fun
  fast
  ((x Int)) Int (+ (+ 2 (+ (- x (v1 x)) x)) (div x 2)))
(define-fun
  f1
  ((x Int) (y Int)) Int y)
(define-fun
  f0
  ((x Int)) Int (+ (mod x (+ 1 (+ 2 2))) x))
(define-fun-rec
  u0
  ((x Int) (y Int)) Int (ite (<= x 0) y (f0 (u0 (- x 1) y))))
(define-fun
  v0
  ((x Int)) Int (u0 x 1))
(assert-not
  (forall ((c Int)) (or (not (>= c 0)) (= (v0 c) (fast c)))))
