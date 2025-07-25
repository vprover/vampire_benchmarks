(declare-sort sk 0)
(declare-sort fun1 0)
(declare-sort fun12 0)
(declare-sort fun13 0)
(declare-datatype list2 ((nil2) (cons2 (head2 Int) (tail2 list2))))
(declare-datatype list ((nil) (cons (head sk) (tail list))))
(declare-fun lam (Int) fun13)
(declare-fun lam2 (Int) fun13)
(declare-fun lam3 (Int) fun13)
(declare-fun lam4 (Int) fun13)
(declare-fun lam5 (Int) fun13)
(declare-fun lam6 (Int) fun13)
(declare-fun lam7 (Int) fun13)
(declare-fun lam8 (Int) fun13)
(declare-fun lam9 (Int) fun13)
(declare-fun lam10 (Int) fun13)
(declare-fun lam11 (Int) fun13)
(declare-fun lam12 (Int) fun13)
(declare-fun lam13 (Int) fun13)
(declare-fun lam14 (Int) fun13)
(declare-fun lam15 (Int) fun13)
(declare-fun lam16 (Int) fun13)
(declare-fun lam17 (Int) fun13)
(declare-fun lam18 (Int) fun13)
(declare-fun lam19 (Int) fun13)
(declare-fun lam20 (Int) fun13)
(declare-fun lam21 (Int) fun13)
(declare-fun lam22 (Int) fun13)
(declare-fun lam23 (Int) fun13)
(declare-fun lam24 (Int) fun13)
(declare-fun lam25 (Int) fun13)
(declare-fun lam26 (Int) fun13)
(declare-fun lam27 (Int) fun13)
(declare-fun lam28 (Int) fun13)
(declare-fun lam29 (Int) fun13)
(declare-fun lam30 (Int) fun13)
(declare-fun apply1 (fun1 sk) sk)
(declare-fun apply12 (fun12 sk) Bool)
(declare-fun apply13 (fun13 Int) Bool)
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
  filter2
  ((p fun12) (x list)) list
  (match x
    ((nil nil)
     ((cons y xs)
      (ite (apply12 p y) (cons y (filter2 p xs)) (filter2 p xs))))))
(define-fun-rec
  filter
  ((p fun13) (x list2)) list2
  (match x
    ((nil2 nil2)
     ((cons2 y xs)
      (ite (apply13 p y) (cons2 y (filter p xs)) (filter p xs))))))
(define-fun-rec
  ++2
  ((x list) (y list)) list
  (match x
    ((nil y)
     ((cons z xs) (cons z (++2 xs y))))))
(define-fun-rec
  ++
  ((x list2) (y list2)) list2
  (match x
    ((nil2 y)
     ((cons2 z xs) (cons2 z (++ xs y))))))
(define-fun-rec
  qsort
  ((x list2)) list2
  (match x
    ((nil2 nil2)
     ((cons2 y xs)
      (++ (qsort (filter (lam y) xs))
        (++ (cons2 y nil2) (qsort (filter (lam2 y) xs))))))))
(assert
  (forall ((y Int) (z Int)) (= (apply13 (lam y) z) (<= z y))))
(assert
  (forall ((y Int) (x2 Int)) (= (apply13 (lam2 y) x2) (> x2 y))))
(assert
  (forall ((x Int) (z Int)) (= (apply13 (lam3 x) z) (<= x z))))
(assert
  (forall ((x Int) (x2 Int)) (= (apply13 (lam4 x) x2) (<= x x2))))
(assert
  (forall ((x Int) (z Int)) (= (apply13 (lam5 x) z) (<= x z))))
(assert
  (forall ((x Int) (x2 Int)) (= (apply13 (lam6 x) x2) (<= x x2))))
(assert
  (forall ((y Int) (x2 Int)) (= (apply13 (lam7 y) x2) (<= y x2))))
(assert
  (forall ((y Int) (x3 Int)) (= (apply13 (lam8 y) x3) (<= y x3))))
