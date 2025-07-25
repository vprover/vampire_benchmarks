(define-fun-rec
  u1
  ((x Int) (y Int)) Int (ite (<= x 0) y (+ (u1 (- x 1) y) x)))
(define-fun
  v1
  ((x Int)) Int (u1 x 0))
(define-fun
  h2
  ((x Int)) Int (+ (* x x) x))
(define-fun
  g1
  ((x Int)) Int x)
(define-fun
  f2
  ((x Int)) Int (ite (<= (mod x (+ 1 2)) 0) (div x (+ 1 2)) x))
(define-fun-rec
  u2
  ((x Int) (y Int)) Int (ite (<= x 0) y (f2 (u2 (- x 1) y))))
(define-fun
  v2
  ((x Int)) Int (u2 2 (h2 x)))
(define-fun
  fast
  ((x Int)) Int (div (v2 x) 2))
(define-fun
  f0
  ((x Int)) Int (ite (<= (mod x (+ 1 2)) 0) (div x (+ 1 2)) x))
(define-fun-rec
  u0
  ((x Int) (y Int)) Int (ite (<= x 0) y (f0 (u0 (- x 1) y))))
(define-fun
  v0
  ((x Int)) Int (u0 2 (v1 x)))
(assert-not
  (forall ((c Int)) (or (not (>= c 0)) (= (v0 c) (fast c)))))
