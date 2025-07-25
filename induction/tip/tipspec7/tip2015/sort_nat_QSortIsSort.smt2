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
(declare-fun lam31 (Nat) fun1)
(declare-fun lam32 (Nat) fun1)
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
(declare-fun lam48 (Nat) fun1)
(declare-fun lam49 (Nat) fun1)
(declare-fun lam50 (Nat) fun1)
(declare-fun lam51 (Nat) fun1)
(declare-fun lam52 (Nat) fun1)
(declare-fun lam53 (Nat) fun1)
(declare-fun lam54 (Nat) fun1)
(declare-fun lam55 (Nat) fun1)
(declare-fun lam56 (Nat) fun1)
(declare-const lam57 fun1)
(declare-const lam58 fun1)
(declare-fun lam59 (Nat) fun1)
(declare-fun lam60 (Nat) fun1)
(declare-fun lam61 (Nat) fun1)
(declare-fun lam62 (Nat) fun1)
(declare-const lam63 fun1)
(declare-const lam64 fun1)
(declare-fun lam65 (Nat) fun1)
(declare-fun lam66 (Nat) fun1)
(declare-const lam67 fun1)
(declare-const lam68 fun1)
(declare-const lam69 fun1)
(declare-const lam70 fun1)
(declare-fun lam71 (Nat) fun1)
(declare-fun lam72 (Nat) fun1)
(declare-const lam73 fun1)
(declare-fun lam74 (Nat) fun1)
(declare-fun lam75 (Nat) fun1)
(declare-fun lam76 (Nat) fun1)
(declare-fun lam77 (Nat) fun1)
(declare-fun lam78 (Nat) fun1)
(declare-fun lam79 (Nat) fun1)
(declare-fun lam80 (Nat) fun1)
(declare-fun lam81 (Nat) fun1)
(declare-fun lam82 (Nat) fun1)
(declare-const lam83 fun1)
(declare-fun lam84 (Nat) fun1)
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
  insert2
  ((x Nat) (y list)) list
  (match y
    ((nil (cons x nil))
     ((cons z xs)
      (ite (leq x z) (cons x (cons z xs)) (cons z (insert2 x xs)))))))
(define-fun-rec
  isort
  ((x list)) list
  (match x
    ((nil nil)
     ((cons y xs) (insert2 y (isort xs))))))
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
  (forall ((x Nat) (z Nat)) (= (apply1 (lam9 x) z) (gt x z))))
(assert
  (forall ((x Nat) (x2 Nat)) (= (apply1 (lam10 x) x2) (gt x x2))))
(assert
  (forall ((y Nat) (x2 Nat)) (= (apply1 (lam11 y) x2) (gt y x2))))
(assert
  (forall ((y Nat) (x3 Nat)) (= (apply1 (lam12 y) x3) (gt y x3))))
(assert
  (forall ((y Nat) (x2 Nat)) (= (apply1 (lam13 y) x2) (gt y x2))))
(assert
  (forall ((y Nat) (x3 Nat)) (= (apply1 (lam14 y) x3) (gt y x3))))
(assert
  (forall ((y Nat) (x2 Nat)) (= (apply1 (lam15 y) x2) (gt y x2))))
(assert
  (forall ((y Nat) (x3 Nat)) (= (apply1 (lam16 y) x3) (gt y x3))))
(assert
  (forall ((y Nat) (x2 Nat)) (= (apply1 (lam17 y) x2) (gt y x2))))
(assert
  (forall ((y Nat) (x3 Nat)) (= (apply1 (lam18 y) x3) (gt y x3))))
(assert
  (forall ((y Nat) (x2 Nat)) (= (apply1 (lam19 y) x2) (gt y x2))))
(assert
  (forall ((y Nat) (x3 Nat)) (= (apply1 (lam20 y) x3) (gt y x3))))
(assert
  (forall ((x Nat) (z Nat)) (= (apply1 (lam21 x) z) (leq x z))))
(assert
  (forall ((x Nat) (x2 Nat)) (= (apply1 (lam22 x) x2) (leq x x2))))
(assert
  (forall ((x Nat) (z Nat)) (= (apply1 (lam23 x) z) (leq x z))))
(assert
  (forall ((x Nat) (x2 Nat)) (= (apply1 (lam24 x) x2) (leq x x2))))
(assert
  (forall ((y Nat) (x2 Nat)) (= (apply1 (lam25 y) x2) (leq y x2))))
