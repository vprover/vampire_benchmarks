(define-fun
  i3
  ((x Int)) Int (ite (<= x 0) 0 1))
(define-fun
  i0
  ((x Int)) Int (ite (<= x 0) 0 1))
(define-fun
  h4
  () Int (- (* 2 (* 2 (+ 2 (* 2 (+ 2 2))))) 1))
(define-fun
  h3
  ((x Int)) Int (- x 1))
(define-fun
  h0
  ((x Int)) Int (- x 1))
(define-fun
  g3
  ((x Int)) Int x)
(define-fun
  g0
  ((x Int)) Int x)
(define-fun
  f4
  ((x Int)) Int (* x x))
(define-fun-rec
  u4
  ((x Int) (y Int)) Int (ite (<= x 0) y (f4 (u4 (- x 1) y))))
(define-fun
  v4
  () Int (u4 1 h4))
(define-fun
  f3
  ((x Int) (y Int)) Int (- (* (+ 2 v4) x) y))
(define-funs-rec
  ((u3
    ((x Int) (y Int) (z Int)) Int)
   (v3
    ((x Int) (y Int) (z Int)) Int))
  ((ite (<= x 0) y (f3 (u3 (- x 1) y z) (v3 (- x 1) y z)))
   (ite (<= x 0) z (u3 (- x 1) y z))))
(define-fun
  w3
  ((x Int)) Int (u3 (h3 x) (i3 x) 0))
(define-fun
  f2
  ((x Int)) Int (+ 2 (* x x)))
(define-fun-rec
  u2
  ((x Int) (y Int)) Int (ite (<= x 0) y (f2 (u2 (- x 1) y))))
(define-fun
  v2
  () Int (u2 2 2))
(define-fun
  h1
  () Int (+ 1 v2))
(define-fun
  f1
  ((x Int)) Int (* x x))
(define-fun-rec
  u1
  ((x Int) (y Int)) Int (ite (<= x 0) y (f1 (u1 (- x 1) y))))
(define-fun
  v1
  () Int (u1 1 h1))
(define-fun
  f0
  ((x Int) (y Int)) Int (- (* (+ 2 v1) x) y))
(define-funs-rec
  ((u0
    ((x Int) (y Int) (z Int)) Int)
   (v0
    ((x Int) (y Int) (z Int)) Int))
  ((ite (<= x 0) y (f0 (u0 (- x 1) y z) (v0 (- x 1) y z)))
   (ite (<= x 0) z (u0 (- x 1) y z))))
(define-fun
  w0
  ((x Int)) Int (u0 (h0 x) (i0 x) 0))
(assert-not
  (forall ((c Int)) (or (not (>= c 0)) (= (w0 c) (w3 c)))))
