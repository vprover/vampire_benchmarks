(declare-sort sk 0)
(declare-sort fun1 0)
(declare-sort fun12 0)
(declare-sort fun13 0)
(declare-sort fun14 0)
(declare-sort fun15 0)
(declare-datatype list2 ((nil2) (cons2 (head2 Int) (tail2 list2))))
(declare-datatype list ((nil) (cons (head sk) (tail list))))
(declare-fun lam (Int) fun15)
(declare-const lam2 fun14)
(declare-fun lam3 (Int) fun15)
(declare-const lam4 fun14)
(declare-fun lam5 (Int) fun15)
(declare-const lam6 fun14)
(declare-fun lam7 (Int) fun15)
(declare-const lam8 fun14)
(declare-fun lam9 (Int) fun15)
(declare-const lam10 fun14)
(declare-fun lam11 (Int) fun15)
(declare-const lam12 fun14)
(declare-fun lam13 (Int) fun15)
(declare-const lam14 fun14)
(declare-fun lam15 (Int) fun15)
(declare-const lam16 fun14)
(declare-fun apply1 (fun1 sk) sk)
(declare-fun apply12 (fun12 sk) fun13)
(declare-fun apply13 (fun13 sk) Bool)
(declare-fun apply14 (fun14 Int) fun15)
(declare-fun apply15 (fun15 Int) Bool)
(define-fun-rec
  ssort-minimum1
  ((x Int) (y list2)) Int
  (match y
    ((nil2 x)
     ((cons2 y1 ys1)
      (ite (<= y1 x) (ssort-minimum1 y1 ys1) (ssort-minimum1 x ys1))))))
(define-fun-rec
  ordered
  ((x list2)) Bool
  (match x
    ((nil2 true)
     ((cons2 y z)
      (match z
        ((nil2 true)
         ((cons2 y2 xs) (and (<= y y2) (ordered (cons2 y2 xs))))))))))
(define-fun-rec
  deleteBy2
  ((x fun12) (y sk) (z list)) list
  (match z
    ((nil nil)
     ((cons y2 ys)
      (ite
        (apply13 (apply12 x y) y2) ys (cons y2 (deleteBy2 x y ys)))))))
(define-fun-rec
  deleteBy
  ((x fun14) (y Int) (z list2)) list2
  (match z
    ((nil2 nil2)
     ((cons2 y2 ys)
      (ite
        (apply15 (apply14 x y) y2) ys (cons2 y2 (deleteBy x y ys)))))))
(define-fun-rec
  ssort
  ((x list2)) list2
  (match x
    ((nil2 nil2)
     ((cons2 y ys)
      (let ((m (ssort-minimum1 y ys)))
        (cons2 m (ssort (deleteBy lam2 m (cons2 y ys)))))))))
(assert (forall ((z Int)) (= (apply14 lam2 z) (lam z))))
(assert
  (forall ((z Int) (x2 Int)) (= (apply15 (lam z) x2) (= z x2))))
(assert (forall ((z Int)) (= (apply14 lam4 z) (lam3 z))))
(assert
  (forall ((z Int) (x2 Int)) (= (apply15 (lam3 z) x2) (<= z x2))))
(assert (forall ((x2 Int)) (= (apply14 lam6 x2) (lam5 x2))))
(assert
  (forall ((x2 Int) (x3 Int)) (= (apply15 (lam5 x2) x3) (<= x2 x3))))
(assert (forall ((x2 Int)) (= (apply14 lam8 x2) (lam7 x2))))
(assert
  (forall ((x2 Int) (x3 Int)) (= (apply15 (lam7 x2) x3) (<= x2 x3))))
(assert (forall ((x4 Int)) (= (apply14 lam10 x4) (lam9 x4))))
(assert
  (forall ((x4 Int) (x5 Int)) (= (apply15 (lam9 x4) x5) (<= x4 x5))))
(assert (forall ((z Int)) (= (apply14 lam12 z) (lam11 z))))
(assert
  (forall ((z Int) (x2 Int)) (= (apply15 (lam11 z) x2) (<= z x2))))
(assert (forall ((x2 Int)) (= (apply14 lam14 x2) (lam13 x2))))
(assert
  (forall ((x2 Int) (x3 Int))
    (= (apply15 (lam13 x2) x3) (<= x2 x3))))
(assert (forall ((z Int)) (= (apply14 lam16 z) (lam15 z))))
(assert
  (forall ((z Int) (x2 Int)) (= (apply15 (lam15 z) x2) (<= z x2))))
(assert-not (forall ((xs list2)) (ordered (ssort xs))))
(assert-claim (ordered nil2))
(assert-claim
  (forall ((x list2)) (=> (ordered x) (= (ssort x) x))))
(assert-claim (forall ((x list2)) (ordered (ssort x))))
(assert-claim (forall ((x Int)) (= (ssort-minimum1 x nil2) x)))
(assert-claim
  (forall ((y fun12) (z sk)) (= (deleteBy2 y z nil) nil)))
(assert-claim
  (forall ((x Int) (y list2))
    (= (ssort-minimum1 x (ssort y)) (ssort-minimum1 x y))))
