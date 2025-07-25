(define-fun
  u2
  ((x Int) (y Int)) Int (ite (<= x 0) y 2))
(define-funs-rec
  ((u0
    ((x Int) (y Int) (z Int)) Int)
   (v0
    ((x Int) (y Int) (z Int)) Int))
  ((ite (<= x 0) y (- (u0 (- x 1) y z) (v0 (- x 1) y z)))
   (ite (<= x 0) z (u0 (- x 1) y z))))
(define-fun
  j0
  () Int (+ 2 (+ 2 2)))
(define-fun
  h0
  ((x Int)) Int (- x 1))
(define-fun
  w0
  ((x Int)) Int (u0 (h0 x) 1 j0))
(define-fun
  g2
  ((x Int)) Int (- (mod x (+ 2 (+ 2 2))) 2))
(define-fun
  v2
  ((x Int)) Int (u2 (g2 x) 1))
(define-fun
  g0
  ((x Int)) Int x)
(define-fun
  fast
  ((x Int)) Int
  (-
    (div
      (*
        (+
          (- (- (* (+ (* (- (v2 x) (mod x 2)) 2) 1) (ite (<= x 0) 1 2)) 1)
            (mod x 2))
          1)
        (ite (<= x 0) 1 2))
      2)
    1))
(define-fun
  f1
  ((x Int)) Int (+ 1 (+ x x)))
(define-fun-rec
  u1
  ((x Int) (y Int)) Int (ite (<= x 0) y (f1 (u1 (- x 1) y))))
(define-fun
  v1
  () Int (u1 2 2))
(define-fun
  small
  ((x Int)) Int (- (mod (w0 x) v1) 1))
(assert-not
  (forall ((c Int)) (or (not (>= c 0)) (= (small c) (fast c)))))
