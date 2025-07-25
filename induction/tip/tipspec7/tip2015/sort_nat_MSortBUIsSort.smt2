(declare-sort sk 0)
(declare-sort fun1 0)
(declare-sort fun12 0)
(declare-sort fun13 0)
(declare-sort fun14 0)
(declare-sort fun15 0)
(declare-sort fun16 0)
(declare-sort fun17 0)
(declare-datatype list3 ((nil3) (cons3 (head3 sk) (tail3 list3))))
(declare-datatype Nat ((zero) (succ (p Nat))))
(declare-datatype list2 ((nil2) (cons2 (head2 Nat) (tail2 list2))))
(declare-datatype list ((nil) (cons (head list2) (tail list))))
(declare-const lam fun13)
(declare-const lam2 fun17)
(declare-const lam3 fun17)
(declare-const lam4 fun17)
(declare-const lam5 fun17)
(declare-fun lam6 (Nat) fun17)
(declare-fun lam7 (Nat) fun17)
(declare-const lam8 fun1)
(declare-const lam9 fun1)
(declare-const lam10 fun17)
(declare-const lam11 fun17)
(declare-const lam12 fun17)
(declare-const lam13 fun17)
(declare-const lam14 fun1)
(declare-const lam15 fun17)
(declare-const lam16 fun17)
(declare-const lam17 fun17)
(declare-const lam18 fun1)
(declare-const lam19 fun17)
(declare-const lam20 fun1)
(declare-const lam21 fun1)
(declare-const lam22 fun17)
(declare-const lam23 fun1)
(declare-const lam24 fun17)
(declare-const lam25 fun1)
(declare-const lam26 fun1)
(declare-const lam27 fun17)
(declare-const lam28 fun17)
(declare-const lam29 fun1)
(declare-const lam30 fun1)
(declare-fun lam31 (Nat) fun17)
(declare-fun lam32 (Nat) fun17)
(declare-fun lam33 (Nat) fun17)
(declare-fun lam34 (Nat) fun17)
(declare-fun lam35 (list2) fun17)
(declare-const lam36 fun17)
(declare-fun lam37 (Nat) fun17)
(declare-fun lam38 (Nat) fun17)
(declare-const lam39 fun17)
(declare-const lam40 fun17)
(declare-fun lam41 (Nat) fun17)
(declare-fun lam42 (Nat) fun17)
(declare-const lam43 fun17)
(declare-const lam44 fun1)
(declare-const lam45 fun17)
(declare-const lam46 fun17)
(declare-const lam47 fun17)
(declare-const lam48 fun1)
(declare-const lam49 fun17)
(declare-fun lam50 (list2) fun17)
(declare-fun lam51 (list2) fun17)
(declare-const lam52 fun17)
(declare-const lam53 fun17)
(declare-fun lam54 (Nat) fun17)
(declare-fun lam55 (list2) fun17)
(declare-fun lam56 (Nat list2) fun17)
(declare-fun lam57 (list2) fun17)
(declare-fun lam58 (list2) fun17)
(declare-fun lam59 (list2 list2) fun17)
(declare-const lam60 fun1)
(declare-const lam61 fun1)
(declare-const lam62 fun1)
(declare-fun lam63 (Nat) fun17)
(declare-const lam64 fun17)
(declare-const lam65 fun17)
(declare-fun lam66 (Nat) fun17)
(declare-const lam67 fun17)
(declare-fun lam68 (list2) fun17)
(declare-const lam69 fun17)
(declare-fun lam70 (list2) fun17)
(declare-fun lam71 (list2) fun17)
(declare-const lam72 fun17)
(declare-fun lam73 (list2) fun17)
(declare-fun lam74 (list2) fun17)
(declare-const lam75 fun17)
(declare-const lam76 fun17)
(declare-fun lam77 (list2) fun17)
(declare-fun apply1 (fun1 Nat) Nat)
(declare-fun apply12 (fun12 Nat) sk)
(declare-fun apply13 (fun13 Nat) list2)
(declare-fun apply14 (fun14 sk) Nat)
(declare-fun apply15 (fun15 sk) sk)
(declare-fun apply16 (fun16 list2) Nat)
(declare-fun apply17 (fun17 list2) list2)
(define-fun-rec
  map8
  ((f fun15) (x list3)) list3
  (match x
    ((nil3 nil3)
     ((cons3 y xs) (cons3 (apply15 f y) (map8 f xs))))))
