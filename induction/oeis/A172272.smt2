(define-fun
  small
  ((x Int)) Int (+ (div (+ (div (div x 2) (+ 1 2)) x) 2) x))
(define-fun
  fast
  ((x Int)) Int (+ (div (+ (div x (+ 2 (+ 2 2))) x) 2) x))
(assert-not
  (forall ((c Int)) (or (not (>= c 0)) (= (small c) (fast c)))))
