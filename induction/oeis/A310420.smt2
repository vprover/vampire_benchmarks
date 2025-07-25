(define-fun
  h3
  ((x Int)) Int (+ (+ x x) x))
(define-fun
  h1
  ((x Int)) Int x)
(define-fun
  g0
  ((x Int)) Int x)
(define-fun
  f3
  ((x Int)) Int
  (-
    (-
      (*
        (-
          (-
            (div
              (+
                (+
                  (*
                    (+
                      (+
                        (div
                          (+
                            (*
                              (*
                                (+
                                  (+ (div (* (+ 1 (+ 2 2)) (+ 1 x)) (+ 1 (+ 2 (* 2 (+ 2 2)))))
                                    (ite (<= x 0) 1 x))
                                  x)
                                2)
                              2)
                            1)
                          (+ 1 2))
                        x)
                      x)
                    2)
                  1)
                x)
              (+ 1 2))
            x)
          x)
        (ite (<= x 0) 1 2))
      x)
    x))
(define-fun-rec
  u3
  ((x Int) (y Int)) Int (ite (<= x 0) y (f3 (u3 (- x 1) y))))
(define-fun
  v3
  ((x Int)) Int (u3 1 (h3 x)))
(define-fun
  f2
  ((x Int)) Int (* x x))
(define-fun-rec
  u2
  ((x Int) (y Int)) Int (ite (<= x 0) y (f2 (u2 (- x 1) y))))
(define-fun
  v2
  () Int (u2 2 2))
(define-fun
  f1
  ((x Int)) Int (* x x))
(define-fun-rec
  u1
  ((x Int) (y Int)) Int (ite (<= x 0) y (f1 (u1 (- x 1) y))))
(define-fun
  v1
  ((x Int)) Int (u1 2 x))
(define-fun
  f0
  ((x Int)) Int
  (+ (+ (mod (div (mod (* (v1 x) x) (+ 1 v2)) 2) 2) 1) x))
(define-fun-rec
  u0
  ((x Int) (y Int)) Int (ite (<= x 0) y (f0 (u0 (- x 1) y))))
(define-fun
  v0
  ((x Int)) Int (u0 x 1))
(define-fun
  small
  ((x Int)) Int (- (* (+ (v0 x) x) 2) (ite (<= x 0) 1 2)))
(assert-not
  (forall ((c Int)) (or (not (>= c 0)) (= (small c) (v3 c)))))
