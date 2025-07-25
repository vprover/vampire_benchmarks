(define-fun-rec
  u0
  ((x Int) (y Int)) Int (ite (<= x 0) y (+ (u0 (- x 1) y) x)))
(define-fun
  g0
  ((x Int)) Int (+ 1 x))
(define-fun
  v0
  ((x Int)) Int (u0 (g0 x) 0))
(define-fun
  small
  ((x Int)) Int (* (+ 2 (+ 2 (mod (div x 2) 2))) (v0 x)))
(define-fun
  fast
  ((x Int)) Int
  (* (div (* (+ 1 x) (+ 2 x)) 2) (+ (+ 2 2) (mod (div x 2) 2))))
(assert-not
  (forall ((c Int)) (or (not (>= c 0)) (= (small c) (fast c)))))
