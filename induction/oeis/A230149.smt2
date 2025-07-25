(define-fun
  small
  ((x Int)) Int
  (- (div (div x 2) 2) (div (mod x (+ 1 (+ 2 2))) (+ 2 2))))
(define-fun
  fast
  ((x Int)) Int
  (+ (ite (<= (mod (+ 1 x) (+ 1 (+ 2 2))) 0) 1 2)
    (- (div x (+ 2 2)) 2)))
(assert-not
  (forall ((c Int)) (or (not (>= c 0)) (= (small c) (fast c)))))
