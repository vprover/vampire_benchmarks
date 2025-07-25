(define-fun
  small
  ((x Int)) Int (div (mod 2 (ite (<= (mod x (+ 1 2)) 0) 1 x)) 2))
(define-fun
  fast
  ((x Int)) Int (mod (* (ite (<= (- x 2) 0) 0 x) x) (+ 1 2)))
(assert-not
  (forall ((c Int)) (or (not (>= c 0)) (= (small c) (fast c)))))
