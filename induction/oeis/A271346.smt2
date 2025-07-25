(define-fun
  h1
  ((x Int)) Int (div x (+ 1 2)))
(define-fun
  g0
  ((x Int)) Int (div x (+ 1 2)))
(define-fun
  f1
  ((x Int)) Int (+ (- x (mod x 2)) x))
(define-fun-rec
  u1
  ((x Int) (y Int)) Int (ite (<= x 0) y (f1 (u1 (- x 1) y))))
(define-fun
  v1
  ((x Int)) Int (u1 1 (h1 x)))
(define-fun
  fast
  ((x Int)) Int (* (+ (+ (v1 x) 2) x) 2))
(define-fun
  f0
  ((x Int)) Int (mod (div x 2) 2))
(define-fun-rec
  t0
  ((x Int)) Int (ite (<= (f0 x) 0) x (t0 (+ x 1))))
(define-fun-rec
  u0
  ((x Int)) Int (ite (<= x 0) (t0 0) (t0 (+ (u0 (- x 1)) 1))))
(define-fun
  v0
  ((x Int)) Int (u0 (g0 x)))
(define-fun
  small
  ((x Int)) Int (* (+ 2 (+ (v0 x) x)) 2))
(assert-not
  (forall ((c Int)) (or (not (>= c 0)) (= (small c) (fast c)))))
