(define-fun
  j6
  ((x Int)) Int x)
(define-fun
  j2
  ((x Int)) Int x)
(define-fun
  h7
  ((x Int) (y Int)) Int y)
(define-fun
  h6
  ((x Int)) Int x)
(define-fun
  h4
  ((x Int)) Int x)
(define-fun
  h3
  ((x Int) (y Int)) Int y)
(define-fun
  h2
  ((x Int)) Int x)
(define-fun
  h0
  ((x Int)) Int x)
(define-fun
  g6
  ((x Int) (y Int)) Int (div y 2))
(define-fun
  g5
  ((x Int)) Int x)
(define-fun
  g4
  ((x Int)) Int (- 2 (mod x 2)))
(define-fun
  g2
  ((x Int) (y Int)) Int (div y 2))
(define-fun
  g1
  ((x Int)) Int x)
(define-fun
  f7
  ((x Int)) Int (ite (<= (mod (+ 1 x) (* 2 (+ 2 2))) 0) 1 0))
(define-fun-rec
  u7
  ((x Int) (y Int)) Int (ite (<= x 0) y (f7 (u7 (- x 1) y))))
(define-fun
  v7
  ((x Int) (y Int)) Int (u7 1 y))
(define-fun
  f6
  ((x Int) (y Int)) Int (+ (v7 x y) x))
(define-funs-rec
  ((u6
    ((x Int) (y Int) (z Int)) Int)
   (v6
    ((x Int) (y Int) (z Int)) Int))
  ((ite (<= x 0) y (f6 (u6 (- x 1) y z) (v6 (- x 1) y z)))
   (ite (<= x 0) z (g6 (u6 (- x 1) y z) (v6 (- x 1) y z)))))
(define-fun
  w6
  ((x Int)) Int (u6 x 0 x))
(define-fun-rec
  t5
  ((x Int)) Int (ite (<= (w6 x) 0) x (t5 (+ x 1))))
(define-fun-rec
  u5
  ((x Int)) Int (ite (<= x 0) (t5 0) (t5 (+ (u5 (- x 1)) 1))))
(define-fun
  f4
  ((x Int)) Int (+ (mod (u5 x) 2) x))
(define-fun-rec
  u4
  ((x Int) (y Int)) Int (ite (<= x 0) y (f4 (u4 (- x 1) y))))
(define-fun
  v4
  ((x Int)) Int (u4 (g4 x) x))
(define-fun
  fast
  ((x Int)) Int (mod (+ (- (v4 x) x) 1) 2))
(define-fun
  f3
  ((x Int)) Int (ite (<= (mod (+ 1 x) (* 2 (+ 2 2))) 0) 1 0))
(define-fun-rec
  u3
  ((x Int) (y Int)) Int (ite (<= x 0) y (f3 (u3 (- x 1) y))))
(define-fun
  v3
  ((x Int) (y Int)) Int (u3 1 y))
(define-fun
  f2
  ((x Int) (y Int)) Int (+ (v3 x y) x))
(define-funs-rec
  ((u2
    ((x Int) (y Int) (z Int)) Int)
   (v2
    ((x Int) (y Int) (z Int)) Int))
  ((ite (<= x 0) y (f2 (u2 (- x 1) y z) (v2 (- x 1) y z)))
   (ite (<= x 0) z (g2 (u2 (- x 1) y z) (v2 (- x 1) y z)))))
(define-fun
  w2
  ((x Int)) Int (u2 x 0 x))
(define-fun-rec
  t1
  ((x Int)) Int (ite (<= (w2 x) 0) x (t1 (+ x 1))))
(define-fun-rec
  u1
  ((x Int)) Int (ite (<= x 0) (t1 0) (t1 (+ (u1 (- x 1)) 1))))
(define-fun
  f0
  ((x Int)) Int (+ (mod (u1 x) 2) x))
(define-fun-rec
  u0
  ((x Int) (y Int)) Int (ite (<= x 0) y (f0 (u0 (- x 1) y))))
(define-fun
  v0
  ((x Int)) Int (u0 2 x))
(define-fun
  small
  ((x Int)) Int (ite (<= (- (v0 x) x) 0) 1 0))
(assert-not
  (forall ((c Int)) (or (not (>= c 0)) (= (small c) (fast c)))))
