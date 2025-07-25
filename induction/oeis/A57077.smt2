(define-fun
  g0
  ((x Int)) Int (div x 2))
(define-fun
  fast
  ((x Int)) Int (- 1 (mod (- (* x x) x) (+ 2 2))))
(define-fun
  f0
  ((x Int)) Int (- 0 x))
(define-fun-rec
  u0
  ((x Int) (y Int)) Int (ite (<= x 0) y (f0 (u0 (- x 1) y))))
(define-fun
  v0
  ((x Int)) Int (u0 (g0 x) 1))
(assert-not
  (forall ((c Int)) (or (not (>= c 0)) (= (v0 c) (fast c)))))
