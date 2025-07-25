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
(declare-fun apply1 (fun1 Nat) Bool)
(declare-fun apply12 (fun12 sk) sk)
(declare-fun apply13 (fun13 sk) Bool)
(define-fun-rec
  plus
  ((x Nat) (y Nat)) Nat
  (match x
    ((zero y)
     ((succ z) (succ (plus z y))))))
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
  count2
  ((x sk) (y list2)) Nat
  (match y
    ((nil2 zero)
     ((cons2 z ys)
      (ite (= x z) (plus (succ zero) (count2 x ys)) (count2 x ys))))))
(define-fun-rec
  count
  ((x Nat) (y list)) Nat
  (match y
    ((nil zero)
     ((cons z ys)
      (ite (= x z) (plus (succ zero) (count x ys)) (count x ys))))))
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
  (forall ((x Nat) (y Nat) (z Nat))
    (= (plus x (plus y z)) (plus (plus x y) z))))
(assert (forall ((x Nat) (y Nat)) (= (plus x y) (plus y x))))
(assert (forall ((x Nat)) (= (plus x zero) x)))
(assert (forall ((x Nat)) (= (plus zero x) x)))
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
  (forall ((x Nat) (z Nat)) (= (apply1 (lam8 x) z) (leq x z))))
(assert
  (forall ((y Nat) (x2 Nat)) (= (apply1 (lam9 y) x2) (gt y x2))))
(assert
  (forall ((x Nat) (x2 Nat)) (= (apply1 (lam10 x) x2) (leq x x2))))
(assert
  (forall ((x Nat) (z Nat)) (= (apply1 (lam11 x) z) (gt x z))))
(assert
  (forall ((x Nat) (x2 Nat)) (= (apply1 (lam12 x) x2) (gt x x2))))
(assert
  (forall ((y Nat) (x2 Nat)) (= (apply1 (lam13 y) x2) (gt y x2))))
(assert
  (forall ((y Nat) (x3 Nat)) (= (apply1 (lam14 y) x3) (gt y x3))))
(assert
  (forall ((x Nat) (z Nat)) (= (apply1 (lam15 x) z) (gt x z))))
(assert
  (forall ((x Nat) (x2 Nat)) (= (apply1 (lam16 x) x2) (leq x x2))))
(assert-not
  (forall ((x Nat) (xs list)) (= (count x (qsort xs)) (count x xs))))
(assert-claim (= (qsort nil) nil))
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
(assert-claim (forall ((x Nat) (y Nat)) (= (plus y x) (plus x y))))
(assert-claim (forall ((y list2)) (= (++2 y nil2) y)))
(assert-claim (forall ((y list2)) (= (++2 nil2 y) y)))
(assert-claim (forall ((y sk)) (= (count2 y nil2) zero)))
(assert-claim (forall ((y fun13)) (= (filter2 y nil2) nil2)))
(assert-claim (forall ((x Nat)) (not (gt zero x))))
(assert-claim (forall ((x Nat) (y Nat)) (=> (gt y x) (gt y zero))))
(assert-claim (forall ((x Nat)) (leq zero x)))
(assert-claim (forall ((x Nat)) (= (plus x zero) x)))
(assert-claim (forall ((x list)) (= (qsort (qsort x)) (qsort x))))
(assert-claim
  (forall ((x Nat) (y Nat))
    (= (apply1 (lam3 x) y) (apply1 (lam4 x) y))))
(assert-claim
  (forall ((x Nat) (y list)) (= (count x (qsort y)) (count x y))))
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
  (forall ((x Nat) (y Nat)) (= (plus x (succ y)) (succ (plus x y)))))
(assert-claim
  (forall ((x list) (y list)) (= (qsort (++ y x)) (qsort (++ x y)))))
(assert-claim
  (forall ((x fun1) (y list))
    (= (qsort (filter x y)) (filter x (qsort y)))))
(assert-claim
  (forall ((x Nat)) (= (qsort (cons x nil)) (cons x nil))))
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
  (forall ((y sk) (z list2) (x2 list2))
    (= (count2 y (++2 x2 z)) (count2 y (++2 z x2)))))
