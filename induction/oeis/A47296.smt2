(define-fun
  g0
  ((x Int)) Int x)
(define-fun
  fast
  ((x Int)) Int
  (+ 2 (- (* 2 (+ (div x (+ 1 2)) x)) (div (- x 1) (+ 1 2)))))
(define-fun
  f0
  ((x Int)) Int (+ (mod x (+ 1 (+ 2 (+ 2 2)))) x))
(define-fun-rec
  u0
  ((x Int) (y Int)) Int (ite (<= x 0) y (f0 (u0 (- x 1) y))))
(define-fun
  v0
  ((x Int)) Int (u0 x 1))
(define-fun
  small
  ((x Int)) Int (+ 2 (v0 x)))
(assert-not
  (forall ((c Int)) (or (not (>= c 0)) (= (small c) (fast c)))))
