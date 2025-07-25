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
(declare-const lam4 fun1)
(declare-const lam5 fun1)
(declare-const lam6 fun1)
(declare-const lam7 fun17)
(declare-const lam8 fun17)
(declare-const lam9 fun17)
(declare-const lam10 fun17)
(declare-const lam11 fun17)
(declare-const lam12 fun17)
(declare-const lam13 fun1)
(declare-const lam14 fun17)
(declare-const lam15 fun17)
(declare-const lam16 fun17)
(declare-const lam17 fun1)
(declare-const lam18 fun17)
(declare-const lam19 fun1)
(declare-const lam20 fun1)
(declare-const lam21 fun17)
(declare-const lam22 fun1)
(declare-const lam23 fun17)
(declare-const lam24 fun1)
(declare-const lam25 fun1)
(declare-const lam26 fun17)
(declare-const lam27 fun17)
(declare-fun lam28 (Nat) fun17)
(declare-fun lam29 (list2) fun17)
(declare-const lam30 fun1)
(declare-fun lam31 (Nat) fun17)
(declare-fun lam32 (list2) fun17)
(declare-const lam33 fun17)
(declare-fun lam34 (list2) fun17)
(declare-fun lam35 (list2) fun17)
(declare-const lam36 fun17)
(declare-const lam37 fun17)
(declare-const lam38 fun17)
(declare-const lam39 fun17)
(declare-const lam40 fun17)
(declare-const lam41 fun17)
(declare-const lam42 fun1)
(declare-const lam43 fun17)
(declare-const lam44 fun1)
(declare-const lam45 fun17)
(declare-const lam46 fun17)
(declare-fun lam47 (list2) fun17)
(declare-fun lam48 (list2) fun17)
(declare-fun lam49 (list2) fun17)
(declare-fun lam50 (list2) fun17)
(declare-fun lam51 (list) fun17)
(declare-fun lam52 (list2) fun17)
(declare-fun lam53 (list2) fun17)
(declare-fun lam54 (list2 list2) fun17)
(declare-const lam55 fun1)
(declare-const lam56 fun1)
(declare-const lam57 fun1)
(declare-fun lam58 (list2) fun17)
(declare-const lam59 fun17)
(declare-const lam60 fun17)
(declare-fun lam61 (list2) fun17)
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
  ordered
  ((x list2)) Bool
  (match x
    ((nil2 true)
     ((cons2 y z)
      (match z
        ((nil2 true)
         ((cons2 y2 xs) (and (leq y y2) (ordered (cons2 y2 xs))))))))))
(assert (forall ((y Nat)) (= (apply13 lam y) (cons2 y nil2))))
(assert (forall ((y list2)) (= (apply17 lam2 y) (lmerge nil2 y))))
(assert (forall ((y list2)) (= (apply17 lam3 y) (msortbu y))))
(assert (forall ((y Nat)) (= (apply1 lam4 y) (succ y))))
(assert (forall ((z Nat)) (= (apply1 lam5 z) (succ z))))
(assert (forall ((y Nat)) (= (apply1 lam6 y) (succ y))))
(assert (forall ((y list2)) (= (apply17 lam7 y) (msortbu y))))
(assert (forall ((z list2)) (= (apply17 lam8 z) (msortbu z))))
(assert
  (forall ((y list2))
    (= (apply17 lam9 y) (lmerge (cons2 zero nil2) y))))
(assert (forall ((y list2)) (= (apply17 lam10 y) (cons2 zero y))))
(assert (forall ((z list2)) (= (apply17 lam11 z) (msortbu z))))
(assert (forall ((x2 list2)) (= (apply17 lam12 x2) (msortbu x2))))
(assert (forall ((y Nat)) (= (apply1 lam13 y) (succ y))))
(assert (forall ((y list2)) (= (apply17 lam14 y) (msortbu y))))
(assert (forall ((z list2)) (= (apply17 lam15 z) (msortbu z))))
(assert (forall ((x2 list2)) (= (apply17 lam16 x2) (msortbu x2))))
(assert (forall ((y list2)) (= (apply17 lam18 y) (map5 lam17 y))))
(assert (forall ((z Nat)) (= (apply1 lam17 z) (succ z))))
(assert (forall ((x2 Nat)) (= (apply1 lam19 x2) (succ x2))))
(assert (forall ((y list2)) (= (apply17 lam21 y) (map5 lam20 y))))
(assert (forall ((z Nat)) (= (apply1 lam20 z) (succ z))))
(assert
  (forall ((x2 list2)) (= (apply17 lam23 x2) (map5 lam22 x2))))