(assert
  (forall ((y Nat) (x3 Nat)) (= (apply1 (lam26 y) x3) (leq y x3))))
(assert
  (forall ((y Nat) (x2 Nat)) (= (apply1 (lam27 y) x2) (leq y x2))))
(assert
  (forall ((y Nat) (x3 Nat)) (= (apply1 (lam28 y) x3) (leq y x3))))
(assert
  (forall ((y Nat) (x2 Nat)) (= (apply1 (lam29 y) x2) (leq y x2))))
(assert
  (forall ((y Nat) (x3 Nat)) (= (apply1 (lam30 y) x3) (leq y x3))))
(assert
  (forall ((y Nat) (x2 Nat)) (= (apply1 (lam31 y) x2) (leq y x2))))
(assert
  (forall ((y Nat) (x3 Nat)) (= (apply1 (lam32 y) x3) (leq y x3))))
(assert
  (forall ((x Nat) (x2 Nat)) (= (apply1 (lam33 x) x2) (leq x x2))))
(assert
  (forall ((x Nat) (x3 Nat)) (= (apply1 (lam34 x) x3) (leq x x3))))
(assert
  (forall ((x Nat) (z Nat)) (= (apply1 (lam35 x) z) (lt x z))))
(assert
  (forall ((x Nat) (x2 Nat)) (= (apply1 (lam36 x) x2) (lt x x2))))
(assert
  (forall ((y Nat) (x2 Nat)) (= (apply1 (lam37 y) x2) (lt y x2))))
(assert
  (forall ((y Nat) (x3 Nat)) (= (apply1 (lam38 y) x3) (lt y x3))))
(assert
  (forall ((y Nat) (x2 Nat)) (= (apply1 (lam39 y) x2) (lt y x2))))
(assert
  (forall ((y Nat) (x3 Nat)) (= (apply1 (lam40 y) x3) (lt y x3))))
(assert
  (forall ((x Nat) (z Nat)) (= (apply1 (lam41 x) z) (leq x z))))
(assert
  (forall ((x Nat) (x2 Nat)) (= (apply1 (lam42 x) x2) (leq x x2))))
(assert
  (forall ((x Nat) (z Nat)) (= (apply1 (lam43 x) z) (lt x z))))
(assert
  (forall ((x Nat) (x2 Nat)) (= (apply1 (lam44 x) x2) (lt x x2))))
(assert
  (forall ((x Nat) (x2 Nat)) (= (apply1 (lam45 x) x2) (leq x x2))))
(assert
  (forall ((x Nat) (x3 Nat)) (= (apply1 (lam46 x) x3) (leq x x3))))
(assert
  (forall ((x Nat) (x2 Nat)) (= (apply1 (lam47 x) x2) (lt x x2))))
(assert
  (forall ((x Nat) (x3 Nat)) (= (apply1 (lam48 x) x3) (lt x x3))))
(assert
  (forall ((y Nat) (x2 Nat)) (= (apply1 (lam49 y) x2) (leq y x2))))
(assert
  (forall ((y Nat) (x3 Nat)) (= (apply1 (lam50 y) x3) (leq y x3))))
(assert
  (forall ((y Nat) (x2 Nat)) (= (apply1 (lam51 y) x2) (leq y x2))))
(assert
  (forall ((y Nat) (x3 Nat)) (= (apply1 (lam52 y) x3) (leq y x3))))
(assert
  (forall ((x Nat) (x2 Nat)) (= (apply1 (lam53 x) x2) (leq x x2))))
(assert
  (forall ((x Nat) (x3 Nat)) (= (apply1 (lam54 x) x3) (leq x x3))))
(assert
  (forall ((y Nat) (x2 Nat))
    (= (apply1 (lam55 y) x2) (lt (succ y) x2))))
(assert
  (forall ((y Nat) (x3 Nat))
    (= (apply1 (lam56 y) x3) (lt (succ y) x3))))
(assert (forall ((y Nat)) (= (apply1 lam57 y) (gt (succ zero) y))))
(assert (forall ((z Nat)) (= (apply1 lam58 z) (gt (succ zero) z))))
(assert
  (forall ((x Nat) (z Nat))
    (= (apply1 (lam59 x) z) (gt (succ x) z))))
(assert
  (forall ((x Nat) (x2 Nat))
    (= (apply1 (lam60 x) x2) (gt (succ x) x2))))
