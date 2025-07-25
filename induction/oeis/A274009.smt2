(define-fun
  j3
  ((x Int)) Int (div x 2))
(define-fun
  j0
  ((x Int)) Int x)
(define-fun
  i3
  ((x Int)) Int x)
(define-fun
  h3
  () Int (+ 1 (+ 2 2)))
(define-fun
  h2
  ((x Int)) Int (div x 2))
(define-fun
  h0
  ((x Int)) Int x)
(define-fun
  g3
  ((x Int) (y Int)) Int (div y 2))
(define-funs-rec
  ((v3
    ((x Int) (y Int) (z Int)) Int)
   (u3
    ((x Int) (y Int) (z Int)) Int))
  ((ite (<= x 0) z (g3 (u3 (- x 1) y z) (v3 (- x 1) y z)))
   (ite (<= x 0) y (- (u3 (- x 1) y z) (v3 (- x 1) y z)))))
(define-fun
  w3
  ((x Int)) Int (u3 h3 x (j3 x)))
(define-fun-rec
  u2
  ((x Int) (y Int)) Int (ite (<= x 0) y (w3 (u2 (- x 1) y))))
(define-fun
  v2
  ((x Int)) Int (u2 1 (h2 x)))
(define-fun
  g1
  ((x Int)) Int x)
(define-fun
  g0
  ((x Int) (y Int)) Int (div y 2))
(define-fun
  fast
  ((x Int)) Int (+ (- (v2 x) (mod x 2)) 1))
(define-fun
  f1
  ((x Int)) Int (- 0 x))
(define-fun-rec
  u1
  ((x Int) (y Int)) Int (ite (<= x 0) y (f1 (u1 (- x 1) y))))
(define-fun
  v1
  ((x Int)) Int (u1 x 1))
(define-fun
  f0
  ((x Int) (y Int)) Int (+ 2 (- x y)))
(define-funs-rec
  ((u0
    ((x Int) (y Int) (z Int)) Int)
   (v0
    ((x Int) (y Int) (z Int)) Int))
  ((ite (<= x 0) y (f0 (u0 (- x 1) y z) (v0 (- x 1) y z)))
   (ite (<= x 0) z (g0 (u0 (- x 1) y z) (v0 (- x 1) y z)))))
(define-fun
  w0
  ((x Int)) Int (u0 x (v1 x) x))
(assert-not
  (forall ((c Int)) (or (not (>= c 0)) (= (w0 c) (fast c)))))
