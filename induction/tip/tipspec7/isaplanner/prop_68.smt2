(declare-sort sk 0)
(declare-datatype list2 ((nil2) (cons2 (head2 sk) (tail2 list2))))
(declare-datatype Nat ((Z) (S (proj1-S Nat))))
(declare-datatype list ((nil) (cons (head Nat) (tail list))))
(define-fun-rec
  len2
  ((x list2)) Nat
  (match x
    ((nil2 Z)
     ((cons2 y xs) (S (len2 xs))))))
(define-fun-rec
  len
  ((x list)) Nat
  (match x
    ((nil Z)
     ((cons y xs) (S (len xs))))))
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
  delete
  ((x Nat) (y list)) list
  (match y
    ((nil nil)
     ((cons z xs)
      (ite (== x z) (delete x xs) (cons z (delete x xs)))))))
(define-fun-rec
  <=2
  ((x Nat) (y Nat)) Bool
  (match x
    ((Z true)
     ((S z)
      (match y
        ((Z false)
         ((S x2) (<=2 z x2))))))))
(assert-not
  (forall ((n Nat) (xs list)) (<=2 (len (delete n xs)) (len xs))))
(assert-claim (= (len2 nil2) Z))
(assert-claim (forall ((x Nat) (y Nat)) (=> (== y x) (= x y))))
(assert-claim (forall ((x Nat)) (<=2 x x)))
(assert-claim (forall ((x Nat) (y Nat)) (= (== y x) (== x y))))
(assert-claim (forall ((x Nat)) (== x x)))
(assert-claim
  (forall ((x Nat) (y Nat)) (=> (<=2 x y) (= (<=2 y x) (== x y)))))
(assert-claim (forall ((x Nat)) (<=2 Z x)))
(assert-claim (forall ((x Nat)) (= (delete x nil) nil)))
(assert-claim (forall ((x Nat)) (<=2 x (S x))))
(assert-claim
  (forall ((x Nat) (y Nat)) (=> (<=2 x y) (<=2 x (S y)))))
(assert-claim (forall ((x Nat)) (not (<=2 (S x) x))))
(assert-claim
  (forall ((x Nat) (y Nat)) (=> (<=2 y x) (not (<=2 (S x) y)))))
(assert-claim
  (forall ((y sk) (z list2)) (= (len2 (cons2 y z)) (S (len2 z)))))
(assert-claim
  (forall ((x Nat) (y list)) (= (delete x (cons x y)) (delete x y))))
(assert-claim
  (forall ((x Nat) (y Nat) (z list))
    (= (delete y (delete x z)) (delete x (delete y z)))))
(assert-claim
  (forall ((x Nat) (y list))
    (= (delete x (delete x y)) (delete x y))))
(assert-claim
  (forall ((x Nat) (y Nat)) (= (<=2 (S x) (S y)) (<=2 x y))))
(assert-claim
  (forall ((x Nat) (y Nat)) (= (== (S x) (S y)) (== x y))))
(assert-claim
  (forall ((x Nat) (y list))
    (= (delete x (cons (S x) y)) (cons (S x) (delete x y)))))
(assert-claim
  (forall ((x Nat) (y Nat) (z list))
    (=> (<=2 y x)
      (= (delete y (cons (S x) z)) (cons (S x) (delete y z))))))
(assert-claim
  (forall ((x Nat) (y list))
    (= (delete (S x) (cons x y)) (cons x (delete (S x) y)))))
(assert-claim
  (forall ((x Nat) (y Nat) (z list))
    (=> (<=2 x y)
      (= (delete (S y) (cons x z)) (cons x (delete (S y) z))))))
(assert-claim
  (forall ((x Nat) (y Nat))
    (= (len (delete y (cons x nil))) (len (delete x (cons y nil))))))
(assert-claim
  (forall ((x Nat) (y Nat) (z list))
    (= (delete x (cons y (cons x z))) (delete x (cons y z)))))
(assert-claim
  (forall ((x Nat) (y Nat) (z list))
    (= (delete x (cons y (delete x z))) (delete x (cons y z)))))
(assert-claim
  (forall ((x Nat) (y list)) (<=2 (len (delete x y)) (len y))))
