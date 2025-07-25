(define-fun
  u0
  ((x Int) (y Int)) Int (ite (<= x 0) y 1))
(define-fun
  small
  ((x Int)) Int (div 1 (ite (<= (mod x (+ 2 (div x 2))) 0) 1 x)))
(define-fun
  h0
  () Int (+ 2 2))
(define-fun
  g0
  ((x Int)) Int (- (+ 1 2) x))
(define-fun
  v0
  ((x Int)) Int (u0 (g0 x) h0))
(define-fun
  fast
  ((x Int)) Int (ite (<= (- x (v0 x)) 0) 1 0))
(assert-not
  (forall ((c Int)) (or (not (>= c 0)) (= (small c) (fast c)))))
