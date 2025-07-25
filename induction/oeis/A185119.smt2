(define-fun
  small
  ((x Int)) Int (mod (div (- 2 (div x (+ 1 2))) (+ 2 x)) 2))
(define-fun
  fast
  ((x Int)) Int
  (ite (<= (- x (* 2 (+ 2 2))) 0) (ite (<= x 0) 1 0) 1))
(assert-not
  (forall ((c Int)) (or (not (>= c 0)) (= (small c) (fast c)))))
