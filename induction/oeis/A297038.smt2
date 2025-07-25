(define-fun
  small
  ((x Int)) Int (ite (<= (- (div x (+ 1 2)) 2) 0) 0 1))
(define-fun
  fast
  ((x Int)) Int (ite (<= (- x (* 2 (+ 2 2))) 0) 0 1))
(assert-not
  (forall ((c Int)) (or (not (>= c 0)) (= (small c) (fast c)))))
