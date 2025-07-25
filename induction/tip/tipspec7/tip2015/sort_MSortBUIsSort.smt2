(declare-sort sk 0)
(declare-sort fun1 0)
(declare-sort fun12 0)
(declare-sort fun13 0)
(declare-sort fun14 0)
(declare-sort fun15 0)
(declare-sort fun16 0)
(declare-sort fun17 0)
(declare-datatype list3 ((nil2) (cons2 (head2 sk) (tail2 list3))))
(declare-datatype list2 ((nil3) (cons3 (head3 Int) (tail3 list2))))
(declare-datatype list ((nil) (cons (head list2) (tail list))))
(declare-const lam fun16)
(declare-const lam2 fun13)
(declare-const lam3 fun13)
(declare-fun lam4 (Int) fun13)
(declare-fun lam5 (Int) fun13)
(declare-const lam6 fun13)
(declare-const lam7 fun13)
(declare-const lam8 fun13)
(declare-const lam9 fun13)
(declare-const lam10 fun13)
(declare-const lam11 fun13)
(declare-const lam12 fun13)
(declare-const lam13 fun13)
(declare-const lam14 fun13)
(declare-fun lam15 (Int) fun13)
(declare-fun lam16 (Int) fun13)
(declare-fun lam17 (Int) fun13)
(declare-fun lam18 (Int) fun13)
(declare-fun lam19 (list2) fun13)
(declare-const lam20 fun13)
(declare-fun lam21 (Int) fun13)
(declare-fun lam22 (Int) fun13)
(declare-const lam23 fun13)
(declare-const lam24 fun13)
(declare-fun lam25 (Int) fun13)
(declare-fun lam26 (Int) fun13)
(declare-const lam27 fun13)
(declare-fun lam28 (list2) fun13)
(declare-fun lam29 (list2) fun13)
(declare-fun lam30 (Int) fun13)
(declare-fun lam31 (list2) fun13)
(declare-fun lam32 (Int list2) fun13)
(declare-fun lam33 (list2) fun13)
(declare-fun lam34 (list2) fun13)
(declare-fun lam35 (list2 list2) fun13)
(declare-const lam36 fun13)
(declare-fun lam37 (list2) fun13)
(declare-const lam38 fun13)
(declare-fun lam39 (list2) fun13)
(declare-fun lam40 (list2) fun13)
(declare-const lam41 fun13)
(declare-const lam42 fun13)
(declare-fun lam43 (list2) fun13)
(declare-fun apply1 (fun1 sk) sk)
(declare-fun apply12 (fun12 sk) Int)
(declare-fun apply13 (fun13 list2) list2)
(declare-fun apply14 (fun14 list2) Int)
(declare-fun apply15 (fun15 Int) sk)
(declare-fun apply16 (fun16 Int) list2)
(declare-fun apply17 (fun17 Int) Int)
(define-fun-rec
  map8
  ((f fun17) (x list2)) list2
  (match x
    ((nil3 nil3)
     ((cons3 y xs) (cons3 (apply17 f y) (map8 f xs))))))
(define-fun-rec
  map7
  ((f fun15) (x list2)) list3
  (match x
    ((nil3 nil2)
     ((cons3 y xs) (cons2 (apply15 f y) (map7 f xs))))))
(define-fun-rec
  map6
  ((f fun12) (x list3)) list2
  (match x
    ((nil2 nil3)
     ((cons2 y xs) (cons3 (apply12 f y) (map6 f xs))))))
(define-fun-rec
  map5
  ((f fun1) (x list3)) list3
  (match x
    ((nil2 nil2)
     ((cons2 y xs) (cons2 (apply1 f y) (map5 f xs))))))
(define-fun-rec
  map4
  ((f fun14) (x list)) list2
  (match x
    ((nil nil3)
     ((cons y xs) (cons3 (apply14 f y) (map4 f xs))))))
(define-fun-rec
  map3
  ((f fun13) (x list)) list
  (match x
    ((nil nil)
     ((cons y xs) (cons (apply13 f y) (map3 f xs))))))
(define-fun-rec
  map2
  ((f fun16) (x list2)) list
  (match x
    ((nil3 nil)
     ((cons3 y xs) (cons (apply16 f y) (map2 f xs))))))
(define-fun-rec
  lmerge
  ((x list2) (y list2)) list2
  (match x
    ((nil3 y)
     ((cons3 z x2)
      (match y
        ((nil3 (cons3 z x2))
         ((cons3 x3 x4)
          (ite
            (<= z x3) (cons3 z (lmerge x2 (cons3 x3 x4)))
            (cons3 x3 (lmerge (cons3 z x2) x4))))))))))
