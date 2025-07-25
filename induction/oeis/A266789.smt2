(define-fun
  h0
  () Int (+ 1 2))
(define-fun
  g0
  ((x Int)) Int x)
(define-fun
  fast
  ((x Int)) Int
  (mod
    (+ (div (+ (* (+ 1 (div x (+ 1 (+ 2 2)))) (+ 1 2)) 2) (+ 1 x)) x)
    2))
(define-fun
  f0
  ((x Int) (y Int)) Int (div (* 2 (+ 2 (+ x x))) y))
(define-fun-rec
  u0
  ((x Int) (y Int)) Int (ite (<= x 0) y (f0 (u0 (- x 1) y) x)))
(define-fun
  v0
  ((x Int)) Int (u0 x h0))
(define-fun
  small
  ((x Int)) Int (mod (+ (div (v0 x) 2) x) 2))
(assert-not
  (forall ((c Int)) (or (not (>= c 0)) (= (small c) (fast c)))))
