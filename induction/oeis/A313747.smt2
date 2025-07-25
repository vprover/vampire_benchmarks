(define-fun
  g0
  ((x Int)) Int (- x 1))
(define-fun
  fast
  ((x Int)) Int
  (+
    (div
      (+
        (+
          (*
            (+
              (+
                (div
                  (+
                    (*
                      (+
                        (+
                          (div (+ (+ 1 (+ (+ (mod (div x (+ 2 (+ 2 2))) 2) x) x)) x) (+ 2 2))
                          (ite (<= x 0) 1 x))
                        x)
                      2)
                    1)
                  (+ 1 2))
                x)
              x)
            (+ 1 2))
          1)
        x)
      (+ 1 2))
    x))
(define-fun
  f0
  ((x Int)) Int
  (+
    (+ (mod (ite (<= (- (mod (* x x) (+ 1 (+ 2 (+ 2 2)))) 2) 0) 2 x) 2)
      1)
    x))
(define-fun-rec
  u0
  ((x Int) (y Int)) Int (ite (<= x 0) y (f0 (u0 (- x 1) y))))
(define-fun
  v0
  ((x Int)) Int (u0 (g0 x) 2))
(define-fun
  small
  ((x Int)) Int (+ (+ (+ (+ (- (v0 x) 1) x) x) x) x))
(assert-not
  (forall ((c Int)) (or (not (>= c 0)) (= (small c) (fast c)))))
