(define-fun
  small
  ((x Int)) Int (* (mod x 2) (mod x (+ 2 2))))
(define-fun
  fast
  ((x Int)) Int (mod (* (* x x) x) (+ 2 2)))
(assert-not
  (forall ((c Int)) (or (not (>= c 0)) (= (small c) (fast c)))))
