(define-funs-rec
  ((u0
    ((x Int) (y Int) (z Int)) Int)
   (v0
    ((x Int) (y Int) (z Int)) Int))
  ((ite (<= x 0) y (- (u0 (- x 1) y z) (v0 (- x 1) y z)))
   (ite (<= x 0) z (u0 (- x 1) y z))))
(define-fun
  h1
  ((x Int)) Int x)
(define-fun
  h0
  ((x Int)) Int (- x 1))
(define-fun
  w0
  ((x Int)) Int (u0 (h0 x) 1 0))
(define-fun
  small
  ((x Int)) Int
  (+ (+ (+ (+ (+ (+ (w0 x) x) x) (div (+ 1 x) (+ 1 2))) x) x) x))
(define-fun
  g1
  ((x Int)) Int (- (mod (- 0 x) (+ 2 (+ 2 2))) 2))
(define-fun
  g0
  ((x Int)) Int x)
(define-fun
  f1
  ((x Int)) Int (+ 1 x))
(define-fun-rec
  u1
  ((x Int) (y Int)) Int (ite (<= x 0) y (f1 (u1 (- x 1) y))))
(define-fun
  v1
  ((x Int)) Int (u1 (g1 x) x))
(define-fun
  fast
  ((x Int)) Int
  (+ (+ (* (+ (div (+ (v1 x) x) (+ 1 2)) x) 2) (ite (<= x 0) 1 x))
    x))
(assert-not
  (forall ((c Int)) (or (not (>= c 0)) (= (small c) (fast c)))))
