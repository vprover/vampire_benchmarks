(define-fun
  small
  ((x Int)) Int
  (+
    (div
      (div
        (*
          (+
            (+
              (+
                (+ (+ (+ (div (+ (* 2 (+ x x)) x) (+ 1 (+ 2 (* 2 (+ 2 2))))) 1) x)
                  (ite (<= x 0) 1 x))
                x)
              x)
            x)
          (+ 1 2))
        2)
      2)
    x))
(define-fun
  fast
  ((x Int)) Int
  (+
    (+
      (+
        (-
          (+
            (+
              (div
                (+
                  (* (+ (div (+ (* 2 (+ (+ x x) x)) x) (+ 1 (+ 2 (* 2 (+ 2 2))))) x)
                    2)
                  2)
                (+ 1 2))
              x)
            x)
          (ite (<= x 0) 1 2))
        x)
      x)
    2))
(assert-not
  (forall ((c Int)) (or (not (>= c 0)) (= (small c) (fast c)))))
