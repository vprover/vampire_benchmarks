(declare-sort sk 0)
(declare-sort fun1 0)
(declare-sort fun12 0)
(declare-sort fun13 0)
(declare-datatype list2 ((nil2) (cons2 (head2 sk) (tail2 list2))))
(declare-datatype Nat ((zero) (succ (p Nat))))
(declare-datatype list ((nil) (cons (head Nat) (tail list))))
(declare-fun lam (Nat) fun1)
(declare-fun lam2 (Nat) fun1)
(declare-fun lam3 (Nat) fun1)
(declare-fun lam4 (Nat) fun1)
(declare-const lam5 fun1)
(declare-const lam6 fun1)
(declare-fun lam7 (Nat) fun1)
(declare-fun lam8 (Nat) fun1)
(declare-fun lam9 (Nat) fun1)
(declare-fun lam10 (Nat) fun1)
(declare-fun lam11 (Nat) fun1)
(declare-fun lam12 (Nat) fun1)
(declare-fun lam13 (Nat) fun1)
(declare-fun lam14 (Nat) fun1)
(declare-fun lam15 (Nat) fun1)
(declare-fun lam16 (Nat) fun1)
(declare-fun lam17 (Nat) fun1)
(declare-fun lam18 (Nat) fun1)
(declare-fun lam19 (Nat) fun1)
(declare-fun lam20 (Nat) fun1)
(declare-fun lam21 (Nat) fun1)
(declare-fun lam22 (Nat) fun1)
(declare-fun lam23 (Nat) fun1)
(declare-fun lam24 (Nat) fun1)
(declare-fun lam25 (Nat) fun1)
(declare-fun lam26 (Nat) fun1)
(declare-fun lam27 (Nat) fun1)
(declare-fun lam28 (Nat) fun1)
(declare-fun lam29 (Nat) fun1)
(declare-fun lam30 (Nat) fun1)
(declare-const lam31 fun1)
(declare-const lam32 fun1)
(declare-fun lam33 (Nat) fun1)
(declare-fun lam34 (Nat) fun1)
(declare-fun lam35 (Nat) fun1)
(declare-fun lam36 (Nat) fun1)
(declare-fun lam37 (Nat) fun1)
(declare-fun lam38 (Nat) fun1)
(declare-fun lam39 (Nat) fun1)
(declare-fun lam40 (Nat) fun1)
(declare-fun lam41 (Nat) fun1)
(declare-fun lam42 (Nat) fun1)
(declare-fun lam43 (Nat) fun1)
(declare-fun lam44 (Nat) fun1)
(declare-fun lam45 (Nat) fun1)
(declare-fun lam46 (Nat) fun1)
(declare-fun lam47 (Nat) fun1)
(declare-const lam48 fun1)
(declare-const lam49 fun1)
(declare-const lam50 fun1)
(declare-const lam51 fun1)
(declare-fun lam52 (Nat) fun1)
(declare-fun lam53 (Nat) fun1)
(declare-fun lam54 (Nat) fun1)
(declare-fun lam55 (Nat) fun1)
(declare-fun lam56 (Nat) fun1)
(declare-fun lam57 (Nat) fun1)
(declare-fun lam58 (Nat) fun1)
(declare-fun lam59 (Nat) fun1)
(declare-fun lam60 (Nat) fun1)
(declare-const lam61 fun1)
(declare-fun lam62 (Nat) fun1)
(declare-fun apply1 (fun1 Nat) Bool)
(declare-fun apply12 (fun12 sk) sk)
(declare-fun apply13 (fun13 sk) Bool)
(define-fun-rec
  lt
  ((x Nat) (y Nat)) Bool
  (match y
    ((zero false)
     ((succ z)
      (match x
        ((zero true)
         ((succ n) (lt n z))))))))
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
  ordered
  ((x list)) Bool
  (match x
    ((nil true)
     ((cons y z)
      (match z
        ((nil true)
         ((cons y2 xs) (and (leq y y2) (ordered (cons y2 xs))))))))))
(define-fun
  gt
  ((x Nat) (y Nat)) Bool (lt y x))
(define-fun-rec
  filter2
  ((q fun13) (x list2)) list2
  (match x
    ((nil2 nil2)
     ((cons2 y xs)
      (ite (apply13 q y) (cons2 y (filter2 q xs)) (filter2 q xs))))))