(assert (forall ((x3 Nat)) (= (apply1 lam22 x3) (succ x3))))
(assert (forall ((z Nat)) (= (apply1 lam24 z) (succ z))))
(assert (forall ((x2 Nat)) (= (apply1 lam25 x2) (succ x2))))
(assert (forall ((z list2)) (= (apply17 lam26 z) (msortbu z))))
(assert (forall ((x2 list2)) (= (apply17 lam27 x2) (msortbu x2))))
(assert
  (forall ((y Nat) (x2 list2))
    (= (apply17 (lam28 y) x2) (cons2 y x2))))
(assert
  (forall ((x list2) (z list2))
    (= (apply17 (lam29 x) z) (lmerge x z))))
(assert (forall ((z Nat)) (= (apply1 lam30 z) (succ z))))
(assert
  (forall ((y Nat) (x2 list2))
    (= (apply17 (lam31 y) x2) (cons2 y x2))))
(assert
  (forall ((x list2) (z list2))
    (= (apply17 (lam32 x) z) (lmerge x z))))
(assert
  (forall ((x list2) (x2 list2))
    (= (apply17 (lam34 x) x2) (lmerge x x2))))
(assert
  (forall ((x list2) (x3 list2))
    (= (apply17 (lam35 x) x3) (lmerge x x3))))
(assert (forall ((z list2)) (= (apply17 lam33 z) (msortbu z))))
(assert (forall ((x4 list2)) (= (apply17 lam36 x4) (msortbu x4))))
(assert (forall ((y list2)) (= (apply17 lam37 y) (msortbu y))))
(assert (forall ((z list2)) (= (apply17 lam38 z) (cons2 zero z))))
(assert
  (forall ((x2 list2)) (= (apply17 lam39 x2) (cons2 zero x2))))
(assert (forall ((x3 list2)) (= (apply17 lam40 x3) (msortbu x3))))
(assert (forall ((y list2)) (= (apply17 lam41 y) (msortbu y))))
(assert (forall ((z list2)) (= (apply17 lam43 z) (map5 lam42 z))))
(assert (forall ((x2 Nat)) (= (apply1 lam42 x2) (succ x2))))
(assert
  (forall ((x3 list2)) (= (apply17 lam45 x3) (map5 lam44 x3))))
(assert (forall ((x4 Nat)) (= (apply1 lam44 x4) (succ x4))))
(assert (forall ((x5 list2)) (= (apply17 lam46 x5) (msortbu x5))))
(assert
  (forall ((x list2) (z list2))
    (= (apply17 (lam47 x) z) (lmerge (msortbu x) z))))
(assert
  (forall ((x list2) (x2 list2))
    (= (apply17 (lam48 x) x2) (lmerge x x2))))
(assert
  (forall ((x list2) (z list2))
    (= (apply17 (lam49 x) z) (lmerge x z))))
(assert
  (forall ((x list2) (x2 list2))
    (= (apply17 (lam50 x) x2) (lmerge x x2))))
(assert
  (forall ((x list) (y list2))
    (= (apply17 (lam51 x) y) (lmerge (mergingbu x) y))))
(assert
  (forall ((x list2) (y list2) (x4 list2))
    (= (apply17 (lam54 x y) x4) (lmerge (lmerge x y) x4))))
(assert
  (forall ((x list2) (x2 list2))
    (= (apply17 (lam52 x) x2) (lmerge x x2))))
(assert
  (forall ((y list2) (x3 list2))
    (= (apply17 (lam53 y) x3) (lmerge y x3))))
(assert (forall ((z Nat)) (= (apply1 lam55 z) (succ z))))
(assert (forall ((x2 Nat)) (= (apply1 lam56 x2) (succ x2))))
(assert (forall ((x3 Nat)) (= (apply1 lam57 x3) (succ x3))))
(assert
  (forall ((x list2) (z list2))
    (= (apply17 (lam58 x) z) (lmerge (msortbu x) z))))
(assert
  (forall ((x list2) (x4 list2))
    (= (apply17 (lam61 x) x4) (lmerge x x4))))
(assert (forall ((x2 list2)) (= (apply17 lam59 x2) (msortbu x2))))
(assert (forall ((x3 list2)) (= (apply17 lam60 x3) (msortbu x3))))
(assert-not (forall ((xs list2)) (ordered (msortbu xs))))
(assert-claim (ordered nil2))
(assert-claim (= (pairwise nil) nil))
(assert-claim (= (mergingbu nil) nil2))
(assert-claim (= (msortbu nil2) nil2))
(assert-claim
  (forall ((x list2)) (=> (ordered x) (= (msortbu x) x))))
