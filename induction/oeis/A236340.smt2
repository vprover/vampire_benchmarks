(define-funs-rec
  ((u1
    ((x Int) (y Int) (z Int)) Int)
   (v1
    ((x Int) (y Int) (z Int)) Int))
  ((ite (<= x 0) y (v1 (- x 1) y z))
   (ite (<= x 0) z (+ (u1 (- x 1) y z) (v1 (- x 1) y z)))))
(define-fun
  h1
  ((x Int)) Int (- x 2))
(define-fun
  w1
  ((x Int)) Int (u1 (h1 x) 2 2))
(define-fun
  h0
  ((x Int)) Int x)
(define-fun
  fast
  ((x Int)) Int
  (div (+ (* (+ (- (w1 x) 1) (mod x 2)) 2) 1)
    (ite (<= (- x 1) 0) 2 1)))
(define-fun
  f1
  ((x Int) (y Int)) Int y)
(define-fun
  f0
  ((x Int) (y Int)) Int (+ (mod (+ (div y 2) x) 2) y))
(define-funs-rec
  ((u0
    ((x Int) (y Int) (z Int)) Int)
   (v0
    ((x Int) (y Int) (z Int)) Int))
  ((ite (<= x 0) y (f0 (u0 (- x 1) y z) (v0 (- x 1) y z)))
   (ite (<= x 0) z (+ (u0 (- x 1) y z) (v0 (- x 1) y z)))))
(define-fun
  w0
  ((x Int)) Int (u0 x 1 1))
(assert-not
  (forall ((c Int)) (or (not (>= c 0)) (= (w0 c) (fast c)))))
