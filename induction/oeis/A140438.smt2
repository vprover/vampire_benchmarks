(define-fun
  small
  ((x Int)) Int (ite (<= (- (- (div x 2) 2) 2) 0) 1 2))
(define-fun
  fast
  ((x Int)) Int (ite (<= (+ 2 (- (* 2 (+ 2 2)) x)) 0) 2 1))
(assert-not
  (forall ((c Int)) (or (not (>= c 0)) (= (small c) (fast c)))))
