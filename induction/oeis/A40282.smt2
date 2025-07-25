(define-fun
  u0
  ((x Int) (y Int)) Int (ite (<= x 0) y 1))
(define-fun
  h0
  () Int (+ 2 (+ 2 2)))
(define-fun
  g1
  ((x Int)) Int (- 1 (mod x (+ 2 2))))
(define-fun
  g0
  ((x Int)) Int (mod x (+ 2 2)))
(define-fun
  v0
  ((x Int)) Int (u0 (g0 x) h0))
(define-fun
  small
  ((x Int)) Int
  (-
    (+
      (+
        (+
          (-
            (div
              (+
                (*
                  (*
                    (* (+ (* (- (* (v0 x) (ite (<= x 0) 1 2)) (mod x 2)) 2) 1)
                      (- 2 (mod x 2)))
                    2)
                  1)
                1)
              (+ 1 2))
            x)
          1)
        (ite (<= x 0) 1 2))
      x)
    2))
(define-fun
  f1
  ((x Int)) Int (+ 1 (+ 2 (+ 2 (mod x 2)))))
(define-fun-rec
  u1
  ((x Int) (y Int)) Int (ite (<= x 0) y (f1 (u1 (- x 1) y))))
(define-fun
  v1
  ((x Int)) Int (u1 (g1 x) 1))
(define-fun
  fast
  ((x Int)) Int
  (+
    (-
      (div
        (+
          (*
            (-
              (+
                (*
                  (+ (* (+ (* (- (v1 x) (mod x 2)) 2) 1) (ite (<= x 0) 1 2))
                    (mod x 2))
                  2)
                1)
              (mod x 2))
            2)
          1)
        (+ 1 2))
      2)
    1))
(assert-not
  (forall ((c Int)) (or (not (>= c 0)) (= (small c) (fast c)))))