(define-fun-rec
  pairwise
  ((x list)) list
  (match x
    ((nil nil)
     ((cons xs y)
      (match y
        ((nil (cons xs nil))
         ((cons ys xss) (cons (lmerge xs ys) (pairwise xss)))))))))
(define-fun-rec
  mergingbu
  ((x list)) list2
  (match x
    ((nil nil3)
     ((cons xs y)
      (match y
        ((nil xs)
         ((cons z x2) (mergingbu (pairwise (cons xs (cons z x2)))))))))))
(define-fun
  msortbu
  ((x list2)) list2 (mergingbu (map2 lam x)))
(define-fun-rec
  insert2
  ((x Int) (y list2)) list2
  (match y
    ((nil3 (cons3 x nil3))
     ((cons3 z xs)
      (ite (<= x z) (cons3 x (cons3 z xs)) (cons3 z (insert2 x xs)))))))
(define-fun-rec
  isort
  ((x list2)) list2
  (match x
    ((nil3 nil3)
     ((cons3 y xs) (insert2 y (isort xs))))))
(assert (forall ((y Int)) (= (apply16 lam y) (cons3 y nil3))))
(assert (forall ((y list2)) (= (apply13 lam2 y) (isort y))))
(assert (forall ((y list2)) (= (apply13 lam3 y) (msortbu y))))
(assert
  (forall ((x Int) (z list2))
    (= (apply13 (lam4 x) z) (insert2 x z))))
(assert
  (forall ((x Int) (z list2))
    (= (apply13 (lam5 x) z) (lmerge (cons3 x nil3) z))))
(assert (forall ((y list2)) (= (apply13 lam6 y) (lmerge nil3 y))))
(assert (forall ((y list2)) (= (apply13 lam7 y) (isort y))))
(assert (forall ((y list2)) (= (apply13 lam8 y) (isort y))))
(assert (forall ((z list2)) (= (apply13 lam9 z) (isort z))))
(assert (forall ((y list2)) (= (apply13 lam10 y) (isort y))))
(assert (forall ((z list2)) (= (apply13 lam11 z) (isort z))))
(assert (forall ((x2 list2)) (= (apply13 lam12 x2) (isort x2))))
(assert (forall ((z list2)) (= (apply13 lam13 z) (isort z))))
(assert (forall ((x2 list2)) (= (apply13 lam14 x2) (isort x2))))
(assert
  (forall ((y Int) (x2 list2))
    (= (apply13 (lam15 y) x2) (insert2 y x2))))
(assert
  (forall ((y Int) (x3 list2))
    (= (apply13 (lam16 y) x3) (cons3 y x3))))
(assert
  (forall ((y Int) (x2 list2))
    (= (apply13 (lam17 y) x2) (cons3 y x2))))
(assert
  (forall ((x Int) (z list2))
    (= (apply13 (lam18 x) z) (insert2 x z))))
(assert
  (forall ((x list2) (z list2))
    (= (apply13 (lam19 x) z) (lmerge x z))))
(assert
  (forall ((y Int) (x3 list2))
    (= (apply13 (lam21 y) x3) (cons3 y x3))))
(assert
  (forall ((y Int) (x4 list2))
    (= (apply13 (lam22 y) x4) (insert2 y x4))))
(assert (forall ((x2 list2)) (= (apply13 lam20 x2) (isort x2))))
(assert (forall ((x5 list2)) (= (apply13 lam23 x5) (isort x5))))
(assert
  (forall ((x Int) (x2 list2))
    (= (apply13 (lam25 x) x2) (insert2 x x2))))
(assert
  (forall ((x Int) (x3 list2))
    (= (apply13 (lam26 x) x3) (insert2 x x3))))
(assert (forall ((z list2)) (= (apply13 lam24 z) (isort z))))
(assert (forall ((x4 list2)) (= (apply13 lam27 x4) (isort x4))))
(assert
  (forall ((x list2) (z list2))
    (= (apply13 (lam28 x) z) (lmerge (isort x) z))))
(assert
  (forall ((x list2) (x2 list2))
    (= (apply13 (lam29 x) x2) (lmerge x x2))))
(assert
  (forall ((x Int) (y list2) (x4 list2))
    (= (apply13 (lam32 x y) x4) (lmerge (insert2 x y) x4))))
(assert
  (forall ((x Int) (x2 list2))
    (= (apply13 (lam30 x) x2) (insert2 x x2))))
(assert
  (forall ((y list2) (x3 list2))
    (= (apply13 (lam31 y) x3) (lmerge y x3))))
(assert
  (forall ((x list2) (y list2) (x4 list2))
    (= (apply13 (lam35 x y) x4) (lmerge (lmerge x y) x4))))
(assert
  (forall ((x list2) (x2 list2))
    (= (apply13 (lam33 x) x2) (lmerge x x2))))
