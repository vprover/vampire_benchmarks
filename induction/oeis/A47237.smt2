(define-fun
  small
  ((x Int)) Int (+ (div (- x (mod (div x 2) 2)) 2) x))
(define-fun
  fast
  ((x Int)) Int (+ (div (- x (ite (<= (mod x (+ 2 2)) 0) 0 1)) 2) x))
(assert-not
  (forall ((c Int)) (or (not (>= c 0)) (= (small c) (fast c)))))
