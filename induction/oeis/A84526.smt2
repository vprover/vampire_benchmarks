(define-fun
  small
  ((x Int)) Int
  (+
    (div
      (+
        (+
          (-
            (+
              (*
                (+
                  (div
                    (+ (div (div (div (+ (div (* x x) (+ 1 (+ 2 (+ 2 2)))) x) 2) 2) 2)
                      x)
                    2)
                  x)
                2)
              1)
            x)
          x)
        x)
      (+ 2 x))
    1))
(define-fun
  fast
  ((x Int)) Int
  (div
    (+
      (+
        (-
          (+
            (+
              (+
                (+
                  (+
                    (div (+ 1 (+ (div (* (+ 2 x) x) (+ 2 (* 2 (+ 2 2)))) x))
                      (+ 2 (+ 2 2)))
                    1)
                  x)
                2)
              x)
            x)
          1)
        x)
      x)
    (+ 2 x)))
(assert-not
  (forall ((c Int)) (or (not (>= c 0)) (= (small c) (fast c)))))
