(define-fun
  small
  ((x Int)) Int
  (+
    (*
      (+ (+ (div (+ (ite (<= (- (div x (+ 2 2)) 2) 0) 1 0) x) (+ 1 2)) 2)
        x)
      2)
    x))
(define-fun
  fast
  ((x Int)) Int
  (+
    (*
      (+
        (+ (div (+ (ite (<= (- x (* 2 (+ 2 (+ 2 2)))) 0) 1 0) x) (+ 1 2))
          2)
        x)
      2)
    x))
(assert-not
  (forall ((c Int)) (or (not (>= c 0)) (= (small c) (fast c)))))
