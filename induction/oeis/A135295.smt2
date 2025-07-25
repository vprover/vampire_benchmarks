(define-fun
  small
  ((x Int)) Int (* (ite (<= (- (- (div x 2) 2) 2) 0) 1 x) x))
(define-fun
  fast
  ((x Int)) Int (* (ite (<= (+ 2 (- (* 2 (+ 2 2)) x)) 0) x 1) x))
(assert-not
  (forall ((c Int)) (or (not (>= c 0)) (= (small c) (fast c)))))
