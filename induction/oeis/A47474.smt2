(define-fun
  small
  ((x Int)) Int
  (- (* 2 (+ (div x (+ 1 2)) x)) (div (mod x (+ 1 2)) 2)))
(define-fun
  fast
  ((x Int)) Int
  (+ (+ (+ (- (div (- 1 x) (+ 1 2)) (mod x (+ 1 2))) x) x) x))
(assert-not
  (forall ((c Int)) (or (not (>= c 0)) (= (small c) (fast c)))))
