(define-fun
  small
  ((x Int)) Int (div (+ (ite (<= (mod x 2) 0) 2 x) x) 2))
(define-fun
  h0
  ((x Int)) Int x)
(define-fun
  g0
  ((x Int)) Int (- 1 (mod x 2)))
(define-fun
  f0
  ((x Int)) Int (+ 1 (div x 2)))
(define-fun-rec
  u0
  ((x Int) (y Int)) Int (ite (<= x 0) y (f0 (u0 (- x 1) y))))
(define-fun
  v0
  ((x Int)) Int (u0 (g0 x) x))
(assert-not
  (forall ((c Int)) (or (not (>= c 0)) (= (small c) (v0 c)))))