(define-fun-rec
  map7
  ((f fun14) (x list3)) list2
  (match x
    ((nil3 nil2)
     ((cons3 y xs) (cons2 (apply14 f y) (map7 f xs))))))
(define-fun-rec
  map6
  ((f fun12) (x list2)) list3
  (match x
    ((nil2 nil3)
     ((cons2 y xs) (cons3 (apply12 f y) (map6 f xs))))))
(define-fun-rec
  map5
  ((f fun1) (x list2)) list2
  (match x
    ((nil2 nil2)
     ((cons2 y xs) (cons2 (apply1 f y) (map5 f xs))))))
(define-fun-rec
  map4
  ((f fun16) (x list)) list2
  (match x
    ((nil nil2)
     ((cons y xs) (cons2 (apply16 f y) (map4 f xs))))))
(define-fun-rec
  map3
  ((f fun17) (x list)) list
  (match x
    ((nil nil)
     ((cons y xs) (cons (apply17 f y) (map3 f xs))))))
(define-fun-rec
  map2
  ((f fun13) (x list2)) list
  (match x
    ((nil2 nil)
     ((cons2 y xs) (cons (apply13 f y) (map2 f xs))))))
(define-fun-rec
  leq
  ((x Nat) (y Nat)) Bool
  (match x
    ((zero true)
     ((succ z)
      (match y
        ((zero false)
         ((succ x2) (leq z x2))))))))
(define-fun-rec
  lmerge
  ((x list2) (y list2)) list2
  (match x
    ((nil2 y)
     ((cons2 z x2)
      (match y
        ((nil2 (cons2 z x2))
         ((cons2 x3 x4)
          (ite
            (leq z x3) (cons2 z (lmerge x2 (cons2 x3 x4)))
            (cons2 x3 (lmerge (cons2 z x2) x4))))))))))
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
    ((nil nil2)
     ((cons xs y)
      (match y
        ((nil xs)
         ((cons z x2) (mergingbu (pairwise (cons xs (cons z x2)))))))))))
(define-fun
  msortbu
  ((x list2)) list2 (mergingbu (map2 lam x)))
(define-fun-rec
  insert2
  ((x Nat) (y list2)) list2
  (match y
    ((nil2 (cons2 x nil2))
     ((cons2 z xs)
      (ite (leq x z) (cons2 x (cons2 z xs)) (cons2 z (insert2 x xs)))))))
(define-fun-rec
  isort
  ((x list2)) list2
  (match x
    ((nil2 nil2)
     ((cons2 y xs) (insert2 y (isort xs))))))
(assert (forall ((y Nat)) (= (apply13 lam y) (cons2 y nil2))))
(assert (forall ((y list2)) (= (apply17 lam2 y) (isort y))))
(assert (forall ((y list2)) (= (apply17 lam3 y) (msortbu y))))
(assert (forall ((y list2)) (= (apply17 lam4 y) (insert2 zero y))))
(assert (forall ((y list2)) (= (apply17 lam5 y) (cons2 zero y))))
(assert
  (forall ((x Nat) (z list2))
    (= (apply17 (lam6 x) z) (insert2 x z))))
(assert
  (forall ((x Nat) (z list2))
    (= (apply17 (lam7 x) z) (lmerge (cons2 x nil2) z))))
