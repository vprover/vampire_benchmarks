(define-funs-rec
  ((u10
    ((x Int) (y Int) (z Int)) Int)
   (v10
    ((x Int) (y Int) (z Int)) Int))
  ((ite (<= x 0) y (+ (u10 (- x 1) y z) (v10 (- x 1) y z)))
   (ite (<= x 0) z (u10 (- x 1) y z))))
(define-fun
  w10
  ((x Int)) Int (u10 x 1 2))
(define-fun
  h9
  ((x Int)) Int x)
(define-fun
  h7
  ((x Int)) Int (+ 2 x))
(define-fun
  h6
  ((x Int)) Int (+ 2 x))
(define-fun
  h5
  ((x Int)) Int (+ 2 x))
(define-fun
  h4
  ((x Int)) Int x)
(define-fun
  h2
  ((x Int)) Int (+ 2 x))
(define-fun
  h10
  ((x Int)) Int x)
(define-fun
  h1
  ((x Int)) Int (+ 2 x))
(define-fun
  h0
  ((x Int)) Int (+ 2 x))
(define-fun
  g9
  ((x Int)) Int (mod (+ 1 x) 2))
(define-fun
  g8
  ((x Int)) Int (+ 2 x))
(define-fun
  g4
  ((x Int)) Int x)
(define-fun
  g3
  ((x Int)) Int (+ 2 x))
(define-fun
  g10
  ((x Int)) Int x)
(define-fun
  f9
  ((x Int)) Int (mod (w10 x) (+ 1 x)))
(define-fun-rec
  u9
  ((x Int) (y Int)) Int (ite (<= x 0) y (f9 (u9 (- x 1) y))))
(define-fun
  v9
  ((x Int)) Int (u9 (g9 x) x))
(define-fun
  f8
  ((x Int)) Int (- (v9 x) 1))
(define-fun-rec
  t8
  ((x Int)) Int (ite (<= (f8 x) 0) x (t8 (+ x 1))))
(define-fun-rec
  u8
  ((x Int)) Int (ite (<= x 0) (t8 0) (t8 (+ (u8 (- x 1)) 1))))
(define-fun
  v8
  ((x Int)) Int (u8 (g8 x)))
(define-fun
  f7
  ((x Int)) Int (- (- (v8 x) 1) 2))
(define-fun-rec
  u7
  ((x Int) (y Int)) Int (ite (<= x 0) y (f7 (u7 (- x 1) y))))
(define-fun
  v7
  ((x Int)) Int (u7 1 (h7 x)))
(define-fun
  f6
  ((x Int)) Int (- (- (v7 x) 2) 2))
(define-fun-rec
  u6
  ((x Int) (y Int)) Int (ite (<= x 0) y (f6 (u6 (- x 1) y))))
(define-fun
  v6
  ((x Int)) Int (u6 1 (h6 x)))
(define-fun
  f5
  ((x Int)) Int (- (- (div (v6 x) 2) 2) 1))
(define-fun-rec
  u5
  ((x Int) (y Int)) Int (ite (<= x 0) y (f5 (u5 (- x 1) y))))
(define-fun
  v5
  ((x Int)) Int (u5 1 (h5 x)))
(define-fun
  fast
  ((x Int)) Int (- (v5 x) 2))
(define-fun
  f4
  ((x Int) (y Int)) Int (+ 1 (+ x y)))
(define-funs-rec
  ((u4
    ((x Int) (y Int) (z Int)) Int)
   (v4
    ((x Int) (y Int) (z Int)) Int))
  ((ite (<= x 0) y (f4 (u4 (- x 1) y z) (v4 (- x 1) y z)))
   (ite (<= x 0) z (u4 (- x 1) y z))))
(define-fun
  w4
  ((x Int)) Int (u4 x 0 1))
(define-fun
  f3
  ((x Int)) Int (mod (w4 x) (+ 1 x)))
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
  f2
  ((x Int)) Int (- (div (v3 x) 2) 2))
(define-fun-rec
  u2
  ((x Int) (y Int)) Int (ite (<= x 0) y (f2 (u2 (- x 1) y))))
(define-fun
  v2
  ((x Int)) Int (u2 1 (h2 x)))
(define-fun
  f1
  ((x Int)) Int (- (- (v2 x) 1) 2))
(define-fun-rec
  u1
  ((x Int) (y Int)) Int (ite (<= x 0) y (f1 (u1 (- x 1) y))))
(define-fun
  v1
  ((x Int)) Int (u1 1 (h1 x)))
(define-fun
  f0
  ((x Int)) Int (- (- (v1 x) 2) 2))
(define-fun-rec
  u0
  ((x Int) (y Int)) Int (ite (<= x 0) y (f0 (u0 (- x 1) y))))
(define-fun
  v0
  ((x Int)) Int (u0 1 (h0 x)))
(assert-not
  (forall ((c Int)) (or (not (>= c 0)) (= (v0 c) (fast c)))))
