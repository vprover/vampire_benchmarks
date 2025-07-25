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
  <=2
  ((x Nat) (y Nat)) Bool
  (match x
    ((Z true)
     ((S z)
      (match y
        ((Z false)
         ((S x2) (<=2 z x2))))))))
(define-fun-rec
  insort
  ((x Nat) (y list)) list
  (match y
    ((nil (cons x nil))
     ((cons z xs)
      (ite (<=2 x z) (cons x (cons z xs)) (cons z (insort x xs)))))))
(define-fun-rec
  sort
  ((x list)) list
  (match x
    ((nil nil)
     ((cons y xs) (insort y (sort xs))))))
(assert-not (forall ((xs list)) (= (len (sort xs)) (len xs))))
(assert-claim (= (len2 nil2) Z))
(assert-claim (= (sort nil) nil))
(assert-claim (forall ((x Nat)) (<=2 x x)))
(assert-claim (forall ((x Nat)) (<=2 Z x)))
(assert-claim (forall ((x Nat)) (= (insort x nil) (cons x nil))))
(assert-claim (forall ((x list)) (= (insort Z x) (cons Z x))))
(assert-claim (forall ((x list)) (= (len (sort x)) (len x))))
(assert-claim (forall ((x list)) (= (sort (sort x)) (sort x))))
(assert-claim (forall ((x Nat)) (<=2 x (S x))))
(assert-claim
  (forall ((x Nat) (y Nat)) (=> (<=2 x y) (<=2 x (S y)))))
(assert-claim (forall ((x Nat)) (not (<=2 (S x) x))))
(assert-claim
  (forall ((x Nat) (y Nat)) (=> (<=2 y x) (not (<=2 (S x) y)))))
(assert-claim
  (forall ((y sk) (z list2)) (= (len2 (cons2 y z)) (S (len2 z)))))
(assert-claim
  (forall ((x Nat) (y list)) (= (len (insort x y)) (S (len y)))))
(assert-claim
  (forall ((x Nat) (y list))
    (= (sort (cons x y)) (insort x (sort y)))))
(assert-claim
  (forall ((x Nat) (y list))
    (= (sort (insort x y)) (insort x (sort y)))))
(assert-claim
  (forall ((x Nat) (y list))
    (= (insort x (cons x y)) (cons x (cons x y)))))
(assert-claim
  (forall ((x Nat) (y Nat) (z list))
    (= (insort y (insort x z)) (insort x (insort y z)))))
(assert-claim
  (forall ((x Nat) (y Nat) (z list))
    (=> (<=2 x y) (= (insort x (cons y z)) (cons x (cons y z))))))
(assert-claim
  (forall ((x Nat) (y Nat)) (= (<=2 (S x) (S y)) (<=2 x y))))
(assert-claim
  (forall ((x Nat) (y list))
    (= (insort (S x) (cons x y)) (cons x (insort (S x) y)))))
(assert-claim
  (forall ((x Nat) (y Nat) (z list))
    (=> (<=2 x y)
      (= (insort (S y) (cons x z)) (cons x (insort (S y) z))))))
(assert-claim
  (forall ((x Nat) (y list))
    (= (insort (S Z) (cons (S x) y)) (cons (S Z) (cons (S x) y)))))
