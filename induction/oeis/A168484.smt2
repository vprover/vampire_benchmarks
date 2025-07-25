(define-fun
  small
  ((x Int)) Int
  (+ (+ 2 (+ (- x (mod x (+ 2 2))) x)) (div (+ (div x 2) x) 2)))
(define-fun
  fast
  ((x Int)) Int
  (+ (+ 2 (+ (- x (mod x (+ 2 2))) x)) (div (+ (+ x x) x) (+ 2 2))))
(assert-not
  (forall ((c Int)) (or (not (>= c 0)) (= (small c) (fast c)))))
