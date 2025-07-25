(define-fun
  small
  ((x Int)) Int
  (div
    (+ 1 (div (+ (div (+ (div (- 0 x) (* 2 (+ 2 2))) x) (+ 2 2)) x) 2))
    2))
(define-fun
  fast
  ((x Int)) Int
  (div (+ 2 (+ (div (+ (div (- 0 x) (* 2 (+ 2 2))) x) (+ 2 2)) x))
    (+ 2 2)))
(assert-not
  (forall ((c Int)) (or (not (>= c 0)) (= (small c) (fast c)))))