(assert
  (forall ((y list2) (x3 list2))
    (= (apply13 (lam34 y) x3) (lmerge y x3))))
(assert
  (forall ((x list2) (x2 list2))
    (= (apply13 (lam37 x) x2) (lmerge (isort x) x2))))
(assert
  (forall ((x list2) (x4 list2))
    (= (apply13 (lam39 x) x4) (lmerge x x4))))
(assert (forall ((z list2)) (= (apply13 lam36 z) (isort z))))
(assert (forall ((x3 list2)) (= (apply13 lam38 x3) (isort x3))))
(assert
  (forall ((x list2) (z list2))
    (= (apply13 (lam40 x) z) (lmerge (isort x) z))))
(assert
  (forall ((x list2) (x4 list2))
    (= (apply13 (lam43 x) x4) (lmerge x x4))))
(assert (forall ((x2 list2)) (= (apply13 lam41 x2) (isort x2))))
(assert (forall ((x3 list2)) (= (apply13 lam42 x3) (isort x3))))
(assert-not (forall ((xs list2)) (= (msortbu xs) (isort xs))))
(assert-claim (= (pairwise nil) nil))
(assert-claim (= (mergingbu nil) nil3))
(assert-claim (= (isort nil3) nil3))
(assert-claim
  (forall ((x list2)) (= (apply13 lam2 x) (apply13 lam3 x))))
(assert-claim
  (forall ((x Int)) (= (insert2 x nil3) (cons3 x nil3))))
(assert-claim (forall ((x list2)) (= (isort (isort x)) (isort x))))
(assert-claim (forall ((x list2)) (= (lmerge x nil3) x)))
(assert-claim (forall ((x list2)) (= (lmerge nil3 x) x)))
(assert-claim (forall ((z fun1)) (= (map5 z nil2) nil2)))
(assert-claim
  (forall ((x list)) (= (mergingbu (pairwise x)) (mergingbu x))))
(assert-claim
  (forall ((x Int) (y list2))
    (= (isort (cons3 x y)) (insert2 x (isort y)))))
(assert-claim
  (forall ((x Int) (y list2))
    (= (isort (insert2 x y)) (insert2 x (isort y)))))
(assert-claim
  (forall ((x list2) (y list2))
    (= (isort (lmerge y x)) (isort (lmerge x y)))))
(assert-claim
  (forall ((x list2) (y list))
    (= (mergingbu (cons x y)) (lmerge x (mergingbu y)))))
(assert-claim
  (forall ((x list2)) (= (pairwise (cons x nil)) (cons x nil))))
(assert-claim
  (forall ((x Int) (y list2))
    (= (apply13 (lam4 x) y) (apply13 (lam5 x) y))))
(assert-claim (forall ((x list)) (= (map3 lam6 x) x)))
(assert-claim
  (forall ((x list))
    (= (mergingbu (map3 lam7 x)) (isort (mergingbu x)))))
(assert-claim
  (forall ((x list))
    (= (pairwise (map3 lam8 x)) (map3 lam9 (pairwise x)))))
(assert-claim
  (forall ((x Int) (y list2))
    (= (insert2 x (cons3 x y)) (cons3 x (cons3 x y)))))
(assert-claim
  (forall ((x Int) (y Int) (z list2))
    (= (insert2 y (insert2 x z)) (insert2 x (insert2 y z)))))
(assert-claim
  (forall ((x Int) (y Int) (z list2))
    (=> (<= x y) (= (insert2 x (cons3 y z)) (cons3 x (cons3 y z))))))
(assert-claim
  (forall ((x Int) (y list2) (z list2))
    (= (lmerge (insert2 x y) z) (insert2 x (lmerge y z)))))
(assert-claim
  (forall ((x list2) (y list2) (z list2))
    (= (lmerge (lmerge x y) z) (lmerge x (lmerge y z)))))
(assert-claim
  (forall ((x list2) (y list2))
    (= (isort (lmerge x (isort y))) (isort (lmerge x y)))))
(assert-claim
  (forall ((x fun17) (y list2))
    (= (isort (map8 x (isort y))) (isort (map8 x y)))))
(assert-claim
  (forall ((x list2) (y list2))
    (= (lmerge (isort x) (isort y)) (isort (lmerge x y)))))
(assert-claim
  (forall ((z fun1) (x2 sk))
    (= (map5 z (cons2 x2 nil2)) (cons2 (apply1 z x2) nil2))))
(assert-claim
  (forall ((x list))
    (= (pairwise (pairwise (pairwise (pairwise x))))
      (pairwise (pairwise (pairwise x))))))
(assert-claim
  (forall ((x list)) (= (map3 lam10 (map3 lam11 x)) (map3 lam12 x))))
