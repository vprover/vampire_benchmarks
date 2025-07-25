(define-fun
  h0
  ((x Int)) Int (- (* x x) (ite (<= x 0) 0 1)))
(define-fun
  fast
  ((x Int)) Int
  (div (- (* x x) (ite (<= x 0) 0 1)) (* 2 (+ 2 (+ 2 2)))))
(define-fun
  f0
  ((x Int) (y Int)) Int (div x (+ 2 y)))
(define-fun-rec
  u0
  ((x Int) (y Int)) Int (ite (<= x 0) y (f0 (u0 (- x 1) y) x)))
(define-fun
  v0
  ((x Int)) Int (u0 2 (h0 x)))
(assert-not
  (forall ((c Int)) (or (not (>= c 0)) (= (v0 c) (fast c)))))