(assert (forall ((y Nat)) (= (apply1 lam8 y) (succ y))))
(assert (forall ((z Nat)) (= (apply1 lam9 z) (succ z))))
(assert (forall ((y list2)) (= (apply17 lam10 y) (lmerge nil2 y))))
(assert (forall ((y list2)) (= (apply17 lam11 y) (isort y))))
(assert (forall ((y list2)) (= (apply17 lam12 y) (isort y))))
(assert (forall ((z list2)) (= (apply17 lam13 z) (isort z))))
(assert (forall ((y Nat)) (= (apply1 lam14 y) (succ y))))
(assert (forall ((y list2)) (= (apply17 lam15 y) (isort y))))
(assert (forall ((z list2)) (= (apply17 lam16 z) (isort z))))
(assert (forall ((x2 list2)) (= (apply17 lam17 x2) (isort x2))))
(assert (forall ((y list2)) (= (apply17 lam19 y) (map5 lam18 y))))
(assert (forall ((z Nat)) (= (apply1 lam18 z) (succ z))))
(assert (forall ((x2 Nat)) (= (apply1 lam20 x2) (succ x2))))
(assert (forall ((y list2)) (= (apply17 lam22 y) (map5 lam21 y))))
(assert (forall ((z Nat)) (= (apply1 lam21 z) (succ z))))
(assert
  (forall ((x2 list2)) (= (apply17 lam24 x2) (map5 lam23 x2))))
(assert (forall ((x3 Nat)) (= (apply1 lam23 x3) (succ x3))))
(assert (forall ((z Nat)) (= (apply1 lam25 z) (succ z))))
(assert (forall ((x2 Nat)) (= (apply1 lam26 x2) (succ x2))))
(assert (forall ((z list2)) (= (apply17 lam27 z) (isort z))))
(assert (forall ((x2 list2)) (= (apply17 lam28 x2) (isort x2))))
(assert (forall ((z Nat)) (= (apply1 lam29 z) (succ z))))
(assert (forall ((x2 Nat)) (= (apply1 lam30 x2) (succ x2))))
(assert
  (forall ((y Nat) (x2 list2))
    (= (apply17 (lam31 y) x2) (insert2 y x2))))
(assert
  (forall ((y Nat) (x3 list2))
    (= (apply17 (lam32 y) x3) (cons2 y x3))))
(assert
  (forall ((y Nat) (x2 list2))
    (= (apply17 (lam33 y) x2) (cons2 y x2))))
(assert
  (forall ((x Nat) (z list2))
    (= (apply17 (lam34 x) z) (insert2 x z))))
(assert
  (forall ((x list2) (z list2))
    (= (apply17 (lam35 x) z) (lmerge x z))))
(assert
  (forall ((y Nat) (x3 list2))
    (= (apply17 (lam37 y) x3) (cons2 y x3))))
(assert
  (forall ((y Nat) (x4 list2))
    (= (apply17 (lam38 y) x4) (insert2 y x4))))
(assert (forall ((x2 list2)) (= (apply17 lam36 x2) (isort x2))))
(assert (forall ((x5 list2)) (= (apply17 lam39 x5) (isort x5))))
(assert
  (forall ((x Nat) (x2 list2))
    (= (apply17 (lam41 x) x2) (insert2 x x2))))
(assert
  (forall ((x Nat) (x3 list2))
    (= (apply17 (lam42 x) x3) (insert2 x x3))))
(assert (forall ((z list2)) (= (apply17 lam40 z) (isort z))))
(assert (forall ((x4 list2)) (= (apply17 lam43 x4) (isort x4))))
(assert (forall ((y list2)) (= (apply17 lam45 y) (map5 lam44 y))))
(assert (forall ((z Nat)) (= (apply1 lam44 z) (succ z))))
(assert (forall ((x2 list2)) (= (apply17 lam46 x2) (isort x2))))
(assert (forall ((x3 list2)) (= (apply17 lam47 x3) (isort x3))))
(assert
  (forall ((x4 list2)) (= (apply17 lam49 x4) (map5 lam48 x4))))
