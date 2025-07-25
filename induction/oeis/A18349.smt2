(define-fun
  j3
  ((x Int)) Int x)
(define-fun
  j2
  ((x Int)) Int x)
(define-fun
  h2
  ((x Int)) Int x)
(define-fun
  g3
  ((x Int)) Int (+ 2 x))
(define-funs-rec
  ((v3
    ((x Int) (y Int) (z Int)) Int)
   (u3
    ((x Int) (y Int) (z Int)) Int))
  ((ite (<= x 0) z (g3 (u3 (- x 1) y z)))
   (ite (<= x 0) y (v3 (- x 1) y z))))
(define-fun
  w3
  ((x Int) (y Int)) Int (u3 (+ x y) 2 x))
(define-fun
  g2
  ((x Int)) Int x)
(define-fun
  g0
  ((x Int)) Int x)
(define-fun
  f3
  ((x Int) (y Int)) Int y)
(define-fun
  f2
  ((x Int) (y Int)) Int (+ (+ (mod (div (w3 x y) 2) 2) x) x))
(define-funs-rec
  ((u2
    ((x Int) (y Int) (z Int)) Int)
   (v2
    ((x Int) (y Int) (z Int)) Int))
  ((ite (<= x 0) y (f2 (u2 (- x 1) y z) (v2 (- x 1) y z)))
   (ite (<= x 0) z (u2 (- x 1) y z))))
(define-fun
  w2
  ((x Int)) Int (u2 x 1 x))
(define-fun
  f1
  ((x Int) (y Int)) Int (- (* 2 (* (+ x y) x)) 2))
(define-fun-rec
  u1
  ((x Int) (y Int)) Int (ite (<= x 0) y (f1 (u1 (- x 1) y) x)))
(define-fun
  v1
  () Int (u1 2 2))
(define-fun
  f0
  ((x Int)) Int (mod v1 (+ 1 x)))
(define-fun-rec
  t0
  ((x Int)) Int (ite (<= (f0 x) 0) x (t0 (+ x 1))))
(define-fun-rec
  u0
  ((x Int)) Int (ite (<= x 0) (t0 0) (t0 (+ (u0 (- x 1)) 1))))
(define-fun
  small
  ((x Int)) Int (+ (u0 x) 1))
(assert-not
  (forall ((c Int)) (or (not (>= c 0)) (= (small c) (w2 c)))))