(define-fun-rec
  filter
  ((q fun1) (x list)) list
  (match x
    ((nil nil)
     ((cons y xs)
      (ite (apply1 q y) (cons y (filter q xs)) (filter q xs))))))
(define-fun-rec
  ++2
  ((x list2) (y list2)) list2
  (match x
    ((nil2 y)
     ((cons2 z xs) (cons2 z (++2 xs y))))))
(define-fun-rec
  ++
  ((x list) (y list)) list
  (match x
    ((nil y)
     ((cons z xs) (cons z (++ xs y))))))
(define-fun-rec
  qsort
  ((x list)) list
  (match x
    ((nil nil)
     ((cons y xs)
      (++ (qsort (filter (lam y) xs))
        (++ (cons y nil) (qsort (filter (lam2 y) xs))))))))
(assert
  (forall ((y Nat) (z Nat)) (= (apply1 (lam y) z) (leq z y))))
(assert
  (forall ((y Nat) (x2 Nat)) (= (apply1 (lam2 y) x2) (gt x2 y))))
(assert
  (forall ((x Nat) (z Nat)) (= (apply1 (lam3 x) z) (lt x z))))
(assert
  (forall ((x Nat) (z Nat))
    (= (apply1 (lam4 x) z) (leq (succ x) z))))
(assert (forall ((y Nat)) (= (apply1 lam5 y) (gt zero y))))
(assert (forall ((y Nat)) (= (apply1 lam6 y) (leq zero y))))
(assert
  (forall ((x Nat) (z Nat)) (= (apply1 (lam7 x) z) (gt x z))))
(assert
  (forall ((x Nat) (x2 Nat)) (= (apply1 (lam8 x) x2) (gt x x2))))
(assert
  (forall ((y Nat) (x2 Nat)) (= (apply1 (lam9 y) x2) (gt y x2))))
(assert
  (forall ((y Nat) (x3 Nat)) (= (apply1 (lam10 y) x3) (gt y x3))))
(assert
  (forall ((y Nat) (x2 Nat)) (= (apply1 (lam11 y) x2) (gt y x2))))
(assert
  (forall ((y Nat) (x3 Nat)) (= (apply1 (lam12 y) x3) (gt y x3))))
(assert
  (forall ((y Nat) (x2 Nat)) (= (apply1 (lam13 y) x2) (gt y x2))))
(assert
  (forall ((y Nat) (x3 Nat)) (= (apply1 (lam14 y) x3) (gt y x3))))
(assert
  (forall ((x Nat) (z Nat)) (= (apply1 (lam15 x) z) (leq x z))))
(assert
  (forall ((x Nat) (x2 Nat)) (= (apply1 (lam16 x) x2) (leq x x2))))
(assert
  (forall ((y Nat) (x2 Nat)) (= (apply1 (lam17 y) x2) (leq y x2))))
(assert
  (forall ((y Nat) (x3 Nat)) (= (apply1 (lam18 y) x3) (leq y x3))))
(assert
  (forall ((y Nat) (x2 Nat)) (= (apply1 (lam19 y) x2) (leq y x2))))
(assert
  (forall ((y Nat) (x3 Nat)) (= (apply1 (lam20 y) x3) (leq y x3))))
(assert
  (forall ((y Nat) (x2 Nat)) (= (apply1 (lam21 y) x2) (leq y x2))))
(assert
  (forall ((y Nat) (x3 Nat)) (= (apply1 (lam22 y) x3) (leq y x3))))
(assert
  (forall ((x Nat) (z Nat)) (= (apply1 (lam23 x) z) (lt x z))))
(assert
  (forall ((x Nat) (x2 Nat)) (= (apply1 (lam24 x) x2) (lt x x2))))
(assert
  (forall ((y Nat) (x2 Nat)) (= (apply1 (lam25 y) x2) (lt y x2))))
(assert
  (forall ((y Nat) (x3 Nat)) (= (apply1 (lam26 y) x3) (lt y x3))))
(assert
  (forall ((y Nat) (x2 Nat)) (= (apply1 (lam27 y) x2) (lt y x2))))
(assert
  (forall ((y Nat) (x3 Nat)) (= (apply1 (lam28 y) x3) (lt y x3))))
(assert
  (forall ((y Nat) (x2 Nat))
    (= (apply1 (lam29 y) x2) (lt (succ y) x2))))
