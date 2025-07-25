(define-fun
  small
  ((x Int)) Int
  (div (mod (div (* (- 2 x) x) 2) (+ 1 (+ 2 2))) (+ 1 2)))
(define-fun
  fast
  ((x Int)) Int
  (ite
    (<= (- (mod (* (+ 1 2) (+ 1 x)) (+ 2 (* 2 (+ 2 2)))) 2) 0) 1 0))
(assert-not
  (forall ((c Int)) (or (not (>= c 0)) (= (small c) (fast c)))))
