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
  elem
  ((x Nat) (y list)) Bool
  (match y
    ((nil false)
     ((cons z xs) (ite (== x z) true (elem x xs))))))
(define-fun-rec
  <2
  ((x Nat) (y Nat)) Bool
  (match y
    ((Z false)
     ((S z)
      (match x
        ((Z true)
         ((S x2) (<2 x2 z))))))))
(define-fun-rec
  ins
  ((x Nat) (y list)) list
  (match y
    ((nil (cons x nil))
     ((cons z xs)
      (ite (<2 x z) (cons x (cons z xs)) (cons z (ins x xs)))))))
(assert-not (forall ((x Nat) (xs list)) (elem x (ins x xs))))
(assert-claim (forall ((x Nat) (y Nat)) (=> (== y x) (= x y))))
(assert-claim (forall ((x Nat)) (not (<2 x x))))
(assert-claim
  (forall ((x Nat) (y Nat)) (=> (<2 y x) (not (<2 x y)))))
(assert-claim (forall ((x Nat) (y Nat)) (= (== y x) (== x y))))
(assert-claim (forall ((x Nat)) (== x x)))
(assert-claim
  (forall ((x Nat) (y Nat)) (=> (<2 x y) (not (== x y)))))
(assert-claim (forall ((x Nat)) (not (<2 x Z))))
(assert-claim (forall ((x Nat) (y Nat)) (=> (<2 x y) (<2 Z y))))
(assert-claim (forall ((x Nat)) (not (elem x nil))))
(assert-claim (forall ((x Nat)) (= (ins x nil) (cons x nil))))
(assert-claim (forall ((x list)) (= (ins Z x) (cons Z x))))
(assert-claim (forall ((x Nat)) (<2 x (S x))))
(assert-claim
  (forall ((x Nat) (y Nat)) (=> (<2 x y) (<2 x (S y)))))
(assert-claim
  (forall ((x Nat) (y Nat)) (=> (<2 y x) (not (<2 x (S y))))))
(assert-claim (forall ((x Nat)) (= (== x Z) (<2 x (S Z)))))
(assert-claim (forall ((x Nat) (y list)) (elem x (cons x y))))
(assert-claim
  (forall ((x Nat) (y Nat) (z list))
    (=> (elem x z) (= (elem y (cons x z)) (elem y z)))))
(assert-claim
  (forall ((x Nat) (y Nat) (z list))
    (= (elem x (ins y z)) (elem x (cons y z)))))
(assert-claim
  (forall ((x Nat) (y Nat) (z list))
    (=> (<2 y x) (= (elem y (cons x z)) (elem y z)))))
(assert-claim
  (forall ((x Nat) (y Nat) (z list))
    (=> (<2 x y) (= (elem y (cons x z)) (elem y z)))))
(assert-claim
  (forall ((x Nat) (y Nat) (z list))
    (=> (elem x z) (elem x (cons y z)))))
(assert-claim
  (forall ((x Nat) (y list))
    (= (ins x (cons x y)) (cons x (ins x y)))))
(assert-claim
  (forall ((x Nat) (y Nat) (z list))
    (= (ins y (ins x z)) (ins x (ins y z)))))
(assert-claim
  (forall ((x Nat) (y Nat) (z list))
    (=> (<2 x y) (= (ins x (cons y z)) (cons x (cons y z))))))
(assert-claim
  (forall ((x Nat) (y Nat) (z list))
    (=> (<2 x y) (= (ins y (cons x z)) (cons x (ins y z))))))
(assert-claim
  (forall ((x Nat) (y Nat))
    (=> (<2 y x) (= (== x (S y)) (<2 x (S (S y)))))))
(assert-claim
  (forall ((x Nat) (y Nat)) (= (<2 (S x) (S y)) (<2 x y))))
(assert-claim
  (forall ((x Nat) (y Nat)) (= (== (S x) (S y)) (== x y))))
(assert-claim
  (forall ((x Nat) (y Nat)) (= (== x y) (elem x (cons y nil)))))
(assert-claim
  (forall ((x Nat) (y Nat) (z list))
    (=> (<2 x y) (= (ins y (cons (S x) z)) (cons (S x) (ins y z))))))
(assert-claim
  (forall ((x Nat) (y Nat) (z Nat) (x2 list))
    (= (elem x (cons z (cons y x2))) (elem x (cons y (cons z x2))))))
(assert-claim
  (forall ((x Nat) (y Nat) (z Nat) (x2 list))
    (= (elem x (cons y (ins z x2))) (elem x (cons y (cons z x2))))))
