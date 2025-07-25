(define-fun
  small
  ((x Int)) Int
  (div (+ (+ (mod (+ 1 (mod x (+ 2 (* 2 (+ 2 2))))) (+ 1 x)) x) x)
    (+ 1 x)))
(define-fun
  fast
  ((x Int)) Int
  (ite
    (<= (- (mod (+ 1 (mod x (+ 2 (* 2 (+ 2 2))))) (+ 1 x)) 1) 0)
    (ite (<= x 0) 0 1) 2))
(assert-not
  (forall ((c Int)) (or (not (>= c 0)) (= (small c) (fast c)))))
