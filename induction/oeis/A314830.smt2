(define-funs-rec
  ((u1
    ((x Int) (y Int) (z Int)) Int)
   (v1
    ((x Int) (y Int) (z Int)) Int))
  ((ite (<= x 0) y (+ (u1 (- x 1) y z) (v1 (- x 1) y z)))
   (ite (<= x 0) z (u1 (- x 1) y z))))
(define-fun
  w1
  ((x Int) (y Int)) Int (u1 y x 0))
(define-fun
  j0
  ((x Int)) Int x)
(define-fun
  i1
  ((x Int)) Int x)
(define-fun
  h1
  ((x Int) (y Int)) Int y)
(define-fun
  h0
  () Int (+ 1 2))
(define-fun
  g1
  ((x Int)) Int x)
(define-fun
  g0
  ((x Int) (y Int)) Int (div y 2))
(define-funs-rec
  ((v0
    ((x Int) (y Int) (z Int)) Int)
   (u0
    ((x Int) (y Int) (z Int)) Int))
  ((ite (<= x 0) z (g0 (u0 (- x 1) y z) (v0 (- x 1) y z)))
   (ite (<= x 0) y (w1 (u0 (- x 1) y z) (v0 (- x 1) y z)))))
(define-fun
  w0
  ((x Int)) Int (u0 h0 1 x))
(define-fun
  small
  ((x Int)) Int
  (div
    (+ (+ (+ (+ (+ (+ (+ (+ (+ (mod (w0 x) 2) x) x) x) x) x) x) x) x)
      x)
    (ite (<= x 0) 1 2)))
(define-fun
  fast
  ((x Int)) Int
  (+
    (+
      (div
        (+
          (+
            (-
              (+
                (+
                  (+
                    (+
                      (div
                        (+
                          (+
                            (*
                              (+
                                (+
                                  (div
                                    (+
                                      (+
                                        (+
                                          (+
                                            (+
                                              (+
                                                (div
                                                  (+
                                                    (+ (* (div (+ 1 (+ x x)) (+ 1 2)) (+ 2 (+ 2 2)))
                                                      1)
                                                    x)
                                                  (ite (<= x 0) 1 2))
                                                x)
                                              x)
                                            x)
                                          x)
                                        x)
                                      x)
                                    (ite (<= x 0) 1 2))
                                  x)
                                x)
                              2)
                            1)
                          x)
                        (+ 1 2))
                      x)
                    x)
                  x)
                x)
              (ite (<= x 0) 1 2))
            x)
          x)
        (+ 1 2))
      1)
    x))
(assert-not
  (forall ((c Int)) (or (not (>= c 0)) (= (small c) (fast c)))))
