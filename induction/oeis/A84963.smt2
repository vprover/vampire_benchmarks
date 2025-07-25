(define-funs-rec
  ((u3
    ((x Int) (y Int) (z Int)) Int)
   (v3
    ((x Int) (y Int) (z Int)) Int))
  ((ite (<= x 0) y (+ (u3 (- x 1) y z) (v3 (- x 1) y z)))
   (ite (<= x 0) z (u3 (- x 1) y z))))
(define-funs-rec
  ((u1
    ((x Int) (y Int) (z Int)) Int)
   (v1
    ((x Int) (y Int) (z Int)) Int))
  ((ite (<= x 0) y (+ (u1 (- x 1) y z) (v1 (- x 1) y z)))
   (ite (<= x 0) z (u1 (- x 1) y z))))
(define-fun
  w1
  ((x Int)) Int (u1 x 0 1))
(define-fun-rec
  u0
  ((x Int) (y Int)) Int (ite (<= x 0) y (w1 (u0 (- x 1) y))))
(define-fun
  h3
  ((x Int)) Int (- x 2))
(define-fun
  w3
  ((x Int)) Int (u3 (h3 x) 1 1))
(define-fun-rec
  u2
  ((x Int) (y Int)) Int (ite (<= x 0) y (w3 (u2 (- x 1) y))))
(define-fun
  h2
  () Int (+ 1 (+ 2 (+ 2 2))))
(define-fun
  v2
  ((x Int)) Int (u2 x h2))
(define-fun
  h1
  ((x Int)) Int x)
(define-fun
  h0
  () Int (+ 1 (+ 2 (+ 2 2))))
(define-fun
  v0
  ((x Int)) Int (u0 x h0))
(define-fun
  g3
  ((x Int)) Int x)
(define-fun
  g2
  ((x Int)) Int x)
(define-fun
  g1
  ((x Int)) Int x)
(define-fun
  g0
  ((x Int)) Int x)
(assert-not
  (forall ((c Int)) (or (not (>= c 0)) (= (v0 c) (v2 c)))))
