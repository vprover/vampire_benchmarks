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
  insert2
  ((x Int) (y list2)) list2
  (match y
    ((nil2 (cons2 x nil2))
     ((cons2 z xs)
      (ite (<= x z) (cons2 x (cons2 z xs)) (cons2 z (insert2 x xs)))))))
(define-fun-rec
  isort
  ((x list2)) list2
  (match x
    ((nil2 nil2)
     ((cons2 y xs) (insert2 y (isort xs))))))
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
(assert (forall ((z Int)) (= (apply14 lam6 z) (lam5 z))))
(assert
  (forall ((z Int) (x2 Int)) (= (apply15 (lam5 z) x2) (<= z x2))))
(assert (forall ((x2 Int)) (= (apply14 lam8 x2) (lam7 x2))))
(assert
  (forall ((x2 Int) (x3 Int)) (= (apply15 (lam7 x2) x3) (<= x2 x3))))
(assert (forall ((x2 Int)) (= (apply14 lam10 x2) (lam9 x2))))
(assert
  (forall ((x2 Int) (x3 Int)) (= (apply15 (lam9 x2) x3) (<= x2 x3))))
(assert (forall ((x4 Int)) (= (apply14 lam12 x4) (lam11 x4))))
(assert
  (forall ((x4 Int) (x5 Int))
    (= (apply15 (lam11 x4) x5) (<= x4 x5))))
(assert (forall ((z Int)) (= (apply14 lam14 z) (lam13 z))))
(assert
  (forall ((z Int) (x2 Int)) (= (apply15 (lam13 z) x2) (<= z x2))))
(assert (forall ((x2 Int)) (= (apply14 lam16 x2) (lam15 x2))))
(assert
  (forall ((x2 Int) (x3 Int))
    (= (apply15 (lam15 x2) x3) (<= x2 x3))))
(assert-not (forall ((xs list2)) (= (ssort xs) (isort xs))))
(assert-claim (= (isort nil2) nil2))
(assert-claim (forall ((x list2)) (= (isort x) (ssort x))))
(assert-claim
  (forall ((x Int)) (= (insert2 x nil2) (cons2 x nil2))))
(assert-claim (forall ((x list2)) (= (isort (isort x)) (isort x))))
(assert-claim (forall ((x Int)) (= (ssort-minimum1 x nil2) x)))
(assert-claim
  (forall ((y fun12) (z sk)) (= (deleteBy2 y z nil) nil)))
(assert-claim
  (forall ((x Int) (y list2))
    (= (isort (cons2 x y)) (insert2 x (isort y)))))
(assert-claim
  (forall ((x Int) (y list2))
    (= (isort (insert2 x y)) (insert2 x (isort y)))))
(assert-claim
  (forall ((x Int) (y list2))
    (= (ssort-minimum1 x (isort y)) (ssort-minimum1 x y))))
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
  (forall ((x Int) (y list2))
    (= (insert2 x (cons2 x y)) (cons2 x (cons2 x y)))))
(assert-claim
  (forall ((x Int) (y Int) (z list2))
    (= (insert2 y (insert2 x z)) (insert2 x (insert2 y z)))))
(assert-claim
  (forall ((x Int) (y Int) (z list2))
    (=> (<= x y) (= (insert2 x (cons2 y z)) (cons2 x (cons2 y z))))))
(assert-claim
  (forall ((x Int) (y list2))
    (= (insert2 (ssort-minimum1 x y) y)
      (cons2 (ssort-minimum1 x y) y))))
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
  (forall ((x fun14) (y Int) (z list2))
    (= (isort (deleteBy x y (isort z))) (deleteBy x y (isort z)))))
(assert-claim
  (forall ((x Int) (y list2)) (= (deleteBy lam4 x (cons2 x y)) y)))
(assert-claim
  (forall ((x Int) (y list2)) (= (deleteBy lam6 x (insert2 x y)) y)))
(assert-claim
  (forall ((x Int) (y Int) (z list2))
    (=> (<= x y) (= (deleteBy lam8 x (cons2 y z)) z))))
(assert-claim
  (forall ((x Int) (y Int) (z list2))
    (= (deleteBy lam10 (ssort-minimum1 x z) z)
      (deleteBy lam12 (ssort-minimum1 y z) z))))
(assert-claim
  (forall ((x Int) (y list2))
    (= (ssort-minimum1 x (deleteBy lam14 x y)) (ssort-minimum1 x y))))
(assert-claim
  (forall ((x Int) (y Int) (z list2))
    (=> (<= y x)
      (= (ssort-minimum1 y (deleteBy lam16 x z)) (ssort-minimum1 y z)))))
(assert-claim
  (forall ((x Int) (y Int) (z list2))
    (= (<= x (ssort-minimum1 x (cons2 y z)))
      (<= x (ssort-minimum1 y z)))))
(assert-claim
  (forall ((x Int) (y list2) (z Int))
    (= (<= (ssort-minimum1 x y) (ssort-minimum1 z y))
      (<= (ssort-minimum1 x y) z))))
(assert-claim
  (forall ((x Int) (y list2))
    (= (insert2 x (cons2 (ssort-minimum1 x y) y))
      (cons2 (ssort-minimum1 x y) (insert2 x y)))))
(assert-claim
  (forall ((x Int) (y Int) (z list2))
    (= (insert2 (ssort-minimum1 x (cons2 y z)) z)
      (cons2 (ssort-minimum1 x (cons2 y z)) z))))
(assert-claim
  (forall ((x Int) (y Int) (z Int) (x2 list2))
    (= (ssort-minimum1 x (cons2 z (cons2 y x2)))
      (ssort-minimum1 x (cons2 y (cons2 z x2))))))
(assert-claim
  (forall ((x Int) (y Int) (z Int) (x2 list2))
    (= (ssort-minimum1 x (cons2 y (insert2 z x2)))
      (ssort-minimum1 x (cons2 y (cons2 z x2))))))
(assert-claim
  (forall ((x Int) (y Int) (z list2) (x2 list2))
    (= (ssort-minimum1 x (cons2 (ssort-minimum1 y x2) z))
      (ssort-minimum1 x (cons2 (ssort-minimum1 y z) x2)))))
(assert-claim
  (forall ((x fun14) (y Int) (z Int))
    (= (isort (deleteBy x y (cons2 z nil2)))
      (deleteBy x y (cons2 z nil2)))))
