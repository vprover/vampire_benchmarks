(define-fun
  small
  ((x Int)) Int
  (+
    (+ (div (+ 2 (+ (div (+ 1 (+ x x)) (+ 1 (+ 2 2))) x)) (+ 1 2)) 1)
    x))
(define-fun
  fast
  ((x Int)) Int
  (+
    (+ (+ (div (* 2 (+ 2 (* 2 (+ x x)))) (- 1 (* 2 (* 2 (+ 2 2))))) 2)
      x)
    x))
(assert-not
  (forall ((c Int)) (or (not (>= c 0)) (= (small c) (fast c)))))
