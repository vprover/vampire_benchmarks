(define-funs-rec
  ((u0
    ((x Int) (y Int) (z Int)) Int)
   (v0
    ((x Int) (y Int) (z Int)) Int))
  ((ite (<= x 0) y (- (u0 (- x 1) y z) (v0 (- x 1) y z)))
   (ite (<= x 0) z (u0 (- x 1) y z))))
(define-fun
  w0
  ((x Int)) Int (u0 x 1 2))
(define-fun
  small
  ((x Int)) Int (ite (<= (mod x 2) 0) (w0 x) 0))
(define-fun
  h1
  ((x Int)) Int x)
(define-fun
  h0
  ((x Int)) Int x)
(define-fun
  g2
  ((x Int)) Int (- (mod x (+ 1 2)) 1))
(define-fun
  g1
  ((x Int)) Int (- 1 (mod x 2)))
(define-fun
  g0
  ((x Int)) Int x)
(define-fun
  f2
  () Int (- 0 2))
(define-fun
  u2
  ((x Int) (y Int)) Int (ite (<= x 0) y f2))
(define-fun
  v2
  ((x Int)) Int (u2 (g2 x) 1))
(define-fun
  f1
  ((x Int)) Int (+ (v2 x) x))
(define-fun-rec
  u1
  ((x Int) (y Int)) Int (ite (<= x 0) y (f1 (u1 (- x 1) y))))
(define-fun
  v1
  ((x Int)) Int (u1 (g1 x) x))
(define-fun
  fast
  ((x Int)) Int (- (v1 x) x))
(assert-not
  (forall ((c Int)) (or (not (>= c 0)) (= (small c) (fast c)))))
