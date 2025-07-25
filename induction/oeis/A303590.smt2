(define-fun
  small
  ((x Int)) Int
  (+
    (+ (div (+ (- 2 (div (- x (div x (+ 1 2))) (+ 1 (+ 2 2)))) x) 2) x)
    x))
(define-fun
  fast
  ((x Int)) Int
  (+ 1
    (+ (+ x x)
      (div (- x (div (+ 2 (+ x x)) (- (* (* (+ 2 2) 2) 2) 1))) 2))))
(assert-not
  (forall ((c Int)) (or (not (>= c 0)) (= (small c) (fast c)))))
