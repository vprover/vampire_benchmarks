(define-fun
  small
  ((x Int)) Int (+ (div (mod x (+ 1 (div x 2))) (+ 1 (+ 2 2))) x))
(define-fun
  fast
  ((x Int)) Int
  (+ (div (- (ite (<= x 0) 1 x) 1) (+ 2 (* 2 (+ 2 2)))) x))
(assert-not
  (forall ((c Int)) (or (not (>= c 0)) (= (small c) (fast c)))))
