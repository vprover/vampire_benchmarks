(define-fun
  h0
  ((x Int)) Int (- x 1))
(define-fun
  g2
  ((x Int)) Int x)
(define-fun
  g1
  ((x Int)) Int x)
(define-fun
  g0
  ((x Int)) Int (- x 1))
(define-fun
  f2
  ((x Int)) Int (+ x x))
(define-fun-rec
  u2
  ((x Int) (y Int)) Int (ite (<= x 0) y (f2 (u2 (- x 1) y))))
(define-fun
  v2
  ((x Int)) Int (u2 x 1))
(define-fun
  fast
  ((x Int)) Int
  (*
    (-
      (+
        (+
          (div
            (div
              (div (- (- (+ (+ (* (v2 x) (- (div (- (* x x) x) 2) 2)) 1) x) 2) x)
                2)
              2)
            2)
          1)
        x)
      x)
    2))
(define-fun
  f1
  ((x Int)) Int (+ x x))
(define-fun-rec
  u1
  ((x Int) (y Int)) Int (ite (<= x 0) y (f1 (u1 (- x 1) y))))
(define-fun
  v1
  ((x Int)) Int (u1 x 1))
(define-fun
  f0
  ((x Int)) Int (+ x x))
(define-fun-rec
  u0
  ((x Int) (y Int)) Int (ite (<= x 0) y (f0 (u0 (- x 1) y))))
(define-fun
  v0
  ((x Int)) Int (u0 (g0 x) (h0 x)))
(define-fun
  small
  ((x Int)) Int
  (* (div (+ (div (- (div (+ (* (v0 x) x) 1) 2) (v1 x)) 2) 1) 2) 2))
(assert-not
  (forall ((c Int)) (or (not (>= c 0)) (= (small c) (fast c)))))
