(define-fun
  small
  ((x Int)) Int
  (- (mod x (+ 2 (* 2 (+ 2 2)))) (div (div x 2) (+ 1 (+ 2 2)))))
(define-fun
  fast
  ((x Int)) Int
  (+ (* (div x (+ 2 (* 2 (+ 2 2)))) (- 1 (* 2 (+ 2 (+ 2 2))))) x))
(assert-not
  (forall ((c Int)) (or (not (>= c 0)) (= (small c) (fast c)))))
