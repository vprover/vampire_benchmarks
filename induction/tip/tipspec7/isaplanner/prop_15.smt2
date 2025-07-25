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
(assert-not
  (forall ((x Nat) (xs list)) (= (len (ins x xs)) (S (len xs)))))
(assert-claim (= (len2 nil2) Z))
(assert-claim (forall ((x Nat)) (not (<2 x x))))
(assert-claim
  (forall ((x Nat) (y Nat)) (=> (<2 y x) (not (<2 x y)))))
(assert-claim (forall ((x Nat)) (not (<2 x Z))))
(assert-claim (forall ((x Nat) (y Nat)) (=> (<2 x y) (<2 Z y))))
(assert-claim (forall ((x Nat)) (= (ins x nil) (cons x nil))))
(assert-claim (forall ((x list)) (= (ins Z x) (cons Z x))))
(assert-claim (forall ((x Nat)) (<2 x (S x))))
(assert-claim
  (forall ((x Nat) (y Nat)) (=> (<2 x y) (<2 x (S y)))))
(assert-claim
  (forall ((x Nat) (y Nat)) (=> (<2 y x) (not (<2 x (S y))))))
(assert-claim
  (forall ((y sk) (z list2)) (= (len2 (cons2 y z)) (S (len2 z)))))
(assert-claim
  (forall ((x Nat) (y list)) (= (len (ins x y)) (S (len y)))))
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
  (forall ((x Nat) (y Nat)) (= (<2 (S x) (S y)) (<2 x y))))
(assert-claim
  (forall ((x Nat) (y Nat) (z list))
    (=> (<2 x y) (= (ins y (cons (S x) z)) (cons (S x) (ins y z))))))