(assert
  (forall ((x Nat) (z Nat))
    (= (apply1 (lam61 x) z) (gt (succ x) z))))
(assert
  (forall ((x Nat) (x2 Nat))
    (= (apply1 (lam62 x) x2) (gt (succ x) x2))))
(assert (forall ((z Nat)) (= (apply1 lam63 z) (gt (succ zero) z))))
(assert
  (forall ((x2 Nat)) (= (apply1 lam64 x2) (gt (succ zero) x2))))
(assert
  (forall ((x Nat) (z Nat)) (= (apply1 (lam65 x) z) (lt x z))))
(assert
  (forall ((x Nat) (x2 Nat)) (= (apply1 (lam66 x) x2) (lt x x2))))
(assert (forall ((z Nat)) (= (apply1 lam67 z) (lt zero z))))
(assert (forall ((x2 Nat)) (= (apply1 lam68 x2) (lt zero x2))))
(assert (forall ((z Nat)) (= (apply1 lam69 z) (lt zero z))))
(assert (forall ((x2 Nat)) (= (apply1 lam70 x2) (lt zero x2))))
(assert
  (forall ((x Nat) (z Nat)) (= (apply1 (lam71 x) z) (lt x z))))
(assert
  (forall ((x Nat) (x2 Nat)) (= (apply1 (lam72 x) x2) (lt x x2))))
(assert
  (forall ((x Nat) (z Nat)) (= (apply1 (lam74 x) z) (leq x z))))
(assert (forall ((y Nat)) (= (apply1 lam73 y) (gt (succ zero) y))))
(assert
  (forall ((x Nat) (z Nat)) (= (apply1 (lam75 x) z) (gt x z))))
(assert
  (forall ((x Nat) (x2 Nat)) (= (apply1 (lam76 x) x2) (leq x x2))))
(assert
  (forall ((x Nat) (z Nat)) (= (apply1 (lam77 x) z) (gt x z))))
(assert
  (forall ((x Nat) (x2 Nat)) (= (apply1 (lam78 x) x2) (lt x x2))))
(assert
  (forall ((x Nat) (z Nat)) (= (apply1 (lam79 x) z) (leq x z))))
(assert
  (forall ((x Nat) (x2 Nat)) (= (apply1 (lam80 x) x2) (lt x x2))))
(assert
  (forall ((x Nat) (x3 Nat)) (= (apply1 (lam81 x) x3) (lt x x3))))
(assert
  (forall ((x Nat) (z Nat)) (= (apply1 (lam82 x) z) (lt x z))))
(assert
  (forall ((x Nat) (x3 Nat)) (= (apply1 (lam84 x) x3) (lt x x3))))
(assert (forall ((x2 Nat)) (= (apply1 lam83 x2) (lt zero x2))))
(assert-not (forall ((xs list)) (= (qsort xs) (isort xs))))
(assert-claim (= (isort nil) nil))
(assert-claim (forall ((x list)) (= (isort x) (qsort x))))
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
(assert-claim (forall ((x Nat)) (= (insert2 x nil) (cons x nil))))
(assert-claim
  (forall ((x list)) (= (insert2 zero x) (cons zero x))))
(assert-claim (forall ((x list)) (= (isort (isort x)) (isort x))))
(assert-claim (forall ((x Nat)) (leq zero x)))
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
(assert-claim
  (forall ((x list) (y list)) (= (isort (++ y x)) (isort (++ x y)))))
(assert-claim
  (forall ((x Nat) (y list))
    (= (isort (cons x y)) (insert2 x (isort y)))))
(assert-claim
  (forall ((x fun1) (y list))
    (= (isort (filter x y)) (filter x (isort y)))))
(assert-claim
  (forall ((x Nat) (y list))
    (= (isort (insert2 x y)) (insert2 x (isort y)))))
(assert-claim (forall ((x Nat)) (leq x (succ x))))
(assert-claim
  (forall ((x Nat) (y Nat)) (=> (leq x y) (leq x (succ y)))))
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
  (forall ((x Nat) (y list))
    (= (insert2 x (cons x y)) (cons x (cons x y)))))
(assert-claim
  (forall ((x Nat) (y Nat) (z list))
    (= (insert2 y (insert2 x z)) (insert2 x (insert2 y z)))))
(assert-claim
  (forall ((x Nat) (y Nat) (z list))
    (=> (gt y x) (= (insert2 y (cons x z)) (cons x (insert2 y z))))))
