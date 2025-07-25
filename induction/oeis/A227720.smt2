(define-fun
  small
  ((x Int)) Int
  (+ (+ 1 (* (+ 2 (+ (+ x x) x)) (+ 2 x))) (div (+ 1 (div x 2)) 2)))
(define-fun
  fast
  ((x Int)) Int
  (+ (+ 1 (* (+ 2 (+ (+ x x) x)) (+ 2 x))) (div (+ 2 x) (+ 2 2))))
(assert-not
  (forall ((c Int)) (or (not (>= c 0)) (= (small c) (fast c)))))
