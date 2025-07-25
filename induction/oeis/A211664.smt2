(define-fun
  small
  ((x Int)) Int (+ 2 (div (- x 1) (+ 1 (+ 2 (div x 2))))))
(define-fun
  fast
  ((x Int)) Int
  (+ (ite (<= (- (- (- x 2) 2) 2) 0) 0 1) (ite (<= x 0) 1 2)))
(assert-not
  (forall ((c Int)) (or (not (>= c 0)) (= (small c) (fast c)))))
