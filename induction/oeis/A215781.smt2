(define-fun
  g0
  ((x Int)) Int x)
(define-fun
  fast
  ((x Int)) Int
  (- x (div (+ (div x (+ 2 (* 2 (+ 2 (+ 2 2))))) x) (+ 2 2))))
(define-fun
  f0
  ((x Int) (y Int)) Int (- y (div (* x y) (+ (+ x y) y))))
(define-fun-rec
  u0
  ((x Int) (y Int)) Int (ite (<= x 0) y (f0 (u0 (- x 1) y) x)))
(define-fun
  v0
  ((x Int)) Int (u0 x 0))
(assert-not
  (forall ((c Int)) (or (not (>= c 0)) (= (v0 c) (fast c)))))
