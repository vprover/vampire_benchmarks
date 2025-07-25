(define-fun
  small
  ((x Int)) Int (- (div (- (div (* x x) 2) x) 2) 1))
(define-fun
  fast
  ((x Int)) Int (- (div (* (- x 2) x) (+ 2 2)) 1))
(assert-not
  (forall ((c Int)) (or (not (>= c 0)) (= (small c) (fast c)))))
