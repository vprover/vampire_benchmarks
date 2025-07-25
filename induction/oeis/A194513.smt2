(define-fun
  h0
  ((x Int)) Int (+ 1 x))
(define-fun
  fast
  ((x Int)) Int
  (+ (- (* (div (+ (- (* 2 (+ x x)) 2) x) (+ 1 (* 2 (+ 2 2)))) 2) x)
    1))
(define-fun
  f0
  ((x Int)) Int (- (* 2 (div x (+ 1 2))) x))
(define-fun-rec
  u0
  ((x Int) (y Int)) Int (ite (<= x 0) y (f0 (u0 (- x 1) y))))
(define-fun
  v0
  ((x Int)) Int (u0 2 (h0 x)))
(assert-not
  (forall ((c Int)) (or (not (>= c 0)) (= (v0 c) (fast c)))))