(assert
  (forall ((x Int) (x2 Int)) (= (apply13 (lam9 x) x2) (<= x x2))))
(assert
  (forall ((x Int) (x3 Int)) (= (apply13 (lam10 x) x3) (<= x x3))))
(assert
  (forall ((y Int) (x2 Int)) (= (apply13 (lam11 y) x2) (<= y x2))))
(assert
  (forall ((y Int) (x3 Int)) (= (apply13 (lam12 y) x3) (<= y x3))))
(assert
  (forall ((x Int) (z Int)) (= (apply13 (lam13 x) z) (> x z))))
(assert
  (forall ((x Int) (x2 Int)) (= (apply13 (lam14 x) x2) (> x x2))))
(assert
  (forall ((x Int) (z Int)) (= (apply13 (lam15 x) z) (> x z))))
(assert
  (forall ((x Int) (x2 Int)) (= (apply13 (lam16 x) x2) (> x x2))))
(assert
  (forall ((y Int) (x2 Int)) (= (apply13 (lam17 y) x2) (> y x2))))
(assert
  (forall ((y Int) (x3 Int)) (= (apply13 (lam18 y) x3) (> y x3))))
(assert
  (forall ((y Int) (x2 Int)) (= (apply13 (lam19 y) x2) (> y x2))))
(assert
  (forall ((y Int) (x3 Int)) (= (apply13 (lam20 y) x3) (> y x3))))
(assert
  (forall ((y Int) (x2 Int)) (= (apply13 (lam21 y) x2) (> y x2))))
(assert
  (forall ((y Int) (x3 Int)) (= (apply13 (lam22 y) x3) (> y x3))))
(assert
  (forall ((x Int) (z Int)) (= (apply13 (lam23 x) z) (<= x z))))
(assert
  (forall ((x Int) (x2 Int)) (= (apply13 (lam24 x) x2) (<= x x2))))
(assert
  (forall ((y Int) (x2 Int)) (= (apply13 (lam25 y) x2) (<= y x2))))
(assert
  (forall ((y Int) (x3 Int)) (= (apply13 (lam26 y) x3) (<= y x3))))
(assert
  (forall ((x Int) (x2 Int)) (= (apply13 (lam27 x) x2) (<= x x2))))
(assert
  (forall ((x Int) (x3 Int)) (= (apply13 (lam28 x) x3) (<= x x3))))
(assert
  (forall ((x Int) (z Int)) (= (apply13 (lam29 x) z) (<= x z))))
(assert
  (forall ((x Int) (x2 Int)) (= (apply13 (lam30 x) x2) (> x x2))))
(assert-not (forall ((xs list2)) (= (qsort xs) (isort xs))))
(assert-claim (= (isort nil2) nil2))
(assert-claim (forall ((x list2)) (= (isort x) (qsort x))))
(assert-claim (forall ((y list)) (= (++2 y nil) y)))
(assert-claim (forall ((y list)) (= (++2 nil y) y)))
(assert-claim (forall ((y fun12)) (= (filter2 y nil) nil)))
(assert-claim
  (forall ((x Int)) (= (insert2 x nil2) (cons2 x nil2))))
(assert-claim (forall ((x list2)) (= (isort (isort x)) (isort x))))
(assert-claim
  (forall ((x list2) (y list2))
    (= (isort (++ y x)) (isort (++ x y)))))
(assert-claim
  (forall ((x Int) (y list2))
    (= (isort (cons2 x y)) (insert2 x (isort y)))))
(assert-claim
  (forall ((x fun13) (y list2))
    (= (isort (filter x y)) (filter x (isort y)))))
(assert-claim
  (forall ((x Int) (y list2))
    (= (isort (insert2 x y)) (insert2 x (isort y)))))
(assert-claim
  (forall ((y list) (z list) (x2 list))
    (= (++2 (++2 y z) x2) (++2 y (++2 z x2)))))
