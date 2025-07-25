(define-funs-rec
  ((u1
    ((x Int) (y Int) (z Int)) Int)
   (v1
    ((x Int) (y Int) (z Int)) Int))
  ((ite (<= x 0) y (- (u1 (- x 1) y z) (v1 (- x 1) y z)))
   (ite (<= x 0) z (u1 (- x 1) y z))))
(define-fun
  j1
  () Int (+ 2 2))
(define-fun
  h1
  ((x Int)) Int (mod x (+ 2 (+ 2 2))))
(define-fun
  w1
  ((x Int)) Int (u1 (h1 x) 1 j1))
(define-fun
  g1
  ((x Int)) Int x)
(define-fun
  g0
  ((x Int)) Int x)
(define-fun
  fast
  ((x Int)) Int (- (mod (* 2 (w1 x)) (+ 1 (+ 2 (* 2 (+ 2 2))))) 1))
(define-fun
  f0
  ((x Int)) Int (+ 2 (* (+ 1 2) (mod x (+ 1 (+ 2 (+ 2 2)))))))
(define-fun-rec
  u0
  ((x Int) (y Int)) Int (ite (<= x 0) y (f0 (u0 (- x 1) y))))
(define-fun
  v0
  ((x Int)) Int (u0 x 2))
(define-fun
  small
  ((x Int)) Int (div (v0 x) 2))
(assert-not
  (forall ((c Int)) (or (not (>= c 0)) (= (small c) (fast c)))))
