(define-fun
  small
  ((x Int)) Int (+ 1 (mod (mod x (+ 1 2)) 2)))
(define-fun
  fast
  ((x Int)) Int (ite (<= (mod (+ 2 x) (+ 1 2)) 0) 2 1))
(assert-not
  (forall ((c Int)) (or (not (>= c 0)) (= (small c) (fast c)))))
