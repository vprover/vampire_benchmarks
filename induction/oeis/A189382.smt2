(define-fun
  small
  ((x Int)) Int
  (+ 1
    (+
      (div (+ (div (- x (div x (+ 1 (+ 2 (+ 2 2))))) (+ 1 (+ 2 2))) x) 2)
      x)))
(define-fun
  fast
  ((x Int)) Int
  (+
    (+
      (div (* 2 (+ 2 (* 2 (* 2 (+ (+ x x) x)))))
        (+ 1 (* 2 (* 2 (+ 2 (* 2 (+ 2 2)))))))
      1)
    x))
(assert-not
  (forall ((c Int)) (or (not (>= c 0)) (= (small c) (fast c)))))
