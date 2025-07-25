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
  delete
  ((x Nat) (y list)) list
  (match y
    ((nil nil)
     ((cons z xs)
      (ite (== x z) (delete x xs) (cons z (delete x xs)))))))
(define-fun-rec
  elem
  ((x Nat) (y list)) Bool
  (match y
    ((nil false)
     ((cons z xs) (ite (== x z) true (elem x xs))))))
(assert-not
  (forall ((x Nat) (xs list)) (not (elem x (delete x xs)))))
(assert-claim (forall ((x Nat) (y Nat)) (=> (== y x) (= x y))))
(assert-claim (forall ((x Nat) (y Nat)) (= (== y x) (== x y))))
(assert-claim (forall ((x Nat)) (== x x)))
(assert-claim (forall ((x Nat)) (= (delete x nil) nil)))
(assert-claim (forall ((x Nat)) (not (elem x nil))))
(assert-claim (forall ((x Nat)) (not (== x (S x)))))
(assert-claim (forall ((x Nat)) (not (== (S x) Z))))
(assert-claim
  (forall ((x Nat) (y list)) (= (delete x (cons x y)) (delete x y))))
(assert-claim
  (forall ((x Nat) (y Nat) (z list))
    (= (delete y (delete x z)) (delete x (delete y z)))))
(assert-claim
  (forall ((x Nat) (y list))
    (= (delete x (delete x y)) (delete x y))))
(assert-claim (forall ((x Nat) (y list)) (elem x (cons x y))))
(assert-claim
  (forall ((x Nat) (y Nat) (z list))
    (=> (elem x z) (= (elem y (cons x z)) (elem y z)))))
(assert-claim
  (forall ((x Nat) (y list)) (not (elem x (delete x y)))))
(assert-claim
  (forall ((x Nat) (y Nat) (z list))
    (=> (elem x z) (elem x (cons y z)))))
(assert-claim
  (forall ((x list) (y Nat) (z Nat) (x2 list))
    (=> (elem z x)
      (=> (elem y x2)
        (= (elem z (delete y x)) (elem y (delete z x2)))))))
(assert-claim (forall ((x Nat)) (not (== x (S (S x))))))
(assert-claim
  (forall ((x Nat) (y Nat)) (= (== (S x) (S y)) (== x y))))
(assert-claim
  (forall ((x Nat) (y Nat)) (= (== x y) (elem x (cons y nil)))))
(assert-claim
  (forall ((x Nat) (y list))
    (= (delete x (cons (S x) y)) (cons (S x) (delete x y)))))
(assert-claim
  (forall ((x Nat) (y list))
    (= (delete (S x) (cons x y)) (cons x (delete (S x) y)))))
(assert-claim
  (forall ((x Nat) (y list)) (= (elem x (cons (S x) y)) (elem x y))))
(assert-claim
  (forall ((x Nat) (y list))
    (= (elem x (delete (S x) y)) (elem x y))))
(assert-claim
  (forall ((x Nat) (y list))
    (= (elem (S x) (cons x y)) (elem (S x) y))))
(assert-claim
  (forall ((x Nat) (y list))
    (= (elem (S x) (delete x y)) (elem (S x) y))))
(assert-claim (forall ((x Nat)) (not (== x (S (S (S x)))))))
(assert-claim
  (forall ((x Nat) (y list))
    (= (delete (S x) (cons Z y)) (cons Z (delete (S x) y)))))
(assert-claim
  (forall ((x Nat) (y list))
    (= (delete Z (cons (S x) y)) (cons (S x) (delete Z y)))))
(assert-claim
  (forall ((x Nat) (y list))
    (= (elem (S x) (cons Z y)) (elem (S x) y))))
(assert-claim
  (forall ((x Nat) (y list))
    (= (elem (S x) (delete Z y)) (elem (S x) y))))
(assert-claim
  (forall ((x Nat) (y list)) (= (elem Z (cons (S x) y)) (elem Z y))))
(assert-claim
  (forall ((x Nat) (y list))
    (= (elem Z (delete (S x) y)) (elem Z y))))
(assert-claim
  (forall ((x Nat) (y Nat) (z list))
    (= (delete x (cons y (cons x z))) (delete x (cons y z)))))
(assert-claim
  (forall ((x Nat) (y Nat) (z list))
    (= (delete x (cons y (delete x z))) (delete x (cons y z)))))
(assert-claim
  (forall ((x Nat) (y Nat) (z Nat) (x2 list))
    (= (elem x (cons z (cons y x2))) (elem x (cons y (cons z x2))))))
(assert-claim
  (forall ((x list) (y Nat) (z Nat))
    (= (elem y (cons z (delete y x))) (== y z))))
(assert-claim
  (forall ((x Nat) (y Nat) (z list))
    (= (elem x (cons y (delete y z))) (elem x (cons y z)))))
(assert-claim
  (forall ((x Nat) (y list))
    (= (delete x (cons (S (S x)) y)) (cons (S (S x)) (delete x y)))))
(assert-claim
  (forall ((x Nat) (y list))
    (= (delete (S (S x)) (cons x y)) (cons x (delete (S (S x)) y)))))
(assert-claim
  (forall ((x Nat) (y list))
    (= (elem x (cons (S (S x)) y)) (elem x y))))
(assert-claim
  (forall ((x Nat) (y Nat) (z Nat))
    (= (elem z (delete y (cons x nil)))
      (elem x (delete y (cons z nil))))))
(assert-claim
  (forall ((x Nat) (y Nat) (z list))
    (= (elem y (delete (S (S x)) z)) (elem y z))))
