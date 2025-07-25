(define-fun
  small
  ((x Int)) Int
  (+ (div (* (* x x) x) (+ 1 2)) (mod (mod x (+ 1 2)) 2)))
(define-fun
  h0
  ((x Int)) Int (* (* x x) x))
(define-fun
  f0
  ((x Int)) Int (+ (* (div (- 1 x) (+ 1 2)) 2) x))
(define-fun-rec
  u0
  ((x Int) (y Int)) Int (ite (<= x 0) y (f0 (u0 (- x 1) y))))
(define-fun
  v0
  ((x Int)) Int (u0 1 (h0 x)))
(assert-not
  (forall ((c Int)) (or (not (>= c 0)) (= (small c) (v0 c)))))
