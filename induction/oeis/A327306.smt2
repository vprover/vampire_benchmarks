(define-fun
  fast
  ((x Int)) Int
  (mod
    (+ (div (* 2 (* 2 (+ x x))) (- (* 2 (* 2 (+ 2 (+ 2 2)))) 1)) x)
    (+ 1 2)))
(define-fun
  f0
  ((x Int) (y Int)) Int (* (+ 2 y) x))
(define-fun-rec
  u0
  ((x Int) (y Int)) Int (ite (<= x 0) y (f0 (u0 (- x 1) y) x)))
(define-fun
  v0
  () Int (u0 2 2))
(define-fun
  small
  ((x Int)) Int
  (mod (+ (div (+ (div x (- v0 1)) x) (+ 1 2)) x) (+ 1 2)))
(assert-not
  (forall ((c Int)) (or (not (>= c 0)) (= (small c) (fast c)))))
