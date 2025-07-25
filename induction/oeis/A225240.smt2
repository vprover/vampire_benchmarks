(define-fun
  small
  ((x Int)) Int (+ 1 (+ (+ (mod (div (div x 2) 2) 2) x) x)))
(define-fun
  fast
  ((x Int)) Int (+ 1 (+ (+ (mod (div x (+ 2 2)) 2) x) x)))
(assert-not
  (forall ((c Int)) (or (not (>= c 0)) (= (small c) (fast c)))))