(assert (forall ((x5 Nat)) (= (apply1 lam48 x5) (succ x5))))
(assert
  (forall ((x list2) (z list2))
    (= (apply17 (lam50 x) z) (lmerge (isort x) z))))
(assert
  (forall ((x list2) (x2 list2))
    (= (apply17 (lam51 x) x2) (lmerge x x2))))
(assert (forall ((y list2)) (= (apply17 lam52 y) (isort y))))
(assert (forall ((z list2)) (= (apply17 lam53 z) (isort z))))
(assert
  (forall ((x Nat) (y list2) (x4 list2))
    (= (apply17 (lam56 x y) x4) (lmerge (insert2 x y) x4))))
(assert
  (forall ((x Nat) (x2 list2))
    (= (apply17 (lam54 x) x2) (insert2 x x2))))
(assert
  (forall ((y list2) (x3 list2))
    (= (apply17 (lam55 y) x3) (lmerge y x3))))
(assert
  (forall ((x list2) (y list2) (x4 list2))
    (= (apply17 (lam59 x y) x4) (lmerge (lmerge x y) x4))))
(assert
  (forall ((x list2) (x2 list2))
    (= (apply17 (lam57 x) x2) (lmerge x x2))))
(assert
  (forall ((y list2) (x3 list2))
    (= (apply17 (lam58 y) x3) (lmerge y x3))))
(assert (forall ((z Nat)) (= (apply1 lam60 z) (succ z))))
(assert (forall ((x2 Nat)) (= (apply1 lam61 x2) (succ x2))))
(assert (forall ((x3 Nat)) (= (apply1 lam62 x3) (succ x3))))
(assert
  (forall ((x Nat) (z list2))
    (= (apply17 (lam63 x) z) (insert2 x z))))
(assert
  (forall ((x Nat) (x4 list2))
    (= (apply17 (lam66 x) x4) (insert2 x x4))))
(assert
  (forall ((x2 list2)) (= (apply17 lam64 x2) (cons2 zero x2))))
(assert
  (forall ((x3 list2)) (= (apply17 lam65 x3) (cons2 zero x3))))
(assert
  (forall ((x list2) (x2 list2))
    (= (apply17 (lam68 x) x2) (lmerge (isort x) x2))))
(assert
  (forall ((x list2) (x4 list2))
    (= (apply17 (lam70 x) x4) (lmerge x x4))))
(assert (forall ((z list2)) (= (apply17 lam67 z) (isort z))))
(assert (forall ((x3 list2)) (= (apply17 lam69 x3) (isort x3))))
(assert
  (forall ((x list2) (z list2))
    (= (apply17 (lam71 x) z) (lmerge x z))))
(assert
  (forall ((x list2) (x3 list2))
    (= (apply17 (lam73 x) x3) (lmerge (cons2 zero x) x3))))
(assert
  (forall ((x2 list2)) (= (apply17 lam72 x2) (cons2 zero x2))))
(assert
  (forall ((x list2) (z list2))
    (= (apply17 (lam74 x) z) (lmerge (isort x) z))))
(assert
  (forall ((x list2) (x4 list2))
    (= (apply17 (lam77 x) x4) (lmerge x x4))))
(assert (forall ((x2 list2)) (= (apply17 lam75 x2) (isort x2))))
(assert (forall ((x3 list2)) (= (apply17 lam76 x3) (isort x3))))
(assert-not (forall ((xs list2)) (= (msortbu xs) (isort xs))))
(assert-claim (= (pairwise nil) nil))
(assert-claim (= (mergingbu nil) nil2))
(assert-claim (= (isort nil2) nil2))
(assert-claim
  (forall ((x list2)) (= (apply17 lam2 x) (apply17 lam3 x))))
(assert-claim
  (forall ((x list2)) (= (apply17 lam4 x) (apply17 lam5 x))))
