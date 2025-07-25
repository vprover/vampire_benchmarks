(define-fun
  small
  ((x Int)) Int (ite (<= (- (div (+ 1 x) (* 2 (+ 2 2))) 2) 0) 1 0))
(define-fun
  fast
  ((x Int)) Int
  (ite (<= (+ 2 (- x (* 2 (* 2 (+ 2 (+ 2 2)))))) 0) 1 0))
(assert-not
  (forall ((c Int)) (or (not (>= c 0)) (= (small c) (fast c)))))
