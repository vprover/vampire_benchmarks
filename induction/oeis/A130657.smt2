(define-fun
  u0
  ((x Int) (y Int)) Int (ite (<= x 0) y 0))
(define-fun
  small
  ((x Int)) Int (- 1 (div (div (mod x (+ 1 (+ 2 (+ 2 2)))) 2) 2)))
(define-fun
  g0
  ((x Int)) Int (- (- (mod x (+ 1 (+ 2 (+ 2 2)))) 1) 2))
(define-fun
  v0
  ((x Int)) Int (u0 (g0 x) 1))
(assert-not
  (forall ((c Int)) (or (not (>= c 0)) (= (small c) (v0 c)))))
