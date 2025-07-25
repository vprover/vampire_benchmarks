(declare-sort sk 0)
(declare-sort fun1 0)
(declare-sort fun12 0)
(declare-datatype list ((nil) (cons (head sk) (tail list))))
(declare-datatype Nat ((Z) (S (proj1-S Nat))))
(declare-fun apply1 (fun1 sk) sk)
(declare-fun apply12 (fun12 sk) Bool)
(define-fun-rec
  len
  ((x list)) Nat
  (match x
    ((nil Z)
     ((cons y xs) (S (len xs))))))
(define-fun-rec
  filter
  ((x fun12) (y list)) list
  (match y
    ((nil nil)
     ((cons z xs)
      (ite (apply12 x z) (cons z (filter x xs)) (filter x xs))))))
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
  (forall ((p fun12) (xs list)) (<=2 (len (filter p xs)) (len xs))))
(assert-claim (= (len nil) Z))
(assert-claim (forall ((x Nat)) (<=2 x x)))
(assert-claim (forall ((x Nat)) (<=2 Z x)))
(assert-claim (forall ((y fun12)) (= (filter y nil) nil)))
(assert-claim (forall ((x Nat)) (<=2 x (S x))))
(assert-claim
  (forall ((x Nat) (y Nat)) (=> (<=2 x y) (<=2 x (S y)))))
(assert-claim (forall ((x Nat)) (not (<=2 (S x) x))))
(assert-claim
  (forall ((x Nat) (y Nat)) (=> (<=2 y x) (not (<=2 (S x) y)))))
(assert-claim
  (forall ((y sk) (z list)) (= (len (cons y z)) (S (len z)))))
(assert-claim
  (forall ((y fun12) (z fun12) (x2 list))
    (= (filter z (filter y x2)) (filter y (filter z x2)))))
(assert-claim
  (forall ((y fun12) (z list))
    (= (filter y (filter y z)) (filter y z))))
(assert-claim
  (forall ((x Nat) (y Nat)) (= (<=2 (S x) (S y)) (<=2 x y))))
(assert-claim
  (forall ((y fun12) (z sk) (x2 list))
    (= (filter y (cons z (filter y x2))) (filter y (cons z x2)))))
(assert-claim
  (forall ((y fun12) (z list)) (<=2 (len (filter y z)) (len z))))