(assert-claim (forall ((x Nat)) (leq x x)))
(assert-claim
  (forall ((x list2) (y list2))
    (=> (ordered y) (=> (ordered x) (= (lmerge y x) (lmerge x y))))))
(assert-claim (forall ((x Nat)) (leq zero x)))
(assert-claim (forall ((x list2)) (= (lmerge x nil2) x)))
(assert-claim (forall ((x list2)) (= (lmerge nil2 x) x)))
(assert-claim (forall ((z fun15)) (= (map8 z nil3) nil3)))
(assert-claim
  (forall ((x list)) (= (mergingbu (pairwise x)) (mergingbu x))))
(assert-claim
  (forall ((x list2)) (= (msortbu (msortbu x)) (msortbu x))))
(assert-claim (forall ((x list2)) (ordered (msortbu x))))
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
  (forall ((x list2) (y list2))
    (= (msortbu (lmerge y x)) (msortbu (lmerge x y)))))
(assert-claim
  (forall ((x list2) (y list2))
    (=> (ordered y)
      (= (msortbu (lmerge x y)) (lmerge (msortbu x) y)))))
(assert-claim
  (forall ((x list2) (y list2))
    (= (ordered (lmerge y x)) (ordered (lmerge x y)))))
(assert-claim
  (forall ((x list2)) (= (ordered (lmerge x x)) (ordered x))))
(assert-claim
  (forall ((x list2) (y list2))
    (=> (ordered x) (= (ordered (lmerge y x)) (ordered y)))))
(assert-claim
  (forall ((x Nat)) (= (msortbu (cons2 x nil2)) (cons2 x nil2))))
(assert-claim
  (forall ((x list2))
    (= (msortbu (cons2 zero x)) (cons2 zero (msortbu x)))))
(assert-claim
  (forall ((x list2)) (= (ordered (cons2 zero x)) (ordered x))))
(assert-claim
  (forall ((x list2)) (= (pairwise (cons x nil)) (cons x nil))))
(assert-claim (forall ((x list)) (= (map3 lam2 x) x)))
(assert-claim
  (forall ((x list))
    (= (mergingbu (map3 lam3 x)) (msortbu (mergingbu x)))))
(assert-claim
  (forall ((x list2))
    (= (msortbu (map5 lam4 x)) (map5 lam5 (msortbu x)))))
(assert-claim
  (forall ((x list2)) (= (ordered (map5 lam6 x)) (ordered x))))
(assert-claim
  (forall ((x list))
    (= (pairwise (map3 lam7 x)) (map3 lam8 (pairwise x)))))
(assert-claim
  (forall ((x list2)) (= (apply17 lam9 x) (apply17 lam10 x))))
(assert-claim
  (forall ((x list2) (y list2) (z list2))
    (= (lmerge (lmerge x y) z) (lmerge x (lmerge y z)))))
(assert-claim
  (forall ((x Nat) (y Nat)) (= (leq (succ x) (succ y)) (leq x y))))
(assert-claim
  (forall ((x list2) (y list2))
    (= (lmerge x (cons2 zero y)) (cons2 zero (lmerge x y)))))
(assert-claim
  (forall ((x Nat) (y list2))
    (=> (ordered y)
      (= (msortbu (cons2 x y)) (lmerge (cons2 x nil2) y)))))
(assert-claim
  (forall ((x list2) (y list2))
    (= (lmerge (cons2 zero x) y) (cons2 zero (lmerge x y)))))
(assert-claim
  (forall ((x list2) (y list2))
    (= (lmerge (msortbu x) (msortbu y)) (msortbu (lmerge x y)))))
(assert-claim
  (forall ((z fun15) (x2 sk))
    (= (map8 z (cons3 x2 nil3)) (cons3 (apply15 z x2) nil3))))
(assert-claim
  (forall ((x Nat) (y list2))
    (= (msortbu (cons2 x (msortbu y))) (msortbu (cons2 x y)))))
(assert-claim
  (forall ((x fun1) (y list2))
    (= (msortbu (map5 x (msortbu y))) (msortbu (map5 x y)))))
(assert-claim
  (forall ((x list))
    (= (pairwise (pairwise (pairwise (pairwise x))))
      (pairwise (pairwise (pairwise x))))))
