(declare-datatype Nat ((Z) (S (proj1-S Nat))))
(declare-datatype list ((nil) (cons (head Nat) (tail list))))
(define-fun
  barbar
  ((x Bool) (y Bool)) Bool (ite x true y))
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
     ((cons z xs) (barbar (== x z) (elem x xs))))))
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
(assert-not
  (forall ((x Nat) (y Nat) (z list))
    (=> (= x y) (elem x (insert2 y z)))))
(assert-claim (forall ((x Nat) (y Nat)) (=> (== y x) (= x y))))
(assert-claim (forall ((x Nat)) (<=2 x x)))
(assert-claim (forall ((x Nat) (y Nat)) (= (== y x) (== x y))))
(assert-claim (forall ((x Nat)) (== x x)))
(assert-claim
  (forall ((x Nat) (y Nat)) (=> (<=2 x y) (= (<=2 y x) (== x y)))))
(assert-claim
  (forall ((x Bool) (y Bool)) (= (barbar y x) (barbar x y))))
(assert-claim (forall ((x Bool)) (= (barbar x x) x)))
(assert-claim (forall ((x Nat)) (<=2 Z x)))
(assert-claim (forall ((x Bool)) (= x x)))
(assert-claim (forall ((x Bool)) (barbar x true)))
(assert-claim (forall ((x Nat)) (not (elem x nil))))
(assert-claim (forall ((x Nat)) (= (insert2 x nil) (cons x nil))))
(assert-claim (forall ((x list)) (= (insert2 Z x) (cons Z x))))
(assert-claim (forall ((x Nat)) (<=2 x (S x))))
(assert-claim
  (forall ((x Nat) (y Nat)) (=> (<=2 x y) (<=2 x (S y)))))
(assert-claim (forall ((x Nat)) (not (<=2 (S x) x))))
(assert-claim
  (forall ((x Nat) (y Nat)) (=> (<=2 y x) (not (<=2 (S x) y)))))
(assert-claim
  (forall ((x Bool) (y Bool) (z Bool))
    (= (barbar (barbar x y) z) (barbar x (barbar y z)))))
(assert-claim (forall ((x Nat) (y list)) (elem x (cons x y))))
(assert-claim
  (forall ((x Nat) (y Nat) (z list))
    (=> (elem x z) (= (elem y (cons x z)) (elem y z)))))
(assert-claim
  (forall ((x Nat) (y Nat) (z list))
    (= (elem x (insert2 y z)) (elem x (cons y z)))))
(assert-claim
  (forall ((x Nat) (y Nat) (z list))
    (=> (elem x z) (elem x (cons y z)))))
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
  (forall ((x Nat) (y Nat)) (= (<=2 (S x) (S y)) (<=2 x y))))
(assert-claim
  (forall ((x Nat) (y Nat)) (= (== (S x) (S y)) (== x y))))
(assert-claim
  (forall ((x Nat) (y Nat)) (= (== x y) (elem x (cons y nil)))))
(assert-claim
  (forall ((x Nat) (y list)) (= (elem x (cons (S x) y)) (elem x y))))
(assert-claim
  (forall ((x Nat) (y Nat) (z list))
    (=> (<=2 y x) (= (elem y (cons (S x) z)) (elem y z)))))
(assert-claim
  (forall ((x Nat) (y list))
    (= (elem (S x) (cons x y)) (elem (S x) y))))
(assert-claim
  (forall ((x Nat) (y Nat) (z list))
    (=> (<=2 x y) (= (elem (S y) (cons x z)) (elem (S y) z)))))
(assert-claim
  (forall ((x Nat) (y list))
    (= (insert2 (S x) (cons x y)) (cons x (insert2 (S x) y)))))
(assert-claim
  (forall ((x Nat) (y Nat) (z list))
    (=> (<=2 x y)
      (= (insert2 (S y) (cons x z)) (cons x (insert2 (S y) z))))))
(assert-claim
  (forall ((x Nat) (y Nat)) (barbar (<=2 y x) (<=2 x y))))
(assert-claim
  (forall ((x Nat) (y Nat))
    (= (barbar (<=2 x y) (== x y)) (<=2 x y))))
(assert-claim
  (forall ((x Nat) (y Nat) (z list))
    (= (barbar (== x y) (elem x z)) (elem x (cons y z)))))
(assert-claim
  (forall ((x Nat) (y Nat))
    (= (barbar (<=2 x y) (<=2 x Z)) (<=2 x y))))
(assert-claim
  (forall ((x Nat) (y list))
    (= (insert2 (S Z) (cons (S x) y)) (cons (S Z) (cons (S x) y)))))
