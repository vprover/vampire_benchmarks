(define-fun
  small
  ((x Int)) Int (+ (+ (- 2 (div (- 1 x) (+ 1 (div x 2)))) 2) x))
(define-fun
  fast
  ((x Int)) Int (+ (+ (- 2 (div (- 2 (+ x x)) (+ 2 x))) 2) x))
(assert-not
  (forall ((c Int)) (or (not (>= c 0)) (= (small c) (fast c)))))