(assert
  (forall ((y Nat) (x3 Nat))
    (= (apply1 (lam30 y) x3) (lt (succ y) x3))))
(assert (forall ((y Nat)) (= (apply1 lam31 y) (gt (succ zero) y))))
(assert (forall ((z Nat)) (= (apply1 lam32 z) (gt (succ zero) z))))
(assert
  (forall ((x Nat) (z Nat))
    (= (apply1 (lam33 x) z) (gt (succ x) z))))
(assert
  (forall ((x Nat) (x2 Nat))
    (= (apply1 (lam34 x) x2) (gt (succ x) x2))))
(assert
  (forall ((x Nat) (z Nat)) (= (apply1 (lam35 x) z) (leq x z))))
(assert
  (forall ((x Nat) (x2 Nat)) (= (apply1 (lam36 x) x2) (leq x x2))))
(assert
  (forall ((x Nat) (z Nat)) (= (apply1 (lam37 x) z) (gt x z))))
(assert
  (forall ((x Nat) (z Nat)) (= (apply1 (lam38 x) z) (leq x z))))
(assert
  (forall ((x Nat) (x2 Nat)) (= (apply1 (lam39 x) x2) (leq x x2))))
(assert
  (forall ((x Nat) (z Nat)) (= (apply1 (lam40 x) z) (lt x z))))
(assert
  (forall ((x Nat) (x2 Nat)) (= (apply1 (lam41 x) x2) (lt x x2))))
(assert
  (forall ((y Nat) (x2 Nat)) (= (apply1 (lam42 y) x2) (leq y x2))))
(assert
  (forall ((y Nat) (x3 Nat)) (= (apply1 (lam43 y) x3) (leq y x3))))
(assert
  (forall ((x Nat) (z Nat)) (= (apply1 (lam44 x) z) (lt x z))))
(assert
  (forall ((x Nat) (x2 Nat)) (= (apply1 (lam45 x) x2) (lt x x2))))
(assert
  (forall ((x Nat) (z Nat))
    (= (apply1 (lam46 x) z) (gt (succ x) z))))
(assert
  (forall ((x Nat) (x2 Nat))
    (= (apply1 (lam47 x) x2) (gt (succ x) x2))))
(assert (forall ((z Nat)) (= (apply1 lam48 z) (lt zero z))))
(assert (forall ((x2 Nat)) (= (apply1 lam49 x2) (lt zero x2))))
(assert (forall ((y Nat)) (= (apply1 lam50 y) (lt zero y))))
(assert
  (forall ((x Nat) (z Nat)) (= (apply1 (lam52 x) z) (leq x z))))
(assert (forall ((y Nat)) (= (apply1 lam51 y) (gt (succ zero) y))))
(assert
  (forall ((x Nat) (z Nat)) (= (apply1 (lam53 x) z) (gt x z))))
(assert
  (forall ((x Nat) (x2 Nat)) (= (apply1 (lam54 x) x2) (leq x x2))))
(assert
  (forall ((x Nat) (z Nat)) (= (apply1 (lam55 x) z) (gt x z))))
(assert
  (forall ((x Nat) (x2 Nat)) (= (apply1 (lam56 x) x2) (lt x x2))))
(assert
  (forall ((x Nat) (z Nat)) (= (apply1 (lam57 x) z) (leq x z))))
(assert
  (forall ((x Nat) (x2 Nat)) (= (apply1 (lam58 x) x2) (lt x x2))))
(assert
  (forall ((x Nat) (x3 Nat)) (= (apply1 (lam59 x) x3) (lt x x3))))
(assert
  (forall ((x Nat) (z Nat)) (= (apply1 (lam60 x) z) (lt x z))))
(assert
  (forall ((x Nat) (x3 Nat)) (= (apply1 (lam62 x) x3) (lt x x3))))
(assert (forall ((x2 Nat)) (= (apply1 lam61 x2) (lt zero x2))))
(assert-not (forall ((xs list)) (ordered (qsort xs))))
(assert-claim (ordered nil))
(assert-claim (forall ((x list)) (=> (ordered x) (= (qsort x) x))))
(assert-claim (forall ((x Nat)) (not (gt x x))))
(assert-claim
  (forall ((x Nat) (y Nat)) (=> (gt y x) (not (gt x y)))))
