(define-fun
  small
  ((x Int)) Int
  (+ (ite (<= (- (div x (+ 1 2)) (mod x (+ 1 2))) 0) 2 1) x))
(define-fun
  fast
  ((x Int)) Int
  (+ (ite (<= (+ (- 1 (* 2 (* 2 (div x (+ 1 2))))) x) 0) 1 2) x))
(assert-not
  (forall ((c Int)) (or (not (>= c 0)) (= (small c) (fast c)))))