(assert-claim
  (forall ((y sk) (z list) (x2 list))
    (= (cons y (++2 z x2)) (++2 (cons y z) x2))))
(assert-claim
  (forall ((y fun12) (z fun12) (x2 list))
    (= (filter2 z (filter2 y x2)) (filter2 y (filter2 z x2)))))
(assert-claim
  (forall ((y fun12) (z list))
    (= (filter2 y (filter2 y z)) (filter2 y z))))
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
  (forall ((x Int) (y Int) (z list2))
    (=> (> y x) (= (insert2 y (cons2 x z)) (cons2 x (insert2 y z))))))
(assert-claim
  (forall ((x list2) (y list2))
    (= (isort (++ x (isort y))) (isort (++ x y)))))
(assert-claim
  (forall ((x Int) (y list2))
    (= (filter (lam3 x) (cons2 x y)) (cons2 x (filter (lam4 x) y)))))
(assert-claim
  (forall ((x Int) (y list2))
    (= (filter (lam5 x) (insert2 x y)) (cons2 x (filter (lam6 x) y)))))
(assert-claim
  (forall ((x Int) (y Int) (z list2))
    (=> (<= y x)
      (= (filter (lam7 y) (cons2 x z)) (cons2 x (filter (lam8 y) z))))))
(assert-claim
  (forall ((x Int) (y Int) (z list2))
    (=> (<= y x)
      (= (filter (lam9 x) (insert2 y z))
        (filter (lam10 x) (cons2 y z))))))
(assert-claim
  (forall ((x Int) (y Int) (z list2))
    (=> (> y x)
      (= (filter (lam11 y) (cons2 x z)) (filter (lam12 y) z)))))
(assert-claim
  (forall ((x Int) (y list2))
    (= (filter (lam13 x) (cons2 x y)) (filter (lam14 x) y))))
(assert-claim
  (forall ((x Int) (y list2))
    (= (filter (lam15 x) (insert2 x y)) (filter (lam16 x) y))))
(assert-claim
  (forall ((x Int) (y Int) (z list2))
    (=> (<= y x)
      (= (filter (lam17 y) (cons2 x z)) (filter (lam18 y) z)))))
(assert-claim
  (forall ((x Int) (y Int) (z list2))
    (=> (<= y x)
      (= (filter (lam19 y) (insert2 x z)) (filter (lam20 y) z)))))
(assert-claim
  (forall ((x Int) (y Int) (z list2))
    (=> (> y x)
      (= (filter (lam21 y) (cons2 x z))
        (cons2 x (filter (lam22 y) z))))))
(assert-claim
  (forall ((x Int) (y list2))
    (= (insert2 x (filter (lam23 x) y))
      (cons2 x (filter (lam24 x) y)))))
(assert-claim
  (forall ((x Int) (y Int) (z list2))
    (=> (<= x y)
      (= (insert2 x (filter (lam25 y) z))
        (cons2 x (filter (lam26 y) z))))))
(assert-claim
  (forall ((x Int) (y Int) (z list2))
    (=> (<= x y)
      (= (insert2 y (filter (lam27 x) z))
        (filter (lam28 x) (insert2 y z))))))
(assert-claim
  (forall ((y fun12) (z list) (x2 list))
    (= (++2 (filter2 y z) (filter2 y x2)) (filter2 y (++2 z x2)))))
(assert-claim
  (forall ((x list2) (y Int) (z list2))
    (= (insert2 y (++ x (cons2 y z))) (++ (insert2 y x) (cons2 y z)))))
(assert-claim
  (forall ((x Int) (y list2) (z list2))
    (= (insert2 x (++ (insert2 x y) z))
      (++ (insert2 x (insert2 x y)) z))))
(assert-claim
  (forall ((x fun13) (y Int))
    (= (insert2 y (filter x (cons2 y nil2)))
      (cons2 y (filter x (cons2 y nil2))))))
(assert-claim
  (forall ((x Int) (y list2))
    (= (filter (lam29 x) (filter (lam30 x) y)) nil2)))