(assert-claim
  (forall ((x Nat) (y Nat)) (=> (leq x y) (not (gt x y)))))
(assert-claim
  (forall ((x Nat) (y Nat)) (=> (lt x y) (not (gt x y)))))
(assert-claim (forall ((x Nat) (y Nat)) (=> (lt y x) (gt x y))))
(assert-claim (forall ((x Nat)) (leq x x)))
(assert-claim
  (forall ((x Nat) (y Nat)) (=> (gt x y) (not (leq x y)))))
(assert-claim (forall ((x Nat) (y Nat)) (=> (gt y x) (leq x y))))
(assert-claim (forall ((x Nat) (y Nat)) (= (gt y x) (lt x y))))
(assert-claim (forall ((y list2)) (= (++2 y nil2) y)))
(assert-claim (forall ((y list2)) (= (++2 nil2 y) y)))
(assert-claim (forall ((y fun13)) (= (filter2 y nil2) nil2)))
(assert-claim (forall ((x Nat)) (not (gt zero x))))
(assert-claim (forall ((x Nat) (y Nat)) (=> (gt y x) (gt y zero))))
(assert-claim (forall ((x Nat)) (leq zero x)))
(assert-claim (forall ((x list)) (ordered (qsort x))))
(assert-claim
  (forall ((x Nat) (y Nat))
    (= (apply1 (lam3 x) y) (apply1 (lam4 x) y))))
(assert-claim (forall ((x Nat)) (not (gt x (succ x)))))
(assert-claim
  (forall ((x Nat) (y Nat)) (= (leq y x) (gt (succ x) y))))
(assert-claim
  (forall ((x Nat) (y Nat)) (=> (gt y x) (not (gt x (succ y))))))
(assert-claim
  (forall ((x Nat) (y Nat)) (=> (leq x y) (not (gt x (succ y))))))
(assert-claim (forall ((x Nat)) (leq x (succ x))))
(assert-claim
  (forall ((x Nat) (y Nat)) (=> (leq x y) (leq x (succ y)))))
(assert-claim
  (forall ((x fun1) (y list))
    (=> (ordered y) (ordered (filter x y)))))
(assert-claim
  (forall ((x list) (y list)) (= (qsort (++ y x)) (qsort (++ x y)))))
(assert-claim
  (forall ((x fun1) (y list))
    (= (qsort (filter x y)) (filter x (qsort y)))))
(assert-claim (forall ((x Nat)) (ordered (cons x nil))))
(assert-claim
  (forall ((x list)) (= (ordered (cons zero x)) (ordered x))))
(assert-claim
  (forall ((x list))
    (= (qsort (cons zero x)) (cons zero (qsort x)))))
(assert-claim (forall ((x list)) (= (filter lam5 x) nil)))
(assert-claim (forall ((x list)) (= (filter lam6 x) x)))
(assert-claim
  (forall ((y list2) (z list2) (x2 list2))
    (= (++2 (++2 y z) x2) (++2 y (++2 z x2)))))
(assert-claim
  (forall ((y sk) (z list2) (x2 list2))
    (= (cons2 y (++2 z x2)) (++2 (cons2 y z) x2))))
(assert-claim
  (forall ((y fun13) (z fun13) (x2 list2))
    (= (filter2 z (filter2 y x2)) (filter2 y (filter2 z x2)))))
(assert-claim
  (forall ((y fun13) (z list2))
    (= (filter2 y (filter2 y z)) (filter2 y z))))
(assert-claim
  (forall ((x Nat) (y Nat)) (= (gt (succ x) (succ y)) (gt x y))))
(assert-claim
  (forall ((x list))
    (= (ordered (++ x (qsort x))) (ordered (++ x x)))))
(assert-claim
  (forall ((x list))
    (= (ordered (++ (qsort x) x)) (ordered (++ x x)))))
(assert-claim
  (forall ((x list) (y list))
    (= (qsort (++ x (qsort y))) (qsort (++ x y)))))
(assert-claim
  (forall ((x list))
    (= (ordered (++ x (++ x x))) (ordered (++ x x)))))
(assert-claim
  (forall ((x Nat) (y list))
    (= (ordered (cons x (cons x y))) (ordered (cons x y)))))
(assert-claim
  (forall ((x Nat) (y Nat) (z list))
    (=> (gt x y) (not (ordered (cons x (cons y z)))))))