(assert-claim
  (forall ((x Nat) (y Nat) (z list))
    (=> (gt y x) (= (insert2 x (cons y z)) (cons x (cons y z))))))
(assert-claim
  (forall ((x Nat) (y Nat) (z list))
    (=> (leq x y) (= (insert2 x (cons y z)) (cons x (cons y z))))))
(assert-claim
  (forall ((x Nat) (y Nat)) (= (gt (succ x) (succ y)) (gt x y))))
(assert-claim
  (forall ((x list) (y list))
    (= (isort (++ x (isort y))) (isort (++ x y)))))
(assert-claim
  (forall ((x Nat) (y list))
    (= (insert2 (succ x) (cons x y)) (cons x (insert2 (succ x) y)))))
(assert-claim
  (forall ((x Nat) (y Nat) (z list))
    (=> (gt y x)
      (= (insert2 (succ x) (cons y z)) (cons (succ x) (cons y z))))))
(assert-claim
  (forall ((x Nat) (y Nat) (z list))
    (=> (leq x y)
      (= (insert2 (succ y) (cons x z)) (cons x (insert2 (succ y) z))))))
(assert-claim
  (forall ((x Nat) (y list))
    (= (filter (lam7 x) (cons x y)) (filter (lam8 x) y))))
(assert-claim
  (forall ((x Nat) (y list))
    (= (filter (lam9 x) (insert2 x y)) (filter (lam10 x) y))))
(assert-claim
  (forall ((x Nat) (y Nat) (z list))
    (=> (gt y x)
      (= (filter (lam11 y) (cons x z)) (cons x (filter (lam12 y) z))))))
(assert-claim
  (forall ((x Nat) (y Nat) (z list))
    (=> (gt x y)
      (= (filter (lam13 y) (cons x z)) (filter (lam14 y) z)))))
(assert-claim
  (forall ((x Nat) (y Nat) (z list))
    (=> (gt x y)
      (= (filter (lam15 y) (insert2 x z)) (filter (lam16 y) z)))))
(assert-claim
  (forall ((x Nat) (y Nat) (z list))
    (=> (leq y x)
      (= (filter (lam17 y) (cons x z)) (filter (lam18 y) z)))))
(assert-claim
  (forall ((x Nat) (y Nat) (z list))
    (=> (leq y x)
      (= (filter (lam19 y) (insert2 x z)) (filter (lam20 y) z)))))
(assert-claim
  (forall ((x Nat) (y list))
    (= (filter (lam21 x) (cons x y)) (cons x (filter (lam22 x) y)))))
(assert-claim
  (forall ((x Nat) (y list))
    (= (filter (lam23 x) (insert2 x y))
      (cons x (filter (lam24 x) y)))))
(assert-claim
  (forall ((x Nat) (y Nat) (z list))
    (=> (gt y x)
      (= (filter (lam25 y) (cons x z)) (filter (lam26 y) z)))))
(assert-claim
  (forall ((x Nat) (y Nat) (z list))
    (=> (gt y x)
      (= (filter (lam27 y) (insert2 x z)) (filter (lam28 y) z)))))
(assert-claim
  (forall ((x Nat) (y Nat) (z list))
    (=> (gt x y)
      (= (filter (lam29 y) (cons x z)) (cons x (filter (lam30 y) z))))))
(assert-claim
  (forall ((x Nat) (y Nat) (z list))
    (=> (leq y x)
      (= (filter (lam31 y) (cons x z)) (cons x (filter (lam32 y) z))))))
(assert-claim
  (forall ((x Nat) (y Nat) (z list))
    (=> (leq y x)
      (= (filter (lam33 x) (insert2 y z))
        (filter (lam34 x) (cons y z))))))
(assert-claim
  (forall ((x Nat) (y list))
    (= (filter (lam35 x) (cons x y)) (filter (lam36 x) y))))
(assert-claim
  (forall ((x Nat) (y Nat) (z list))
    (=> (gt x y)
      (= (filter (lam37 y) (cons x z)) (cons x (filter (lam38 y) z))))))
(assert-claim
  (forall ((x Nat) (y Nat) (z list))
    (=> (leq x y)
      (= (filter (lam39 y) (cons x z)) (filter (lam40 y) z)))))
