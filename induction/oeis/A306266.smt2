(define-fun-rec
  u5
  ((x Int) (y Int)) Int (ite (<= x 0) y (* (u5 (- x 1) y) x)))
(define-fun
  v5
  ((x Int)) Int (u5 x 1))
(define-fun-rec
  u3
  ((x Int) (y Int)) Int (ite (<= x 0) y (* (u3 (- x 1) y) x)))
(define-fun-rec
  u2
  ((x Int) (y Int)) Int (ite (<= x 0) y (* (u2 (- x 1) y) x)))
(define-fun
  v2
  ((x Int)) Int (u2 x 1))
(define-fun
  h6
  ((x Int)) Int x)
(define-fun
  h3
  ((x Int)) Int (+ 1 x))
(define-fun
  v3
  ((x Int)) Int (u3 x (h3 x)))
(define-fun
  h1
  ((x Int) (y Int)) Int y)
(define-fun
  g6
  ((x Int) (y Int)) Int (+ 2 y))
(define-funs-rec
  ((v6
    ((x Int) (y Int) (z Int)) Int)
   (u6
    ((x Int) (y Int) (z Int)) Int))
  ((ite (<= x 0) z (g6 (u6 (- x 1) y z) (v6 (- x 1) y z)))
   (ite (<= x 0) y (* (u6 (- x 1) y z) (v6 (- x 1) y z)))))
(define-fun
  w6
  ((x Int)) Int (u6 x 1 1))
(define-fun
  g5
  ((x Int)) Int x)
(define-fun
  g4
  ((x Int)) Int x)
(define-fun
  g3
  ((x Int)) Int x)
(define-fun
  g2
  ((x Int)) Int x)
(define-fun
  g0
  ((x Int)) Int x)
(define-fun
  f4
  ((x Int)) Int (+ x x))
(define-fun-rec
  u4
  ((x Int) (y Int)) Int (ite (<= x 0) y (f4 (u4 (- x 1) y))))
(define-fun
  v4
  ((x Int)) Int (u4 x 1))
(define-fun
  fast
  ((x Int)) Int
  (* (* (* (div (* (v2 x) (v3 x)) (v4 x)) (v5 x)) (+ 1 x)) (w6 x)))
(define-fun
  f1
  ((x Int)) Int (* (* (+ (- x 1) x) (div (+ (* x x) x) 2)) (+ 1 x)))
(define-fun-rec
  u1
  ((x Int) (y Int)) Int (ite (<= x 0) y (f1 (u1 (- x 1) y))))
(define-fun
  v1
  ((x Int) (y Int)) Int (u1 1 y))
(define-fun
  f0
  ((x Int) (y Int)) Int (* (v1 x y) x))
(define-fun-rec
  u0
  ((x Int) (y Int)) Int (ite (<= x 0) y (f0 (u0 (- x 1) y) x)))
(define-fun
  v0
  ((x Int)) Int (u0 x 1))
(assert-not
  (forall ((c Int)) (or (not (>= c 0)) (= (v0 c) (fast c)))))
