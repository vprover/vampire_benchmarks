(define-fun
  small
  ((x Int)) Int (mod (div (- (div (mod x (+ 1 2)) 2) x) 2) 2))
(define-fun
  fast
  ((x Int)) Int
  (mod (+ (div (+ (* 2 (* x x)) x) (+ 2 (+ 2 2))) x) 2))
(assert-not
  (forall ((c Int)) (or (not (>= c 0)) (= (small c) (fast c)))))
