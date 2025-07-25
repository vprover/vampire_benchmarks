(define-fun
  u0
  ((x Int) (y Int)) Int (ite (<= x 0) y 1))
(define-fun
  small
  ((x Int)) Int (mod (* (div x 2) x) 2))
(define-fun
  g0
  ((x Int)) Int (- (mod x (+ 2 2)) 2))
(define-fun
  v0
  ((x Int)) Int (u0 (g0 x) 0))
(assert-not
  (forall ((c Int)) (or (not (>= c 0)) (= (small c) (v0 c)))))