(assert-claim (forall ((x Nat)) (leq x x)))
(assert-claim
  (forall ((x Nat)) (= (insert2 x nil2) (cons2 x nil2))))
(assert-claim (forall ((x list2)) (= (isort (isort x)) (isort x))))
(assert-claim (forall ((x Nat)) (leq zero x)))
(assert-claim (forall ((x list2)) (= (lmerge x nil2) x)))
(assert-claim (forall ((x list2)) (= (lmerge nil2 x) x)))
(assert-claim (forall ((z fun15)) (= (map8 z nil3) nil3)))
(assert-claim
  (forall ((x list)) (= (mergingbu (pairwise x)) (mergingbu x))))
(assert-claim
  (forall ((x Nat) (y list2))
    (= (isort (cons2 x y)) (insert2 x (isort y)))))
(assert-claim
  (forall ((x Nat) (y list2))
    (= (isort (insert2 x y)) (insert2 x (isort y)))))
(assert-claim
  (forall ((x list2) (y list2))
    (= (isort (lmerge y x)) (isort (lmerge x y)))))
(assert-claim (forall ((x Nat)) (leq x (succ x))))
(assert-claim (forall ((x Nat)) (not (leq (succ x) x))))
(assert-claim
  (forall ((x Nat) (y Nat)) (=> (leq y x) (not (leq (succ x) y)))))
(assert-claim
  (forall ((x Nat) (y Nat)) (=> (leq x y) (leq x (succ y)))))
(assert-claim
  (forall ((x list2) (y list))
    (= (mergingbu (cons x y)) (lmerge x (mergingbu y)))))
(assert-claim
  (forall ((x list2))
    (= (isort (cons2 zero x)) (cons2 zero (isort x)))))
(assert-claim
  (forall ((x list2)) (= (pairwise (cons x nil)) (cons x nil))))
(assert-claim
  (forall ((x Nat) (y list2))
    (= (apply17 (lam6 x) y) (apply17 (lam7 x) y))))
(assert-claim
  (forall ((x list2))
    (= (map5 lam8 (isort x)) (isort (map5 lam9 x)))))
(assert-claim (forall ((x list)) (= (map3 lam10 x) x)))
(assert-claim
  (forall ((x list))
    (= (mergingbu (map3 lam11 x)) (isort (mergingbu x)))))
(assert-claim
  (forall ((x list))
    (= (pairwise (map3 lam12 x)) (map3 lam13 (pairwise x)))))
(assert-claim
  (forall ((x Nat) (y list2))
    (= (insert2 x (cons2 x y)) (cons2 x (cons2 x y)))))
(assert-claim
  (forall ((x Nat) (y Nat) (z list2))
    (= (insert2 y (insert2 x z)) (insert2 x (insert2 y z)))))
(assert-claim
  (forall ((x Nat) (y Nat) (z list2))
    (=> (leq x y) (= (insert2 x (cons2 y z)) (cons2 x (cons2 y z))))))
(assert-claim
  (forall ((x Nat) (y list2) (z list2))
    (= (lmerge (insert2 x y) z) (insert2 x (lmerge y z)))))
(assert-claim
  (forall ((x list2) (y list2) (z list2))
    (= (lmerge (lmerge x y) z) (lmerge x (lmerge y z)))))
(assert-claim
  (forall ((x Nat) (y list2))
    (= (insert2 x (cons2 zero y)) (cons2 zero (insert2 x y)))))
(assert-claim
  (forall ((x list2) (y list2))
    (= (isort (lmerge x (isort y))) (isort (lmerge x y)))))
(assert-claim
  (forall ((x fun1) (y list2))
    (= (isort (map5 x (isort y))) (isort (map5 x y)))))
(assert-claim
  (forall ((x Nat) (y Nat)) (= (leq (succ x) (succ y)) (leq x y))))
