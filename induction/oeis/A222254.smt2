(define-fun
  small
  ((x Int)) Int
  (+ (div (- (mod (+ 1 x) (+ 1 (+ 2 2))) (mod x 2)) (+ 2 2)) x))
(define-fun
  fast
  ((x Int)) Int
  (+ (div (- (mod (+ 1 x) (+ 2 (* 2 (+ 2 2)))) 1) (* 2 (+ 2 2))) x))
(assert-not
  (forall ((c Int)) (or (not (>= c 0)) (= (small c) (fast c)))))
