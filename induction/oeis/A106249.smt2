(define-fun
  small
  ((x Int)) Int (+ (div x 2) (mod (div (- 2 x) 2) 2)))
(define-fun
  fast
  ((x Int)) Int (+ 1 (+ (* 2 (div (- 0 x) (+ 2 2))) x)))
(assert-not
  (forall ((c Int)) (or (not (>= c 0)) (= (small c) (fast c)))))
