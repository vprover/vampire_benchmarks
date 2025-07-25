(define-fun
  small
  ((x Int)) Int (+ 1 (mod (- 0 x) (+ (div (* x x) 2) 2))))
(define-fun
  fast
  ((x Int)) Int (+ (+ 1 (- (div (* x x) 2) (ite (<= x 0) 2 x))) 2))
(assert-not
  (forall ((c Int)) (or (not (>= c 0)) (= (small c) (fast c)))))
