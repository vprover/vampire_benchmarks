(define-fun
  g0
  ((x Int)) Int (div x 2))
(define-fun
  fast
  ((x Int)) Int (+ (+ (div (- 2 (mod x (+ 2 2))) 2) x) x))
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
  ((x Int)) Int (+ 1 (+ x (v0 x))))
(assert-not
  (forall ((c Int)) (or (not (>= c 0)) (= (small c) (fast c)))))