(assert-claim
  (forall ((x list2) (y list2))
    (= (lmerge x (cons2 zero y)) (cons2 zero (lmerge x y)))))
(assert-claim
  (forall ((x list2) (y list2))
    (= (lmerge (cons2 zero x) y) (cons2 zero (lmerge x y)))))
(assert-claim
  (forall ((x list2) (y list2))
    (= (lmerge (isort x) (isort y)) (isort (lmerge x y)))))
(assert-claim
  (forall ((z fun15) (x2 sk))
    (= (map8 z (cons3 x2 nil3)) (cons3 (apply15 z x2) nil3))))
(assert-claim
  (forall ((x list))
    (= (pairwise (pairwise (pairwise (pairwise x))))
      (pairwise (pairwise (pairwise x))))))
(assert-claim
  (forall ((x Nat))
    (= (map5 lam14 (cons2 x nil2)) (cons2 (succ x) nil2))))
(assert-claim
  (forall ((x list)) (= (map3 lam15 (map3 lam16 x)) (map3 lam17 x))))
(assert-claim
  (forall ((x list))
    (= (mergingbu (map3 lam19 x)) (map5 lam20 (mergingbu x)))))
(assert-claim
  (forall ((x list))
    (= (pairwise (map3 lam22 x)) (map3 lam24 (pairwise x)))))
(assert-claim
  (forall ((x Nat) (y list2))
    (= (insert2 (succ x) (cons2 x y)) (cons2 x (insert2 (succ x) y)))))
(assert-claim
  (forall ((x Nat) (y Nat) (z list2))
    (=> (leq x y)
      (= (insert2 (succ y) (cons2 x z))
        (cons2 x (insert2 (succ y) z))))))
(assert-claim
  (forall ((x list2) (y list2) (z list))
    (= (pairwise (cons x (cons y z)))
      (cons (lmerge x y) (pairwise z)))))
(assert-claim
  (forall ((x fun13) (y list2))
    (= (isort (mergingbu (map2 x (isort y))))
      (isort (mergingbu (map2 x y))))))
(assert-claim
  (forall ((x list2) (y list))
    (= (pairwise (pairwise (pairwise (cons x y))))
      (cons (lmerge x (mergingbu y)) nil))))
(assert-claim
  (forall ((x Nat) (y list2))
    (= (cons2 (succ x) (map5 lam25 y)) (map5 lam26 (cons2 x y)))))
(assert-claim
  (forall ((x list2) (y list))
    (= (cons (isort x) (map3 lam27 y)) (map3 lam28 (cons x y)))))
(assert-claim
  (forall ((x Nat) (y list2))
    (= (insert2 (succ x) (map5 lam29 y)) (map5 lam30 (insert2 x y)))))
(assert-claim
  (forall ((x Nat) (y Nat) (z list))
    (=> (leq y x)
      (= (isort (mergingbu (map3 (lam31 y) z)))
        (isort (mergingbu (map3 (lam32 y) z)))))))
(assert-claim
  (forall ((x Nat) (y Nat) (z list2))
    (=> (leq y x)
      (= (map3 (lam33 y) (cons z nil)) (cons (cons2 y z) nil)))))
(assert-claim
  (forall ((x Nat) (y list2))
    (= (map3 (lam34 x) (cons y nil)) (cons (insert2 x y) nil))))
(assert-claim
  (forall ((x list2) (y list2))
    (= (map3 (lam35 x) (cons y nil)) (cons (lmerge x y) nil))))
(assert-claim
  (forall ((x Nat) (y Nat) (z list))
    (=> (leq y x)
      (= (map3 lam36 (map3 (lam37 y) z))
        (map3 (lam38 y) (map3 lam39 z))))))
(assert-claim
  (forall ((x Nat) (y list))
    (= (map3 lam40 (map3 (lam41 x) y))
      (map3 (lam42 x) (map3 lam43 y)))))
(assert-claim
  (forall ((x list))
    (= (map3 lam45 (map3 lam46 x)) (map3 lam47 (map3 lam49 x)))))
