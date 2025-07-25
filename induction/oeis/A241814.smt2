(define-fun
  small
  ((x Int)) Int
  (+ (div (* (+ 1 2) (div (div x 2) (- 2 (mod x 2)))) 2) 1))
(define-fun
  fast
  ((x Int)) Int
  (+ (div (* (+ 1 2) (div x (* 2 (- 2 (mod x 2))))) 2) 1))
(assert-not
  (forall ((c Int)) (or (not (>= c 0)) (= (small c) (fast c)))))
