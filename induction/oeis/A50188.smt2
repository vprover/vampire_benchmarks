(define-fun
  h0
  ((x Int)) Int x)
(define-fun
  g0
  ((x Int)) Int x)
(define-fun
  fast
  ((x Int)) Int
  (* (+ 1 (+ 2 x)) (div (* (+ 1 x) (+ 2 x)) (+ 2 (+ 2 2)))))
(define-fun
  f0
  ((x Int) (y Int)) Int (+ (div (- y 1) (+ 1 2)) x))
(define-fun-rec
  u0
  ((x Int) (y Int)) Int (ite (<= x 0) y (f0 (u0 (- x 1) y) x)))
(define-fun
  v0
  ((x Int)) Int (u0 x x))
(define-fun
  small
  ((x Int)) Int (* (+ 1 (+ 2 x)) (v0 x)))
(assert-not
  (forall ((c Int)) (or (not (>= c 0)) (= (small c) (fast c)))))