(assert-claim
  (forall ((z fun15) (x2 sk) (x3 list3))
    (= (cons3 (apply15 z x2) (map8 z x3)) (map8 z (cons3 x2 x3)))))
(assert-claim
  (forall ((x list2) (y Nat) (z list2))
    (= (lmerge (cons2 y x) (cons2 y z))
      (cons2 y (lmerge x (cons2 y z))))))
(assert-claim
  (forall ((y fun14) (z fun12) (x2 list2))
    (= (isort (map7 y (map6 z (isort x2))))
      (isort (map7 y (map6 z x2))))))
(assert-claim
  (forall ((x fun13) (y Nat) (z list2))
    (= (isort (mergingbu (map2 x (insert2 y z))))
      (isort (mergingbu (map2 x (cons2 y z)))))))
(assert-claim
  (forall ((x Nat) (y list2))
    (= (insert2 (succ zero) (cons2 (succ x) y))
      (cons2 (succ zero) (cons2 (succ x) y)))))
(assert-claim
  (forall ((x fun16) (y list))
    (= (isort (map4 x (pairwise (pairwise (pairwise y)))))
      (map4 x (pairwise (pairwise (pairwise y)))))))
(assert-claim
  (forall ((x list2) (y list))
    (= (pairwise (cons x (pairwise (pairwise (pairwise y)))))
      (cons (lmerge x (mergingbu y)) nil))))
(assert-claim
  (forall ((x fun17) (y list))
    (= (pairwise (map3 x (pairwise (pairwise (pairwise y)))))
      (map3 x (pairwise (pairwise (pairwise y)))))))
(assert-claim
  (forall ((x list2) (y list))
    (= (pairwise (pairwise (cons x (pairwise (pairwise y)))))
      (cons (lmerge x (mergingbu y)) nil))))
(assert-claim
  (forall ((x fun17) (y list))
    (= (pairwise (pairwise (map3 x (pairwise (pairwise y)))))
      (pairwise (map3 x (pairwise (pairwise y)))))))
(assert-claim
  (forall ((x fun17) (y list))
    (= (pairwise (pairwise (pairwise (map3 x (pairwise y)))))
      (pairwise (pairwise (map3 x (pairwise y)))))))
(assert-claim
  (forall ((x list2) (y list))
    (= (isort (mergingbu (map3 (lam50 x) y)))
      (isort (mergingbu (map3 (lam51 x) y))))))
(assert-claim
  (forall ((x list))
    (= (map3 lam52 (cons (cons2 zero nil2) x))
      (cons (cons2 zero nil2) (map3 lam53 x)))))
(assert-claim
  (forall ((x Nat) (y list2) (z list))
    (= (map3 (lam54 x) (map3 (lam55 y) z)) (map3 (lam56 x y) z))))
(assert-claim
  (forall ((x list2) (y list2) (z list))
    (= (map3 (lam57 x) (map3 (lam58 y) z)) (map3 (lam59 x y) z))))
(assert-claim
  (forall ((x list2) (y list2))
    (= (lmerge (map5 lam60 x) (map5 lam61 y))
      (map5 lam62 (lmerge x y)))))
(assert-claim
  (forall ((x Nat) (y list))
    (= (map3 (lam63 x) (map3 lam64 y))
      (map3 lam65 (map3 (lam66 x) y)))))
(assert-claim
  (forall ((x list2) (y list))
    (= (map3 lam67 (map3 (lam68 x) y))
      (map3 lam69 (map3 (lam70 x) y)))))
(assert-claim
  (forall ((x list2) (y list))
    (= (map3 (lam71 x) (map3 lam72 y)) (map3 (lam73 x) y))))
(assert-claim
  (forall ((x list2) (y list))
    (= (map3 (lam74 x) (map3 lam75 y))
      (map3 lam76 (map3 (lam77 x) y)))))