(assert-claim
  (forall ((x Nat) (y list))
    (= (insert2 x (filter (lam41 x) y))
      (cons x (filter (lam42 x) y)))))
(assert-claim
  (forall ((x Nat) (y list))
    (= (insert2 x (filter (lam43 x) y))
      (cons x (filter (lam44 x) y)))))
(assert-claim
  (forall ((x Nat) (y Nat) (z list))
    (=> (gt y x)
      (= (insert2 y (filter (lam45 x) z))
        (filter (lam46 x) (insert2 y z))))))
(assert-claim
  (forall ((x Nat) (y Nat) (z list))
    (=> (gt y x)
      (= (insert2 y (filter (lam47 x) z))
        (filter (lam48 x) (insert2 y z))))))
(assert-claim
  (forall ((x Nat) (y Nat) (z list))
    (=> (gt y x)
      (= (insert2 x (filter (lam49 y) z))
        (cons x (filter (lam50 y) z))))))
(assert-claim
  (forall ((x Nat) (y Nat) (z list))
    (=> (leq x y)
      (= (insert2 x (filter (lam51 y) z))
        (cons x (filter (lam52 y) z))))))
(assert-claim
  (forall ((x Nat) (y Nat) (z list))
    (=> (leq x y)
      (= (insert2 y (filter (lam53 x) z))
        (filter (lam54 x) (insert2 y z))))))
(assert-claim
  (forall ((x Nat) (y Nat) (z list))
    (=> (gt y x)
      (= (filter (lam55 y) (isort z)) (filter (lam56 y) z)))))
(assert-claim
  (forall ((x list)) (= (filter lam57 (isort x)) (filter lam58 x))))
(assert-claim
  (forall ((y fun13) (z list2) (x2 list2))
    (= (++2 (filter2 y z) (filter2 y x2)) (filter2 y (++2 z x2)))))
(assert-claim
  (forall ((x list) (y Nat) (z list))
    (= (insert2 y (++ x (cons y z))) (++ (insert2 y x) (cons y z)))))
(assert-claim
  (forall ((x Nat) (y list) (z list))
    (= (insert2 x (++ (insert2 x y) z))
      (++ (insert2 x (insert2 x y)) z))))
(assert-claim
  (forall ((x fun1) (y Nat))
    (= (insert2 y (filter x (cons y nil)))
      (cons y (filter x (cons y nil))))))
(assert-claim
  (forall ((x Nat) (y list))
    (= (insert2 (succ zero) (cons (succ x) y))
      (cons (succ zero) (cons (succ x) y)))))
(assert-claim
  (forall ((x Nat) (y list))
    (= (filter (lam59 x) (cons x y)) (cons x (filter (lam60 x) y)))))
(assert-claim
  (forall ((x Nat) (y list))
    (= (filter (lam61 x) (cons zero y))
      (cons zero (filter (lam62 x) y)))))
(assert-claim
  (forall ((x Nat) (y list))
    (= (filter lam63 (insert2 x y)) (filter lam64 (cons x y)))))
(assert-claim
  (forall ((x Nat) (y list))
    (= (filter (lam65 x) (insert2 (succ zero) y))
      (filter (lam66 x) (cons (succ zero) y)))))
(assert-claim
  (forall ((x Nat) (y list))
    (= (filter lam67 (cons (succ x) y))
      (cons (succ x) (filter lam68 y)))))
(assert-claim
  (forall ((x Nat) (y list))
    (= (insert2 (succ x) (filter lam69 y))
      (filter lam70 (insert2 (succ x) y)))))
(assert-claim
  (forall ((x Nat) (y list))
    (= (insert2 (succ zero) (filter (lam71 x) y))
      (cons (succ zero) (filter (lam72 x) y)))))
(assert-claim
  (forall ((x Nat))
    (= (filter lam73 (cons x nil))
      (filter (lam74 x) (cons zero nil)))))
(assert-claim
  (forall ((x Nat) (y list))
    (= (filter (lam75 x) (filter (lam76 x) y)) nil)))
(assert-claim
  (forall ((x Nat) (y list))
    (= (filter (lam77 x) (filter (lam78 x) y)) nil)))
(assert-claim
  (forall ((x Nat) (y list))
    (= (filter (lam79 x) (filter (lam80 x) y)) (filter (lam81 x) y))))
(assert-claim
  (forall ((x Nat) (y list))
    (= (filter (lam82 x) (filter lam83 y)) (filter (lam84 x) y))))
