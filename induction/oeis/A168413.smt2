(define-fun
  h0
  ((x Int)) Int (- x (div x 2)))
(define-fun
  fast
  ((x Int)) Int (+ 2 (* (+ 1 2) (* (+ 1 2) (- x (div x 2))))))
(define-fun
  f0
  ((x Int)) Int (+ (+ x x) x))
(define-fun-rec
  u0
  ((x Int) (y Int)) Int (ite (<= x 0) y (f0 (u0 (- x 1) y))))
(define-fun
  v0
  ((x Int)) Int (u0 2 (h0 x)))
(define-fun
  small
  ((x Int)) Int (+ 2 (v0 x)))
(assert-not
  (forall ((c Int)) (or (not (>= c 0)) (= (small c) (fast c)))))
