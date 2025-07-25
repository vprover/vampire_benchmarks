(define-fun
  small
  ((x Int)) Int (+ (* 2 (div (+ 2 (div x 2)) (+ 1 2))) x))
(define-fun
  fast
  ((x Int)) Int (- x (* 2 (div (- 1 x) (+ 2 (+ 2 2))))))
(assert-not
  (forall ((c Int)) (or (not (>= c 0)) (= (small c) (fast c)))))
