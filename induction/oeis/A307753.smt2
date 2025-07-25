(define-fun
  small
  ((x Int)) Int (div (+ 1 (mod (- 2 x) (+ 2 (+ 2 2)))) (+ 1 x)))
(define-fun
  fast
  ((x Int)) Int
  (div (+ 1 (ite (<= (- x 2) 0) (- 2 x) (+ 2 2))) (+ x 1)))
(assert-not
  (forall ((c Int)) (or (not (>= c 0)) (= (small c) (fast c)))))
