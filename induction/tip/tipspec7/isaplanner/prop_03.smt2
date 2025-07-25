(declare-sort sk 0)
(declare-datatype list2 ((nil2) (cons2 (head2 sk) (tail2 list2))))
(declare-datatype Nat ((Z) (S (proj1-S Nat))))
(declare-datatype list ((nil) (cons (head Nat) (tail list))))
(define-fun-rec
  ==
  ((x Nat) (y Nat)) Bool
  (match x
    ((Z
      (match y
        ((Z true)
         ((S z) false))))
     ((S x2)
      (match y
        ((Z false)
         ((S y2) (== x2 y2))))))))
(define-fun-rec
  count
  ((x Nat) (y list)) Nat
  (match y
    ((nil Z)
     ((cons z ys) (ite (== x z) (S (count x ys)) (count x ys))))))
(define-fun-rec
  <=2
  ((x Nat) (y Nat)) Bool
  (match x
    ((Z true)
     ((S z)
      (match y
        ((Z false)
         ((S x2) (<=2 z x2))))))))
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
(assert-not
  (forall ((n Nat) (xs list) (ys list))
    (<=2 (count n xs) (count n (++ xs ys)))))
(assert-claim (forall ((x Nat) (y Nat)) (=> (== y x) (= x y))))
(assert-claim (forall ((x Nat)) (<=2 x x)))
(assert-claim (forall ((x Nat) (y Nat)) (= (== y x) (== x y))))
(assert-claim (forall ((x Nat)) (== x x)))
(assert-claim
  (forall ((x Nat) (y Nat)) (=> (<=2 x y) (= (<=2 y x) (== x y)))))
(assert-claim (forall ((y list2)) (= (++2 y nil2) y)))
(assert-claim (forall ((y list2)) (= (++2 nil2 y) y)))
(assert-claim (forall ((x Nat)) (<=2 Z x)))
(assert-claim (forall ((x Nat)) (= (count x nil) Z)))
(assert-claim (forall ((x Nat)) (<=2 x (S x))))
(assert-claim
  (forall ((x Nat) (y Nat)) (=> (<=2 x y) (<=2 x (S y)))))
(assert-claim (forall ((x Nat)) (not (<=2 (S x) x))))
(assert-claim
  (forall ((x Nat) (y Nat)) (=> (<=2 y x) (not (<=2 (S x) y)))))
(assert-claim
  (forall ((y list2) (z list2) (x2 list2))
    (= (++2 (++2 y z) x2) (++2 y (++2 z x2)))))
(assert-claim
  (forall ((y sk) (z list2) (x2 list2))
    (= (cons2 y (++2 z x2)) (++2 (cons2 y z) x2))))
(assert-claim
  (forall ((x Nat) (y list) (z list))
    (= (count x (++ z y)) (count x (++ y z)))))
(assert-claim
  (forall ((x Nat) (y list))
    (= (count x (cons x y)) (S (count x y)))))
(assert-claim
  (forall ((x Nat) (y Nat)) (= (<=2 (S x) (S y)) (<=2 x y))))
(assert-claim
  (forall ((x Nat) (y Nat)) (= (== (S x) (S y)) (== x y))))
(assert-claim
  (forall ((x Nat) (y Nat))
    (= (count y (cons x nil)) (count x (cons y nil)))))
(assert-claim
  (forall ((x Nat) (y list))
    (= (count x (cons (S x) y)) (count x y))))
(assert-claim
  (forall ((x Nat) (y Nat) (z list))
    (=> (<=2 y x) (= (count y (cons (S x) z)) (count y z)))))
(assert-claim
  (forall ((x Nat) (y list))
    (= (count (S x) (cons x y)) (count (S x) y))))
(assert-claim
  (forall ((x Nat) (y Nat) (z list))
    (=> (<=2 x y) (= (count (S y) (cons x z)) (count (S y) z)))))
(assert-claim
  (forall ((x Nat) (y list) (z Nat) (x2 list))
    (= (count x (++ x2 (cons z y))) (count x (++ y (cons z x2))))))
(assert-claim
  (forall ((x Nat) (y list))
    (= (<=2 x (count x (cons Z y))) (<=2 x (count x y)))))
(assert-claim
  (forall ((x Nat) (y list))
    (= (<=2 x (count Z (cons x y))) (<=2 x (count Z y)))))
(assert-claim
  (forall ((x Nat) (y list))
    (= (<=2 (count x (++ y y)) Z) (<=2 (count x y) Z))))
(assert-claim
  (forall ((x Nat) (y Nat))
    (= (<=2 (count y (cons x nil)) x) (<=2 (count y (cons x nil)) y))))
(assert-claim
  (forall ((x Nat) (y Nat))
    (= (count y (cons x (cons x nil)))
      (count x (cons y (cons y nil))))))
(assert-claim
  (forall ((x list) (y Nat))
    (= (<=2 (count y x) (S (S Z))) (<=2 (count y x) (S (S y))))))
(assert-claim
  (forall ((x Nat) (y Nat))
    (= (<=2 (count y (cons Z nil)) x) (<=2 (count y (cons x nil)) y))))
(assert-claim
  (forall ((x Nat)) (not (== x (count x (cons Z nil))))))
