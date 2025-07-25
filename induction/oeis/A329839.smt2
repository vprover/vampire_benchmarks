(define-fun
  small
  ((x Int)) Int
  (+ (+ (div (+ 1 (+ (- x (div (div x 2) 2)) x)) (+ 1 (+ 2 2))) 1)
    x))
(define-fun
  h0
  () Int (+ 1 2))
(define-fun
  f0
  ((x Int)) Int (* (* x x) x))
(define-fun-rec
  u0
  ((x Int) (y Int)) Int (ite (<= x 0) y (f0 (u0 (- x 1) y))))
(define-fun
  v0
  () Int (u0 1 h0))
(define-fun
  fast
  ((x Int)) Int (div (* (+ 1 x) v0) (* 2 (+ 2 (* 2 (+ 2 2))))))
(assert-not
  (forall ((c Int)) (or (not (>= c 0)) (= (small c) (fast c)))))