(assert-claim
  (forall ((x list2) (y list))
    (=> (ordered x)
      (= (map3 lam11 (cons x y)) (cons x (map3 lam12 y))))))
(assert-claim
  (forall ((x Nat))
    (= (map5 lam13 (cons2 x nil2)) (cons2 (succ x) nil2))))
(assert-claim
  (forall ((x list)) (= (map3 lam14 (map3 lam15 x)) (map3 lam16 x))))
(assert-claim
  (forall ((x list))
    (= (mergingbu (map3 lam18 x)) (map5 lam19 (mergingbu x)))))
(assert-claim
  (forall ((x list))
    (= (pairwise (map3 lam21 x)) (map3 lam23 (pairwise x)))))
(assert-claim
  (forall ((x Nat) (y list2))
    (= (ordered (cons2 x (cons2 x y))) (ordered (cons2 x y)))))
(assert-claim
  (forall ((x Nat) (y list2) (z list2))
    (= (ordered (cons2 x (lmerge z y)))
      (ordered (cons2 x (lmerge y z))))))
(assert-claim
  (forall ((x Nat) (y list2))
    (= (ordered (cons2 x (lmerge y y))) (ordered (cons2 x y)))))
(assert-claim
  (forall ((x Nat) (y Nat) (z list2))
    (=> (leq x y)
      (= (ordered (cons2 x (cons2 y z))) (ordered (cons2 y z))))))
(assert-claim
  (forall ((x Nat) (y list2))
    (= (ordered (lmerge y (cons2 x y))) (ordered (cons2 x y)))))
(assert-claim
  (forall ((x list2) (y list2) (z list2))
    (= (ordered (lmerge x (lmerge z y)))
      (ordered (lmerge x (lmerge y z))))))
(assert-claim
  (forall ((x list2) (y list2))
    (= (ordered (lmerge x (lmerge x y))) (ordered (lmerge x y)))))
(assert-claim
  (forall ((x fun1) (y list2))
    (=> (ordered y)
      (= (ordered (map5 x (lmerge y y))) (ordered (map5 x y))))))
(assert-claim
  (forall ((x list2) (y list2) (z list))
    (= (pairwise (cons x (cons y z)))
      (cons (lmerge x y) (pairwise z)))))
(assert-claim
  (forall ((x Nat))
    (= (msortbu (cons2 x (cons2 x nil2))) (cons2 x (cons2 x nil2)))))
(assert-claim
  (forall ((x Nat) (y Nat))
    (=> (leq x y)
      (= (msortbu (cons2 x (cons2 y nil2))) (cons2 x (cons2 y nil2))))))
(assert-claim
  (forall ((x fun13) (y list2))
    (= (msortbu (mergingbu (map2 x (msortbu y))))
      (msortbu (mergingbu (map2 x y))))))
(assert-claim
  (forall ((x Nat) (y Nat))
    (= (leq x y) (ordered (cons2 x (cons2 y nil2))))))
(assert-claim
  (forall ((x list2) (y Nat))
    (=> (ordered x)
      (= (ordered (cons2 y (cons2 zero x))) (leq y zero)))))
(assert-claim
  (forall ((x fun13) (y list2))
    (= (ordered (mergingbu (map2 x (msortbu y))))
      (ordered (mergingbu (map2 x y))))))
(assert-claim
  (forall ((x Nat) (y list2))
    (= (cons2 (succ x) (map5 lam24 y)) (map5 lam25 (cons2 x y)))))
(assert-claim
  (forall ((x list2) (y list))
    (= (cons (msortbu x) (map3 lam26 y)) (map3 lam27 (cons x y)))))
(assert-claim
  (forall ((x Nat) (y Nat) (z list2))
    (=> (leq y x)
      (= (map3 (lam28 y) (cons z nil)) (cons (cons2 y z) nil)))))
(assert-claim
  (forall ((x list2) (y list2))
    (= (map3 (lam29 x) (cons y nil)) (cons (lmerge x y) nil))))
(assert-claim
  (forall ((x list2) (y list2))
    (= (ordered (lmerge x (map5 lam30 y))) (ordered (lmerge x y)))))
(assert-claim
  (forall ((x Nat) (y Nat) (z list))
    (=> (leq y x)
      (= (ordered (mergingbu (map3 (lam31 y) z)))
        (ordered (cons2 y (mergingbu z)))))))
(assert-claim
  (forall ((x list2) (y list))
    (=> (ordered x)
      (= (ordered (mergingbu (map3 (lam32 x) y)))
        (ordered (mergingbu y))))))
