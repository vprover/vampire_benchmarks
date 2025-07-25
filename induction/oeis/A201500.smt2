(define-fun
  small
  ((x Int)) Int
  (+ (div (+ (* (div x (+ 1 (mod x 2))) (+ 2 (div x 2))) x) 2) 2))
(define-fun
  fast
  ((x Int)) Int
  (* (- (+ 1 x) (div (* (- 2 x) x) (* 2 (+ 2 2)))) (- 2 (mod x 2))))
(assert-not
  (forall ((c Int)) (or (not (>= c 0)) (= (small c) (fast c)))))
