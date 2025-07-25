(define-fun
  small
  ((x Int)) Int (* (div (+ 2 x) (+ 1 2)) (div (+ 1 (div x 2)) 2)))
(define-fun
  fast
  ((x Int)) Int (* (div (+ 2 x) (+ 1 2)) (div (+ 2 x) (+ 2 2))))
(assert-not
  (forall ((c Int)) (or (not (>= c 0)) (= (small c) (fast c)))))
