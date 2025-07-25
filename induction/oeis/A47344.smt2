(define-fun
  small
  ((x Int)) Int (+ (+ (div (div x 2) 2) (div x 2)) x))
(define-fun
  fast
  ((x Int)) Int (+ (+ (div x 2) (div x (+ 2 2))) x))
(assert-not
  (forall ((c Int)) (or (not (>= c 0)) (= (small c) (fast c)))))
