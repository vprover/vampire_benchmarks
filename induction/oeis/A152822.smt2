(define-fun
  small
  ((x Int)) Int (mod (ite (<= (mod (div x 2) 2) 0) 1 x) 2))
(define-fun
  fast
  ((x Int)) Int (ite (<= (mod (+ 2 x) (+ 2 2)) 0) 0 1))
(assert-not
  (forall ((c Int)) (or (not (>= c 0)) (= (small c) (fast c)))))
