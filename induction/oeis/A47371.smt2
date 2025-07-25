(define-fun
  small
  ((x Int)) Int (+ (+ (div (- 0 (div x 2)) 2) x) x))
(define-fun
  fast
  ((x Int)) Int (+ (+ (div (- 1 x) (+ 2 2)) x) x))
(assert-not
  (forall ((c Int)) (or (not (>= c 0)) (= (small c) (fast c)))))
