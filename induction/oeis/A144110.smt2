(define-fun
  small
  ((x Int)) Int (- 2 (mod (div x (+ 1 2)) 2)))
(define-fun
  fast
  ((x Int)) Int (ite (<= (- (mod x (+ 2 (+ 2 2))) 2) 0) 2 1))
(assert-not
  (forall ((c Int)) (or (not (>= c 0)) (= (small c) (fast c)))))
