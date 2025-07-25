(define-fun
  u0
  ((x Int) (y Int)) Int (ite (<= x 0) y 2))
(define-fun
  small
  ((x Int)) Int (+ (* (mod (div x 2) 2) x) x))
(define-fun
  g0
  ((x Int)) Int (- (mod x (+ 2 2)) 1))
(define-fun
  v0
  ((x Int)) Int (u0 (g0 x) 1))
(define-fun
  fast
  ((x Int)) Int (* (v0 x) x))
(assert-not
  (forall ((c Int)) (or (not (>= c 0)) (= (small c) (fast c)))))