(assert-claim
  (forall ((x list2) (y list))
    (=> (ordered x)
      (= (map3 lam33 (map3 (lam34 x) y))
        (map3 (lam35 x) (map3 lam36 y))))))
(assert-claim
  (forall ((x list))
    (= (map3 lam37 (map3 lam38 x)) (map3 lam39 (map3 lam40 x)))))
(assert-claim
  (forall ((x list))
    (= (map3 lam41 (map3 lam43 x)) (map3 lam45 (map3 lam46 x)))))
(assert-claim
  (forall ((z fun15) (x2 sk) (x3 list3))
    (= (cons3 (apply15 z x2) (map8 z x3)) (map8 z (cons3 x2 x3)))))
(assert-claim
  (forall ((x fun16) (y list2))
    (= (ordered (cons2 (apply16 x (msortbu y)) y))
      (ordered (cons2 (apply16 x y) y)))))
(assert-claim
  (forall ((x fun17) (y list2))
    (= (ordered (lmerge y (apply17 x (msortbu y))))
      (ordered (lmerge y (apply17 x y))))))
(assert-claim
  (forall ((x list2) (y Nat) (z list2))
    (= (lmerge (cons2 y x) (cons2 y z))
      (cons2 y (lmerge x (cons2 y z))))))
(assert-claim
  (forall ((y fun14) (z fun12) (x2 list2))
    (= (msortbu (map7 y (map6 z (msortbu x2))))
      (msortbu (map7 y (map6 z x2))))))
(assert-claim
  (forall ((x Nat) (y list2))
    (= (ordered (cons2 x (lmerge y (msortbu y))))
      (ordered (cons2 x y)))))
(assert-claim
  (forall ((x Nat) (y list2))
    (= (ordered (cons2 x (msortbu (cons2 x y))))
      (ordered (cons2 x (msortbu y))))))
(assert-claim
  (forall ((x Nat) (y list2))
    (not (ordered (cons2 (succ x) (cons2 x y))))))
(assert-claim
  (forall ((x fun1) (y list2))
    (= (ordered (lmerge y (map5 x (msortbu y))))
      (ordered (lmerge y (map5 x y))))))
(assert-claim
  (forall ((x fun1) (y list2))
    (= (ordered (map5 x (lmerge y (msortbu y))))
      (ordered (map5 x (lmerge y y))))))
(assert-claim
  (forall ((x fun1) (y list2))
    (= (ordered (map5 x (lmerge (msortbu y) y)))
      (ordered (map5 x (lmerge y y))))))
(assert-claim
  (forall ((x fun13) (y list2))
    (= (ordered (mergingbu (map2 x (lmerge y y))))
      (ordered (mergingbu (map2 x y))))))
(assert-claim
  (forall ((x fun16) (y list))
    (= (msortbu (map4 x (pairwise (pairwise (pairwise y)))))
      (map4 x (pairwise (pairwise (pairwise y)))))))
(assert-claim
  (forall ((x Nat) (y list2))
    (not (ordered (cons2 (succ x) (cons2 zero y))))))
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
  (forall ((x list2) (y list))
    (= (pairwise (pairwise (pairwise (cons x (pairwise y)))))
      (cons (lmerge x (mergingbu y)) nil))))
(assert-claim
  (forall ((x fun17) (y list))
    (= (pairwise (pairwise (pairwise (map3 x (pairwise y)))))
      (pairwise (pairwise (map3 x (pairwise y)))))))
(assert-claim
  (forall ((x list2) (y list))
    (= (msortbu (mergingbu (map3 (lam47 x) y)))
      (msortbu (mergingbu (map3 (lam48 x) y))))))
(assert-claim
  (forall ((x list2) (y list))
    (= (ordered (mergingbu (map3 (lam49 x) (pairwise y))))
      (ordered (mergingbu (map3 (lam50 x) y))))))
(assert-claim
  (forall ((x list))
    (= (ordered (mergingbu (map3 (lam51 x) x)))
      (ordered (mergingbu x)))))
(assert-claim
  (forall ((x list2) (y list2) (z list))
    (= (map3 (lam52 x) (map3 (lam53 y) z)) (map3 (lam54 x y) z))))
(assert-claim
  (forall ((x list2) (y list2))
    (= (lmerge (map5 lam55 x) (map5 lam56 y))
      (map5 lam57 (lmerge x y)))))
(assert-claim
  (forall ((x list2) (y list))
    (= (map3 (lam58 x) (map3 lam59 y))
      (map3 lam60 (map3 (lam61 x) y)))))