(assert-claim
  (forall ((x Nat) (y Nat) (z list))
    (=> (gt y x)
      (= (ordered (cons x (cons y z))) (ordered (cons y z))))))
(assert-claim
  (forall ((x Nat) (y Nat) (z list))
    (=> (leq x y)
      (= (ordered (cons x (cons y z))) (ordered (cons y z))))))
(assert-claim
  (forall ((x list) (y list))
    (=> (ordered y)
      (= (ordered (++ x (cons zero x)))
        (ordered (++ x (cons zero y)))))))
(assert-claim
  (forall ((x list))
    (= (ordered (++ (qsort x) (qsort x))) (ordered (++ x x)))))
(assert-claim
  (forall ((x Nat) (y Nat))
    (= (leq x y) (ordered (cons x (cons y nil))))))
(assert-claim
  (forall ((x fun1) (y list))
    (= (ordered (filter x (cons zero y))) (ordered (filter x y)))))
(assert-claim
  (forall ((x Nat))
    (= (qsort (cons x (cons x nil))) (cons x (cons x nil)))))
(assert-claim
  (forall ((x Nat) (y Nat))
    (=> (gt y x)
      (= (qsort (cons y (cons x nil))) (cons x (cons y nil))))))
(assert-claim
  (forall ((x Nat) (y Nat))
    (=> (leq x y)
      (= (qsort (cons x (cons y nil))) (cons x (cons y nil))))))
(assert-claim
  (forall ((x Nat) (y list))
    (= (filter (lam7 x) (cons x y)) (filter (lam8 x) y))))
(assert-claim
  (forall ((x Nat) (y Nat) (z list))
    (=> (gt y x)
      (= (filter (lam9 y) (cons x z)) (cons x (filter (lam10 y) z))))))
(assert-claim
  (forall ((x Nat) (y Nat) (z list))
    (=> (gt x y)
      (= (filter (lam11 y) (cons x z)) (filter (lam12 y) z)))))
(assert-claim
  (forall ((x Nat) (y Nat) (z list))
    (=> (leq y x)
      (= (filter (lam13 y) (cons x z)) (filter (lam14 y) z)))))
(assert-claim
  (forall ((x Nat) (y list))
    (= (filter (lam15 x) (cons x y)) (cons x (filter (lam16 x) y)))))
(assert-claim
  (forall ((x Nat) (y Nat) (z list))
    (=> (gt y x)
      (= (filter (lam17 y) (cons x z)) (filter (lam18 y) z)))))
(assert-claim
  (forall ((x Nat) (y Nat) (z list))
    (=> (gt x y)
      (= (filter (lam19 y) (cons x z)) (cons x (filter (lam20 y) z))))))
(assert-claim
  (forall ((x Nat) (y Nat) (z list))
    (=> (leq y x)
      (= (filter (lam21 y) (cons x z)) (cons x (filter (lam22 y) z))))))
(assert-claim
  (forall ((x Nat) (y list))
    (= (filter (lam23 x) (cons x y)) (filter (lam24 x) y))))
(assert-claim
  (forall ((x Nat) (y Nat) (z list))
    (=> (gt x y)
      (= (filter (lam25 y) (cons x z)) (cons x (filter (lam26 y) z))))))
(assert-claim
  (forall ((x Nat) (y Nat) (z list))
    (=> (leq x y)
      (= (filter (lam27 y) (cons x z)) (filter (lam28 y) z)))))
(assert-claim
  (forall ((x Nat) (y Nat) (z list))
    (=> (gt y x)
      (= (filter (lam29 y) (qsort z)) (filter (lam30 y) z)))))
(assert-claim
  (forall ((x list)) (= (filter lam31 (qsort x)) (filter lam32 x))))
(assert-claim
  (forall ((y fun13) (z list2) (x2 list2))
    (= (++2 (filter2 y z) (filter2 y x2)) (filter2 y (++2 z x2)))))
(assert-claim
  (forall ((x list) (y list))
    (= (ordered (++ y (++ x (qsort y)))) (ordered (++ y (++ x y))))))
(assert-claim
  (forall ((x list) (y list))
    (= (ordered (++ x (++ y (qsort y)))) (ordered (++ x (++ y y))))))
(assert-claim
  (forall ((x list) (y list))
    (= (ordered (++ x (++ (qsort x) y))) (ordered (++ x (++ x y))))))
