(define-fun
  small
  ((x Int)) Int
  (div
    (div
      (div
        (+
          (*
            (+
              (+
                (div
                  (*
                    (-
                      (+ (* (+ (* (+ (* (+ 1 (+ 2 (+ 2 2))) (+ 1 (div x 2))) x) 2) 2) 2)
                        1)
                      x)
                    x)
                  2)
                1)
              2)
            2)
          x)
        2)
      2)
    2))
(define-fun
  fast
  ((x Int)) Int
  (+
    (+
      (div
        (+
          (+
            (+
              (+
                (div
                  (+
                    (div
                      (+
                        (* (+ (+ (* (+ (* 2 (* (+ 1 (+ 2 (+ 2 2))) (div x 2))) x) 2) 2) x)
                          x)
                        2)
                      2)
                    2)
                  2)
                x)
              x)
            x)
          x)
        2)
      x)
    x))
(assert-not
  (forall ((c Int)) (or (not (>= c 0)) (= (small c) (fast c)))))