(assert-claim
  (forall ((x list2) (y list2) (z list))
    (= (pairwise (cons x (cons y z)))
      (cons (lmerge x y) (pairwise z)))))
(assert-claim
  (forall ((x fun14) (y list))
    (= (isort (map4 x (pairwise (pairwise y))))
      (map4 x (pairwise (pairwise y))))))
(assert-claim
  (forall ((x fun16) (y list2))
    (= (isort (mergingbu (map2 x (isort y))))
      (isort (mergingbu (map2 x y))))))
(assert-claim
  (forall ((x list2) (y list))
    (= (pairwise (pairwise (cons x (pairwise y))))
      (cons (lmerge x (mergingbu y)) nil))))
(assert-claim
  (forall ((x list2) (y list))
    (= (pairwise (pairwise (pairwise (cons x y))))
      (cons (lmerge x (mergingbu y)) nil))))
(assert-claim
  (forall ((x list2) (y list))
    (= (cons (isort x) (map3 lam13 y)) (map3 lam14 (cons x y)))))
(assert-claim
  (forall ((x Int) (y Int) (z list))
    (=> (<= y x)
      (= (isort (mergingbu (map3 (lam15 y) z)))
        (isort (mergingbu (map3 (lam16 y) z)))))))
(assert-claim
  (forall ((x Int) (y Int) (z list2))
    (=> (<= y x)
      (= (map3 (lam17 y) (cons z nil)) (cons (cons3 y z) nil)))))
(assert-claim
  (forall ((x Int) (y list2))
    (= (map3 (lam18 x) (cons y nil)) (cons (insert2 x y) nil))))
(assert-claim
  (forall ((x list2) (y list2))
    (= (map3 (lam19 x) (cons y nil)) (cons (lmerge x y) nil))))
(assert-claim
  (forall ((x Int) (y Int) (z list))
    (=> (<= y x)
      (= (map3 lam20 (map3 (lam21 y) z))
        (map3 (lam22 y) (map3 lam23 z))))))
(assert-claim
  (forall ((x Int) (y list))
    (= (map3 lam24 (map3 (lam25 x) y))
      (map3 (lam26 x) (map3 lam27 y)))))
(assert-claim
  (forall ((z fun1) (x2 sk) (x3 list3))
    (= (cons2 (apply1 z x2) (map5 z x3)) (map5 z (cons2 x2 x3)))))
(assert-claim
  (forall ((x list2) (y Int) (z list2))
    (= (lmerge (cons3 y x) (cons3 y z))
      (cons3 y (lmerge x (cons3 y z))))))
(assert-claim
  (forall ((y fun12) (z fun15) (x2 list2))
    (= (isort (map6 y (map7 z (isort x2))))
      (isort (map6 y (map7 z x2))))))
(assert-claim
  (forall ((x fun16) (y Int) (z list2))
    (= (isort (mergingbu (map2 x (insert2 y z))))
      (isort (mergingbu (map2 x (cons3 y z)))))))
(assert-claim
  (forall ((x list2) (y list))
    (= (pairwise (cons x (pairwise (pairwise (pairwise y)))))
      (cons (lmerge x (mergingbu y)) nil))))
(assert-claim
  (forall ((x fun13) (y list))
    (= (pairwise (map3 x (pairwise (pairwise (pairwise y)))))
      (map3 x (pairwise (pairwise (pairwise y)))))))
(assert-claim
  (forall ((x fun13) (y list))
    (= (pairwise (pairwise (map3 x (pairwise (pairwise y)))))
      (pairwise (map3 x (pairwise (pairwise y)))))))
(assert-claim
  (forall ((x fun13) (y list))
    (= (pairwise (pairwise (pairwise (map3 x (pairwise y)))))
      (pairwise (pairwise (map3 x (pairwise y)))))))
(assert-claim
  (forall ((x list2) (y list))
    (= (isort (mergingbu (map3 (lam28 x) y)))
      (isort (mergingbu (map3 (lam29 x) y))))))
(assert-claim
  (forall ((x Int) (y list2) (z list))
    (= (map3 (lam30 x) (map3 (lam31 y) z)) (map3 (lam32 x y) z))))
(assert-claim
  (forall ((x list2) (y list2) (z list))
    (= (map3 (lam33 x) (map3 (lam34 y) z)) (map3 (lam35 x y) z))))
(assert-claim
  (forall ((x list2) (y list))
    (= (map3 lam36 (map3 (lam37 x) y))
      (map3 lam38 (map3 (lam39 x) y)))))
(assert-claim
  (forall ((x list2) (y list))
    (= (map3 (lam40 x) (map3 lam41 y))
      (map3 lam42 (map3 (lam43 x) y)))))
