(define-fun
  small
  ((x Int)) Int (div 1 (ite (<= (mod x (+ 1 2)) 0) 1 x)))
(define-fun
  fast
  ((x Int)) Int (ite (<= (- (* (mod x (+ 1 2)) x) 1) 0) 1 0))
(assert-not
  (forall ((c Int)) (or (not (>= c 0)) (= (small c) (fast c)))))