(assert-claim (forall ((x Int)) (ordered (cons2 x nil2))))
(assert-claim
  (forall ((x Int) (y list2))
    (=> (ordered y)
      (= (ordered (cons2 x y)) (<= x (ssort-minimum1 x y))))))
(assert-claim
  (forall ((x Int) (y Int) (z list2))
    (=> (<= y x)
      (= (<= y (ssort-minimum1 x z)) (<= y (ssort-minimum1 y z))))))
(assert-claim
  (forall ((x list2) (y Int)) (<= (ssort-minimum1 y x) y)))
(assert-claim
  (forall ((x Int) (y list2) (z Int))
    (=> (<= x z) (<= (ssort-minimum1 x y) z))))
(assert-claim
  (forall ((x fun14) (y Int) (z list2))
    (=> (ordered z) (ordered (deleteBy x y z)))))
(assert-claim
  (forall ((x Int) (y Int) (z list2))
    (= (ssort-minimum1 y (cons2 x z)) (ssort-minimum1 x (cons2 y z)))))
(assert-claim
  (forall ((x Int) (y list2))
    (= (ssort-minimum1 x (cons2 x y)) (ssort-minimum1 x y))))
(assert-claim
  (forall ((x Int) (y Int) (z list2))
    (=> (<= y x)
      (= (ssort-minimum1 y (cons2 x z)) (ssort-minimum1 y z)))))
(assert-claim
  (forall ((x Int) (y list2) (z list2))
    (= (ssort-minimum1 (ssort-minimum1 x z) y)
      (ssort-minimum1 (ssort-minimum1 x y) z))))
(assert-claim
  (forall ((x Int) (y list2))
    (= (ssort-minimum1 (ssort-minimum1 x y) y) (ssort-minimum1 x y))))
(assert-claim
  (forall ((x Int) (y list2))
    (= (ssort (cons2 x (ssort y))) (ssort (cons2 x y)))))
(assert-claim
  (forall ((x Int) (y list2))
    (= (ordered (cons2 x (cons2 x y))) (ordered (cons2 x y)))))
(assert-claim
  (forall ((x Int) (y Int) (z list2))
    (=> (<= x y)
      (= (ordered (cons2 x (cons2 y z))) (ordered (cons2 y z))))))
(assert-claim
  (forall ((x Int) (y list2))
    (= (ordered (cons2 (ssort-minimum1 x y) y)) (ordered y))))
(assert-claim
  (forall ((x Int) (y Int) (z Int) (x2 list2))
    (=> (<= z x)
      (= (ssort (cons2 z (cons2 y x2)))
        (ssort (cons2 y (cons2 z x2)))))))
(assert-claim
  (forall ((x Int) (y list2))
    (= (ssort (cons2 (ssort-minimum1 x y) y))
      (cons2 (ssort-minimum1 x y) (ssort y)))))
(assert-claim
  (forall ((x Int) (y Int))
    (= (ordered (cons2 x (cons2 y nil2))) (<= x y))))
(assert-claim
  (forall ((x Int))
    (= (ssort (cons2 x (cons2 x nil2))) (cons2 x (cons2 x nil2)))))
(assert-claim
  (forall ((x Int) (y Int))
    (=> (<= x y)
      (= (ssort (cons2 x (cons2 y nil2))) (cons2 x (cons2 y nil2))))))
(assert-claim
  (forall ((x Int) (y list2)) (= (deleteBy lam4 x (cons2 x y)) y)))
(assert-claim
  (forall ((x Int) (y Int) (z list2))
    (=> (<= x y) (= (deleteBy lam6 x (cons2 y z)) z))))
(assert-claim
  (forall ((x Int) (y Int) (z list2))
    (= (deleteBy lam8 (ssort-minimum1 x z) z)
      (deleteBy lam10 (ssort-minimum1 y z) z))))
(assert-claim
  (forall ((x Int) (y list2))
    (= (ssort-minimum1 x (deleteBy lam12 x y)) (ssort-minimum1 x y))))
(assert-claim
  (forall ((x Int) (y Int) (z list2))
    (=> (<= y x)
      (= (ssort-minimum1 y (deleteBy lam14 x z)) (ssort-minimum1 y z)))))
(assert-claim
  (forall ((x Int) (y Int) (z list2))
    (= (<= x (ssort-minimum1 x (cons2 y z)))
      (<= x (ssort-minimum1 y z)))))
(assert-claim
  (forall ((x Int) (y list2) (z Int))
    (= (<= (ssort-minimum1 x y) (ssort-minimum1 z y))
      (<= (ssort-minimum1 x y) z))))
(assert-claim
  (forall ((x Int) (y Int) (z list2) (x2 list2))
    (= (ssort-minimum1 x (cons2 (ssort-minimum1 y x2) z))
      (ssort-minimum1 x (cons2 (ssort-minimum1 y z) x2)))))
(assert-claim
  (forall ((x Int) (y list2))
    (= (deleteBy lam16 x (ssort (cons2 x y))) (ssort y))))
