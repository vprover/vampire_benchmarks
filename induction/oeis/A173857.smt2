(define-fun
  small
  ((x Int)) Int (div (mod (ite (<= x 0) 2 x) (+ 1 2)) 2))
(define-fun
  fast
  ((x Int)) Int (mod (- (ite (<= x 0) 1 x) (* x x)) (+ 1 2)))
(assert-not
  (forall ((c Int)) (or (not (>= c 0)) (= (small c) (fast c)))))
