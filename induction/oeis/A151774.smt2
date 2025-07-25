(define-fun
  j2
  ((x Int)) Int (div x 2))
(define-fun
  h2
  () Int (+ 2 (+ 2 2)))
(define-fun
  h1
  () Int (+ 1 2))
(define-fun
  h0
  ((x Int)) Int x)
(define-fun
  g2
  ((x Int) (y Int)) Int (div y 2))
(define-funs-rec
  ((v2
    ((x Int) (y Int) (z Int)) Int)
   (u2
    ((x Int) (y Int) (z Int)) Int))
  ((ite (<= x 0) z (g2 (u2 (- x 1) y z) (v2 (- x 1) y z)))
   (ite (<= x 0) y (- (u2 (- x 1) y z) (v2 (- x 1) y z)))))
(define-fun
  w2
  ((x Int)) Int (u2 h2 1 (j2 x)))
(define-fun
  g1
  ((x Int)) Int x)
(define-fun
  fast
  ((x Int)) Int
  (ite (<= (mod (- (* (+ (w2 x) x) 2) 1) (+ 1 (+ 2 2))) 0) 1 0))
(define-fun
  f1
  ((x Int) (y Int)) Int (mod (+ 2 x) y))
(define-fun-rec
  u1
  ((x Int) (y Int)) Int (ite (<= x 0) y (f1 (u1 (- x 1) y) x)))
(define-fun
  v1
  ((x Int)) Int (u1 x h1))
(define-fun-rec
  u0
  ((x Int) (y Int)) Int (ite (<= x 0) y (v1 (u0 (- x 1) y))))
(define-fun
  v0
  ((x Int)) Int (u0 2 x))
(define-fun
  small
  ((x Int)) Int (ite (<= (v0 x) 0) 1 0))
(assert-not
  (forall ((c Int)) (or (not (>= c 0)) (= (small c) (fast c)))))