(assert-claim
  (forall ((x list) (y list))
    (= (ordered (++ x (++ (qsort y) y))) (ordered (++ x (++ y y))))))
(assert-claim
  (forall ((x fun1) (y list))
    (= (ordered (++ y (filter x (qsort y))))
      (ordered (++ y (filter x y))))))
(assert-claim
  (forall ((x list) (y list))
    (= (ordered (++ x (qsort (++ x y))))
      (ordered (++ x (++ x (qsort y)))))))
(assert-claim
  (forall ((x list) (y list))
    (= (ordered (++ x (qsort (++ y y)))) (ordered (++ x (qsort y))))))
(assert-claim
  (forall ((x list) (y list))
    (= (ordered (++ (++ (qsort x) x) y)) (ordered (++ x (++ x y))))))
(assert-claim
  (forall ((x list) (y list))
    (= (ordered (++ (++ (qsort y) x) y)) (ordered (++ y (++ x y))))))
(assert-claim
  (forall ((x fun1) (y list))
    (= (ordered (++ (filter x (qsort y)) y))
      (ordered (++ (filter x y) y)))))
(assert-claim
  (forall ((x list) (y list))
    (= (ordered (++ (qsort (++ x x)) y)) (ordered (++ (qsort x) y)))))
(assert-claim
  (forall ((x list) (y list))
    (= (ordered (++ (qsort (++ y x)) y))
      (ordered (++ (++ (qsort x) y) y)))))
(assert-claim
  (forall ((x Nat) (y list))
    (not (ordered (cons (succ x) (cons x y))))))
(assert-claim
  (forall ((x list) (y list))
    (= (ordered (++ (qsort x) (cons zero y)))
      (ordered (++ x (cons zero y))))))
(assert-claim
  (forall ((x Nat) (y list))
    (not (ordered (cons (succ x) (cons zero y))))))
(assert-claim
  (forall ((x Nat) (y list))
    (= (filter (lam33 x) (cons x y)) (cons x (filter (lam34 x) y)))))
(assert-claim
  (forall ((x Nat) (y list))
    (= (filter (lam35 x) (qsort (cons x y)))
      (cons x (filter (lam36 x) (qsort y))))))
(assert-claim
  (forall ((x Nat) (y list))
    (= (ordered (cons x (filter (lam37 x) y)))
      (ordered (cons x (qsort y))))))
(assert-claim
  (forall ((x Nat) (y list))
    (= (ordered (cons x (filter (lam38 x) y)))
      (ordered (filter (lam39 x) y)))))
(assert-claim
  (forall ((x Nat) (y list))
    (= (ordered (cons x (filter (lam40 x) y)))
      (ordered (filter (lam41 x) y)))))
(assert-claim
  (forall ((x Nat) (y Nat) (z list))
    (= (ordered (filter (lam42 y) (cons x z)))
      (ordered (cons x (filter (lam43 y) z))))))
(assert-claim
  (forall ((x Nat) (y list))
    (= (qsort (cons x (filter (lam44 x) y)))
      (cons x (filter (lam45 x) (qsort y))))))
(assert-claim
  (forall ((x Nat) (y list))
    (= (filter (lam46 x) (cons zero y))
      (cons zero (filter (lam47 x) y)))))
(assert-claim
  (forall ((x Nat) (y list))
    (= (filter lam48 (cons (succ x) y))
      (cons (succ x) (filter lam49 y)))))
(assert-claim
  (forall ((x list))
    (= (ordered (++ (filter lam50 x) x)) (ordered (++ x x)))))
(assert-claim
  (forall ((x Nat))
    (= (filter lam51 (cons x nil))
      (filter (lam52 x) (cons zero nil)))))
(assert-claim
  (forall ((x Nat) (y list))
    (= (filter (lam53 x) (filter (lam54 x) y)) nil)))
(assert-claim
  (forall ((x Nat) (y list))
    (= (filter (lam55 x) (filter (lam56 x) y)) nil)))
(assert-claim
  (forall ((x Nat) (y list))
    (= (filter (lam57 x) (filter (lam58 x) y)) (filter (lam59 x) y))))
(assert-claim
  (forall ((x Nat) (y list))
    (= (filter (lam60 x) (filter lam61 y)) (filter (lam62 x) y))))
