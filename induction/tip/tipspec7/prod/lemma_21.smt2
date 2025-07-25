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
     ((cons z xs) (ite (== x z) (S (count x xs)) (count x xs))))))
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
  insert2
  ((x Nat) (y list)) list
  (match y
    ((nil (cons x nil))
     ((cons z xs)
      (ite (<=2 x z) (cons x (cons z xs)) (cons z (insert2 x xs)))))))
(define-fun
  /=
  ((x Nat) (y Nat)) Bool (not (== x y)))
(assert-not
  (forall ((x Nat) (y Nat) (z list))
    (=> (/= x y) (= (count x (insert2 y z)) (count x z)))))
(assert-claim (forall ((x Nat) (y Nat)) (=> (== y x) (= x y))))
(assert-claim (forall ((x Nat) (y Nat)) (= (/= y x) (/= x y))))
(assert-claim (forall ((x Nat)) (not (/= x x))))
(assert-claim (forall ((x Nat)) (<=2 x x)))
(assert-claim (forall ((x Nat) (y Nat)) (= (== y x) (== x y))))
(assert-claim (forall ((x Nat)) (== x x)))
(assert-claim
  (forall ((x Nat) (y Nat)) (=> (/= x y) (not (== x y)))))
(assert-claim
  (forall ((x Nat) (y Nat)) (=> (<=2 x y) (= (<=2 y x) (== x y)))))
(assert-claim (forall ((x Nat)) (<=2 Z x)))
(assert-claim (forall ((x Nat)) (= (count x nil) Z)))
(assert-claim (forall ((x Nat)) (= (insert2 x nil) (cons x nil))))
(assert-claim (forall ((x list)) (= (insert2 Z x) (cons Z x))))
(assert-claim (forall ((x Nat)) (/= x (S x))))
(assert-claim
  (forall ((x Nat) (y Nat)) (=> (<=2 x y) (/= x (S y)))))
(assert-claim (forall ((x Nat)) (<=2 x (S x))))
(assert-claim
  (forall ((x Nat) (y Nat)) (=> (<=2 x y) (<=2 x (S y)))))
(assert-claim
  (forall ((x Nat) (y Nat))
    (=> (/= x y) (= (<=2 (S x) y) (<=2 x y)))))
(assert-claim
  (forall ((x Nat) (y Nat))
    (=> (<=2 x y) (= (/= x y) (<=2 (S x) y)))))
(assert-claim
  (forall ((x Nat) (y list))
    (= (count x (cons x y)) (S (count x y)))))
(assert-claim
  (forall ((x Nat) (y Nat) (z list))
    (= (count x (insert2 y z)) (count x (cons y z)))))
(assert-claim
  (forall ((x Nat) (y Nat) (z list))
    (=> (/= y x) (= (count y (cons x z)) (count y z)))))
(assert-claim
  (forall ((x Nat) (y list))
    (= (insert2 x (cons x y)) (cons x (cons x y)))))
(assert-claim
  (forall ((x Nat) (y Nat) (z list))
    (= (insert2 y (insert2 x z)) (insert2 x (insert2 y z)))))
(assert-claim
  (forall ((x Nat) (y Nat) (z list))
    (=> (<=2 x y) (= (insert2 x (cons y z)) (cons x (cons y z))))))
(assert-claim
  (forall ((x Nat) (y Nat)) (= (/= (S x) (S y)) (/= x y))))
(assert-claim
  (forall ((x Nat) (y Nat)) (= (<=2 (S x) (S y)) (<=2 x y))))
(assert-claim
  (forall ((x Nat) (y Nat)) (= (== (S x) (S y)) (== x y))))
(assert-claim
  (forall ((x Nat) (y Nat))
    (= (count y (cons x nil)) (count x (cons y nil)))))
(assert-claim
  (forall ((x Nat) (y list))
    (= (insert2 (S x) (cons x y)) (cons x (insert2 (S x) y)))))
(assert-claim
  (forall ((x Nat) (y Nat) (z list))
    (=> (<=2 x y)
      (= (insert2 (S y) (cons x z)) (cons x (insert2 (S y) z))))))
(assert-claim
  (forall ((x Nat) (y Nat) (z Nat) (x2 list))
    (= (count x (cons z (cons y x2))) (count x (cons y (cons z x2))))))
(assert-claim
  (forall ((x Nat) (y Nat) (z Nat) (x2 list))
    (= (count x (cons y (insert2 z x2)))
      (count x (cons y (cons z x2))))))
(assert-claim
  (forall ((x Nat) (y list))
    (= (<=2 x (count x (cons Z y))) (<=2 x (count x y)))))
(assert-claim
  (forall ((x Nat) (y list))
    (= (<=2 x (count Z (cons x y))) (<=2 x (count Z y)))))
(assert-claim
  (forall ((x Nat) (y Nat))
    (= (<=2 (count y (cons x nil)) x) (<=2 (count y (cons x nil)) y))))
(assert-claim
  (forall ((x Nat) (y Nat))
    (= (count y (cons x (cons x nil)))
      (count x (cons y (cons y nil))))))
(assert-claim (forall ((x Nat)) (/= x (count x (cons Z nil)))))
(assert-claim
  (forall ((x Nat) (y Nat))
    (= (== x y) (/= Z (count x (cons y nil))))))
(assert-claim
  (forall ((x Nat) (y Nat))
    (= (/= x y) (<=2 (count x (cons y nil)) Z))))
(assert-claim
  (forall ((x Nat) (y Nat))
    (= (<=2 (count y (cons Z nil)) x) (<=2 (count y (cons x nil)) y))))
(assert-claim
  (forall ((x Nat) (y Nat))
    (= (count (S x) (cons (S y) nil)) (count x (cons y nil)))))
(assert-claim
  (forall ((x Nat) (y list))
    (= (insert2 (S Z) (cons (S x) y)) (cons (S Z) (cons (S x) y)))))
