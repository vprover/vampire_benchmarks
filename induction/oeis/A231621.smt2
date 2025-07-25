(define-fun-rec
  u1
  ((x Int) (y Int)) Int (ite (<= x 0) y (+ (u1 (- x 1) y) x)))
(define-fun
  v1
  ((x Int)) Int (u1 x 0))
(define-fun
  j2
  ((x Int)) Int x)
(define-fun
  i2
  ((x Int)) Int (div (+ (* x x) x) 2))
(define-fun
  h3
  ((x Int)) Int (- x 2))
(define-fun
  g3
  ((x Int)) Int x)
(define-fun
  g2
  ((x Int)) Int (* x x))
(define-fun
  g1
  ((x Int)) Int x)
(define-fun
  f3
  ((x Int) (y Int)) Int (+ (div (* y y) (+ 1 x)) x))
(define-funs-rec
  ((u3
    ((x Int) (y Int) (z Int)) Int)
   (v3
    ((x Int) (y Int) (z Int)) Int))
  ((ite (<= x 0) y (f3 (u3 (- x 1) y z) (v3 (- x 1) y z)))
   (ite (<= x 0) z (u3 (- x 1) y z))))
(define-fun
  w3
  ((x Int)) Int (u3 (h3 x) 2 2))
(define-fun
  f2
  ((x Int)) Int (- (w3 x) 1))
(define-fun-rec
  u2
  ((x Int) (y Int) (z Int)) Int
  (ite (<= x 0) y (f2 (u2 (- x 1) y z))))
(define-fun
  v2
  ((x Int) (y Int) (z Int)) Int
  (ite (<= x 0) z (g2 (u2 (- x 1) y z))))
(define-fun
  w2
  ((x Int)) Int (u2 1 (i2 x) x))
(define-fun
  f0
  ((x Int) (y Int)) Int (div (+ (* y y) x) (+ x y)))
(define-funs-rec
  ((u0
    ((x Int) (y Int) (z Int)) Int)
   (v0
    ((x Int) (y Int) (z Int)) Int))
  ((ite (<= x 0) y (f0 (u0 (- x 1) y z) (v0 (- x 1) y z)))
   (ite (<= x 0) z (+ (u0 (- x 1) y z) (v0 (- x 1) y z)))))
(define-fun
  w0
  ((x Int)) Int (u0 (v1 x) 1 1))
(assert-not
  (forall ((c Int)) (or (not (>= c 0)) (= (w0 c) (w2 c)))))
