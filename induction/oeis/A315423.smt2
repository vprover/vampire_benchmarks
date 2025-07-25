(define-fun
  h2
  ((x Int)) Int (+ x x))
(define-fun
  g1
  ((x Int) (y Int)) Int y)
(define-fun
  g0
  ((x Int)) Int x)
(define-fun
  fast
  ((x Int)) Int
  (+
    (div
      (+
        (+
          (*
            (+
              (div
                (+
                  (+
                    (*
                      (*
                        (+
                          (+
                            (+ (+ (+ (div (- (ite (<= x 0) 1 x) 1) (+ 1 (+ 2 (+ 2 2)))) x) 1)
                              (div x (+ 1 (+ 2 (+ 2 2)))))
                            x)
                          x)
                        (ite (<= x 0) 1 2))
                      2)
                    1)
                  x)
                (+ 1 2))
              x)
            2)
          1)
        x)
      (+ 1 2))
    x))
(define-fun
  f2
  ((x Int)) Int (mod (* x x) (- (* 2 (* 2 (+ 2 2))) 1)))
(define-fun-rec
  u2
  ((x Int) (y Int)) Int (ite (<= x 0) y (f2 (u2 (- x 1) y))))
(define-fun
  v2
  ((x Int)) Int (u2 2 (h2 x)))
(define-fun
  f1
  ((x Int)) Int (mod (v2 x) 2))
(define-fun-rec
  t1
  ((x Int)) Int (ite (<= (f1 x) 0) x (t1 (+ x 1))))
(define-fun-rec
  u1
  ((x Int)) Int (ite (<= x 0) (t1 0) (t1 (+ (u1 (- x 1)) 1))))
(define-fun
  v1
  ((x Int) (y Int)) Int (u1 y))
(define-fun-rec
  u0
  ((x Int) (y Int)) Int (ite (<= x 0) y (v1 (u0 (- x 1) y) x)))
(define-fun
  v0
  ((x Int)) Int (u0 x 1))
(define-fun
  small
  ((x Int)) Int (+ (+ (+ (v0 x) x) x) x))
(assert-not
  (forall ((c Int)) (or (not (>= c 0)) (= (small c) (fast c)))))