(assert-claim
  (forall ((y sk) (z list2))
    (= (count2 y (cons2 y z)) (succ (count2 y z)))))
(assert-claim
  (forall ((x Nat) (y Nat) (z list))
    (=> (gt y x) (= (count y (cons x z)) (count y z)))))
(assert-claim
  (forall ((x Nat) (y Nat) (z list))
    (=> (gt x y) (= (count y (cons x z)) (count y z)))))
(assert-claim
  (forall ((y fun13) (z fun13) (x2 list2))
    (= (filter2 z (filter2 y x2)) (filter2 y (filter2 z x2)))))
(assert-claim
  (forall ((y fun13) (z list2))
    (= (filter2 y (filter2 y z)) (filter2 y z))))
(assert-claim (forall ((x Nat) (y Nat)) (not (gt x (plus x y)))))
(assert-claim
  (forall ((x Nat) (y Nat) (z list) (x2 Nat))
    (=> (gt x2 y)
      (=> (gt y x) (= (gt (count x2 z) y) (gt (count y z) x2))))))
(assert-claim
  (forall ((x Nat) (y Nat) (z Nat) (x2 Nat) (x3 list) (x4 Nat))
    (=> (gt x2 x)
      (=> (lt x z)
        (=> (lt y x4) (= (gt (count x2 x3) z) (gt (count x2 x3) x4)))))))
(assert-claim
  (forall ((x Nat) (y Nat) (z Nat) (x2 Nat) (x3 list) (x4 Nat))
    (=> (gt z y)
      (=> (gt x2 x)
        (=> (lt y x4) (= (gt (count z x3) x4) (gt (count x2 x3) x4)))))))
(assert-claim
  (forall
    ((x Nat) (y Nat) (z Nat) (x2 list) (x3 Nat) (x4 list) (x5 Nat))
    (=> (gt z y)
      (=> (gt x3 x)
        (=> (lt y x5) (= (gt (count z x2) x5) (gt (count x3 x4) x5)))))))
(assert-claim
  (forall ((x Nat) (y Nat) (z Nat))
    (=> (gt z x) (not (gt x (plus y z))))))
(assert-claim
  (forall ((x Nat) (y Nat) (z Nat))
    (=> (leq x z) (not (gt x (plus y z))))))
(assert-claim
  (forall ((x Nat) (y Nat)) (= (gt (plus y x) x) (gt y zero))))
(assert-claim
  (forall ((x Nat) (y Nat) (z Nat)) (=> (gt y z) (gt (plus x y) z))))
(assert-claim
  (forall ((x Nat) (y Nat) (z Nat))
    (=> (gt x z) (=> (leq z y) (gt (plus x y) z)))))
(assert-claim
  (forall ((x Nat) (y Nat))
    (=> (leq x y) (= (gt (plus y y) x) (gt y zero)))))
(assert-claim
  (forall ((x Nat) (y Nat) (z list) (x2 Nat))
    (=> (gt x2 y)
      (=> (gt y x) (= (leq (count x2 z) y) (leq (count y z) x2))))))
(assert-claim
  (forall ((x Nat) (y Nat) (z Nat) (x2 Nat) (x3 list) (x4 Nat))
    (=> (gt x2 x)
      (=> (lt x z)
        (=> (lt y x4) (= (leq (count x2 x3) z) (leq (count x2 x3) x4)))))))
(assert-claim
  (forall ((x Nat) (y Nat) (z Nat) (x2 Nat) (x3 list) (x4 Nat))
    (=> (gt z y)
      (=> (gt x2 x)
        (=> (lt y x4) (= (leq (count z x3) x4) (leq (count x2 x3) x4)))))))
(assert-claim
  (forall ((x Nat) (y Nat) (z Nat))
    (=> (leq x z) (leq x (plus y z)))))
(assert-claim
  (forall ((x Nat) (y Nat)) (= (leq (plus y x) x) (leq y zero))))
(assert-claim
  (forall ((x Nat) (y Nat))
    (=> (leq x y) (= (leq (plus y y) x) (leq y zero)))))
