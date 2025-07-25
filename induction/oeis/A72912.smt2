(define-fun
  small
  ((x Int)) Int
  (+
    (div (+ (div (- 0 (div (div (div x 2) 2) 2)) (+ 1 2)) x) (+ 1 2))
    1))
(define-fun
  fast
  ((x Int)) Int
  (+
    (div (+ (+ (- x (div x (* 2 (+ 2 2)))) x) x) (+ 1 (* 2 (+ 2 2))))
    1))
(assert-not
  (forall ((c Int)) (or (not (>= c 0)) (= (small c) (fast c)))))
