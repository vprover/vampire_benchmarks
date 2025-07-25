(define-fun
  small
  ((x Int)) Int
  (+ (- 1 (div (+ (- x (div x 2)) x) (+ 1 (+ 2 (+ 2 2))))) x))
(define-fun
  fast
  ((x Int)) Int
  (+ 1 (- x (div (+ 1 (+ (+ x x) x)) (+ (* (+ (+ 2 2) 2) 2) 2)))))
(assert-not
  (forall ((c Int)) (or (not (>= c 0)) (= (small c) (fast c)))))