(assert-claim
  (forall ((x Nat) (y Nat) (z Nat))
    (= (plus (plus x y) z) (plus x (plus y z)))))
(assert-claim
  (forall ((y sk) (z sk))
    (= (count2 z (cons2 y nil2)) (count2 y (cons2 z nil2)))))
(assert-claim
  (forall ((x Nat) (y Nat)) (= (gt (succ x) (succ y)) (gt x y))))
(assert-claim
  (forall ((x Nat) (y Nat))
    (=> (leq x y) (= (gt (plus x y) zero) (gt y zero)))))
(assert-claim
  (forall ((x Nat) (y Nat))
    (=> (leq x y) (= (leq (plus x y) zero) (leq y zero)))))
(assert-claim
  (forall ((x list) (y list))
    (= (qsort (++ x (qsort y))) (qsort (++ x y)))))
(assert-claim
  (forall ((x Nat) (y list))
    (= (count x (cons (succ x) y)) (count x y))))
(assert-claim
  (forall ((x Nat) (y list))
    (= (count (succ x) (cons x y)) (count (succ x) y))))
(assert-claim
  (forall ((x Nat) (y Nat) (z list))
    (=> (leq x y) (= (count (succ y) (cons x z)) (count (succ y) z)))))
(assert-claim
  (forall ((x Nat) (y Nat) (z list))
    (=> (leq y x) (= (count y (cons (succ x) z)) (count y z)))))
(assert-claim
  (forall ((x Nat) (y Nat) (z list) (x2 Nat))
    (=> (lt x x2) (not (gt (count y z) (succ x2))))))
(assert-claim
  (forall ((x Nat) (y Nat) (z list) (x2 Nat))
    (=> (gt y x2) (=> (gt x2 x) (not (gt (count (succ y) z) x2))))))
(assert-claim
  (forall ((x Nat) (y list) (z Nat))
    (=> (gt z x) (= (gt (count (succ x) y) z) (gt (count z y) z)))))
(assert-claim
  (forall ((x Nat))
    (= (qsort (cons x (cons x nil))) (cons x (cons x nil)))))
(assert-claim
  (forall ((x Nat) (y Nat))
    (=> (gt y x)
      (= (qsort (cons y (cons x nil))) (cons x (cons y nil))))))
(assert-claim
  (forall ((x Nat) (y list)) (= (count x (filter (lam7 x) y)) zero)))
(assert-claim
  (forall ((x Nat) (y list))
    (= (count x (filter (lam8 x) y)) (count x y))))
(assert-claim
  (forall ((x Nat) (y Nat) (z list))
    (=> (gt x y) (= (count x (filter (lam9 y) z)) zero))))
(assert-claim
  (forall ((x Nat) (y Nat) (z list))
    (=> (gt y x) (= (count y (filter (lam10 x) z)) (count y z)))))
(assert-claim
  (forall ((x Nat) (y list))
    (= (filter (lam11 x) (cons x y)) (filter (lam12 x) y))))
(assert-claim
  (forall ((x Nat) (y Nat) (z list))
    (=> (gt y x)
      (= (filter (lam13 y) (cons x z)) (cons x (filter (lam14 y) z))))))
(assert-claim
  (forall ((y fun13) (z list2) (x2 list2))
    (= (++2 (filter2 y z) (filter2 y x2)) (filter2 y (++2 z x2)))))
(assert-claim
  (forall ((y sk) (z list2) (x2 sk) (x3 list2))
    (= (count2 y (++2 x3 (cons2 x2 z)))
      (count2 y (++2 z (cons2 x2 x3))))))
(assert-claim
  (forall ((y sk) (z list2) (x2 list2))
    (= (plus (count2 y z) (count2 y x2)) (count2 y (++2 z x2)))))
(assert-claim
  (forall ((y sk) (z sk))
    (= (count2 z (cons2 y (cons2 y nil2)))
      (count2 y (cons2 z (cons2 z nil2))))))
(assert-claim
  (forall ((x Nat) (y list))
    (= (filter (lam15 x) (filter (lam16 x) y)) nil)))
