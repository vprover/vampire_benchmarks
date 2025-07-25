(define-fun
  h0
  ((x Int)) Int x)
(define-fun
  g0
  ((x Int)) Int (ite (<= x 0) 0 2))
(define-fun
  fast
  ((x Int)) Int
  (+ (div (+ 2 x) (* 2 (* 2 (+ 2 2)))) (ite (<= x 0) 0 1)))
(define-fun
  f0
  ((x Int) (y Int)) Int (div (+ (div x 2) y) 2))
(define-fun-rec
  u0
  ((x Int) (y Int)) Int (ite (<= x 0) y (f0 (u0 (- x 1) y) x)))
(define-fun
  v0
  ((x Int)) Int (u0 (g0 x) x))
(assert-not
  (forall ((c Int)) (or (not (>= c 0)) (= (v0 c) (fast c)))))
