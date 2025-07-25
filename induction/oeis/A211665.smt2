(define-fun
  small
  ((x Int)) Int (ite (<= (- (div x (+ 1 2)) 2) 0) 1 2))
(define-fun
  fast
  ((x Int)) Int (ite (<= (- x (* 2 (+ 2 2))) 0) 1 2))
(assert-not
  (forall ((c Int)) (or (not (>= c 0)) (= (small c) (fast c)))))
