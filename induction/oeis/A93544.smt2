(define-fun
  small
  ((x Int)) Int
  (div (+ 1 (* 2 (+ x x))) (+ 1 (mod (* (+ 2 x) x) (+ 1 2)))))
(define-fun
  h0
  ((x Int)) Int (+ x x))
(define-fun
  g0
  ((x Int)) Int (- (mod x (+ 1 2)) 1))
(define-fun
  f0
  ((x Int)) Int (div x (+ 1 2)))
(define-fun-rec
  u0
  ((x Int) (y Int)) Int (ite (<= x 0) y (f0 (u0 (- x 1) y))))
(define-fun
  v0
  ((x Int)) Int (u0 (g0 x) (h0 x)))
(define-fun
  fast
  ((x Int)) Int (+ (* (v0 x) 2) 1))
(assert-not
  (forall ((c Int)) (or (not (>= c 0)) (= (small c) (fast c)))))
