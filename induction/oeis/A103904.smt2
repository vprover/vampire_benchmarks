(define-fun
  v1
  ((x Int) (y Int) (z Int)) Int (ite (<= x 0) z 2))
(define-fun-rec
  u1
  ((x Int) (y Int) (z Int)) Int
  (ite (<= x 0) y (* (u1 (- x 1) y z) (v1 (- x 1) y z))))
(define-fun
  j1
  ((x Int)) Int x)
(define-fun
  i4
  ((x Int)) Int (ite (<= x 0) 1 2))
(define-fun
  h4
  ((x Int)) Int (- x 1))
(define-fun
  h1
  ((x Int)) Int (div x 2))
(define-fun
  w1
  ((x Int)) Int (u1 (h1 x) 1 x))
(define-fun-rec
  u0
  ((x Int) (y Int)) Int (ite (<= x 0) y (w1 (u0 (- x 1) y))))
(define-fun
  h0
  ((x Int)) Int (+ (* x x) x))
(define-fun
  v0
  ((x Int)) Int (u0 1 (h0 x)))
(define-fun
  g4
  ((x Int) (y Int)) Int (+ y y))
(define-funs-rec
  ((v4
    ((x Int) (y Int) (z Int)) Int)
   (u4
    ((x Int) (y Int) (z Int)) Int))
  ((ite (<= x 0) z (g4 (u4 (- x 1) y z) (v4 (- x 1) y z)))
   (ite (<= x 0) y (* (u4 (- x 1) y z) (v4 (- x 1) y z)))))
(define-fun
  w4
  ((x Int)) Int (u4 (h4 x) (i4 x) 1))
(define-fun
  g3
  ((x Int)) Int (- x 1))
(define-fun
  f3
  ((x Int)) Int (+ x x))
(define-fun-rec
  u3
  ((x Int) (y Int)) Int (ite (<= x 0) y (f3 (u3 (- x 1) y))))
(define-fun
  v3
  ((x Int)) Int (u3 (g3 x) 1))
(define-fun
  f2
  ((x Int)) Int (* x x))
(define-fun-rec
  u2
  ((x Int) (y Int)) Int (ite (<= x 0) y (f2 (u2 (- x 1) y))))
(define-fun
  v2
  ((x Int)) Int (u2 1 (v3 x)))
(define-fun
  fast
  ((x Int)) Int
  (* (* (v2 x) (ite (<= x 0) 1 (div (+ (* x x) x) 2))) (w4 x)))
(assert-not
  (forall ((c Int)) (or (not (>= c 0)) (= (v0 c) (fast c)))))
