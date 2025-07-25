(define-funs-rec
  ((u8
    ((x Int) (y Int) (z Int)) Int)
   (v8
    ((x Int) (y Int) (z Int)) Int))
  ((ite (<= x 0) y (+ (u8 (- x 1) y z) (v8 (- x 1) y z)))
   (ite (<= x 0) z (u8 (- x 1) y z))))
(define-fun
  w8
  ((x Int)) Int (u8 x 1 0))
(define-funs-rec
  ((u7
    ((x Int) (y Int) (z Int)) Int)
   (v7
    ((x Int) (y Int) (z Int)) Int))
  ((ite (<= x 0) y (+ (u7 (- x 1) y z) (v7 (- x 1) y z)))
   (ite (<= x 0) z (u7 (- x 1) y z))))
(define-fun
  w7
  ((x Int)) Int (u7 x 1 1))
(define-funs-rec
  ((u6
    ((x Int) (y Int) (z Int)) Int)
   (v6
    ((x Int) (y Int) (z Int)) Int))
  ((ite (<= x 0) y (+ (u6 (- x 1) y z) (v6 (- x 1) y z)))
   (ite (<= x 0) z (u6 (- x 1) y z))))
(define-fun
  w6
  ((x Int)) Int (u6 x 1 2))
(define-funs-rec
  ((u2
    ((x Int) (y Int) (z Int)) Int)
   (v2
    ((x Int) (y Int) (z Int)) Int))
  ((ite (<= x 0) y (+ (u2 (- x 1) y z) (v2 (- x 1) y z)))
   (ite (<= x 0) z (u2 (- x 1) y z))))
(define-fun
  w2
  ((x Int)) Int (u2 x 2 1))
(define-fun-rec
  u1
  ((x Int) (y Int)) Int (ite (<= x 0) y (* (u1 (- x 1) y) x)))
(define-fun
  v1
  ((x Int)) Int (u1 x 1))
(define-fun
  h8
  ((x Int)) Int x)
(define-fun
  h7
  ((x Int)) Int x)
(define-fun
  h6
  ((x Int)) Int x)
(define-fun
  h5
  ((x Int)) Int x)
(define-fun
  h4
  ((x Int)) Int x)
(define-fun
  h2
  ((x Int)) Int x)
(define-fun
  g8
  ((x Int)) Int x)
(define-fun
  g7
  ((x Int)) Int x)
(define-fun
  g6
  ((x Int)) Int x)
(define-fun
  g5
  ((x Int)) Int (mod (+ 1 x) 2))
(define-fun
  g4
  ((x Int)) Int (mod (+ 1 x) 2))
(define-fun
  g3
  ((x Int)) Int (+ 1 x))
(define-fun
  g2
  ((x Int)) Int x)
(define-fun
  g1
  ((x Int)) Int x)
(define-fun
  g0
  ((x Int)) Int (+ 1 x))
(define-fun
  f5
  ((x Int)) Int (mod (w6 x) (+ 1 x)))
(define-fun-rec
  u5
  ((x Int) (y Int)) Int (ite (<= x 0) y (f5 (u5 (- x 1) y))))
(define-fun
  v5
  ((x Int)) Int (u5 (g5 x) x))
(define-fun
  f4
  ((x Int)) Int (mod (- (v5 x) 1) (+ 1 x)))
(define-fun-rec
  u4
  ((x Int) (y Int)) Int (ite (<= x 0) y (f4 (u4 (- x 1) y))))
(define-fun
  v4
  ((x Int)) Int (u4 (g4 x) x))
(define-fun
  f3
  ((x Int)) Int (- (v4 x) 1))
(define-fun-rec
  t3
  ((x Int)) Int (ite (<= (f3 x) 0) x (t3 (+ x 1))))
(define-fun-rec
  u3
  ((x Int)) Int (ite (<= x 0) (t3 0) (t3 (+ (u3 (- x 1)) 1))))
(define-fun
  v3
  ((x Int)) Int (u3 (g3 x)))
(define-fun
  fast
  ((x Int)) Int (* (- (- (+ (v3 x) 1) (w7 x)) (w8 x)) (- 1 2)))
(define-fun
  f0
  ((x Int)) Int (mod (+ 1 (v1 x)) (+ 1 x)))
(define-fun-rec
  t0
  ((x Int)) Int (ite (<= (f0 x) 0) x (t0 (+ x 1))))
(define-fun-rec
  u0
  ((x Int)) Int (ite (<= x 0) (t0 0) (t0 (+ (u0 (- x 1)) 1))))
(define-fun
  v0
  ((x Int)) Int (u0 (g0 x)))
(define-fun
  small
  ((x Int)) Int (* (- (+ (v0 x) 1) (w2 x)) (- 1 2)))
(assert-not
  (forall ((c Int)) (or (not (>= c 0)) (= (small c) (fast c)))))
