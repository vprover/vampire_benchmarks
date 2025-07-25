(define-fun
  small
  ((x Int)) Int
  (+
    (+
      (div
        (+
          (*
            (*
              (+
                (+ (div (+ (- 2 (mod (div x (+ 2 2)) 2)) x) (+ 2 2))
                  (ite (<= x 0) 1 x))
                x)
              2)
            2)
          1)
        (+ 1 2))
      x)
    x))
(define-fun
  fast
  ((x Int)) Int
  (+
    (div
      (+
        (+
          (*
            (*
              (+
                (+ (div (* 2 (+ (+ 1 (div x (* 2 (+ 2 2)))) x)) (+ 1 2))
                  (ite (<= x 0) 1 x))
                x)
              2)
            2)
          1)
        x)
      (+ 1 2))
    x))
(assert-not
  (forall ((c Int)) (or (not (>= c 0)) (= (small c) (fast c)))))
