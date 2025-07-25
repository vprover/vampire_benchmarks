(define-fun
  j0
  ((x Int)) Int x)
(define-fun
  h2
  ((x Int)) Int x)
(define-fun
  h1
  ((x Int)) Int x)
(define-fun
  h0
  ((x Int)) Int x)
(define-fun
  g2
  () Int (+ 1 (+ 2 2)))
(define-fun
  g0
  ((x Int) (y Int)) Int (div y (- 2 (mod x 2))))
(define-fun
  f2
  ((x Int)) Int (div (ite (<= (mod x 2) 0) (+ 2 (+ 2 2)) x) 2))
(define-fun-rec
  u2
  ((x Int) (y Int)) Int (ite (<= x 0) y (f2 (u2 (- x 1) y))))
(define-fun
  v2
  ((x Int)) Int (u2 g2 x))
(define-fun-rec
  u1
  ((x Int) (y Int)) Int (ite (<= x 0) y (v2 (u1 (- x 1) y))))
(define-fun
  v1
  ((x Int)) Int (u1 2 x))
(define-fun
  fast
  ((x Int)) Int (* (+ (div (+ (v1 x) 1) 2) 1) (mod x 2)))
(define-fun
  f0
  ((x Int) (y Int)) Int (+ (mod y 2) x))
(define-funs-rec
  ((u0
    ((x Int) (y Int) (z Int)) Int)
   (v0
    ((x Int) (y Int) (z Int)) Int))
  ((ite (<= x 0) y (f0 (u0 (- x 1) y z) (v0 (- x 1) y z)))
   (ite (<= x 0) z (g0 (u0 (- x 1) y z) (v0 (- x 1) y z)))))
(define-fun
  w0
  ((x Int)) Int (u0 x 1 x))
(define-fun
  small
  ((x Int)) Int
  (* (+ (mod (- (div (w0 x) 2) 1) (+ 1 2)) 1) (mod x 2)))
(assert-not
  (forall ((c Int)) (or (not (>= c 0)) (= (small c) (fast c)))))
