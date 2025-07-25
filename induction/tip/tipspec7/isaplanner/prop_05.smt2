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
(assert-not
  (forall ((n Nat) (x Nat) (xs list))
    (=> (= n x) (= (S (count n xs)) (count n (cons x xs))))))
(assert-claim (forall ((x Nat) (y Nat)) (=> (== y x) (= x y))))
(assert-claim (forall ((x Nat) (y Nat)) (= (== y x) (== x y))))
(assert-claim (forall ((x Nat)) (== x x)))
(assert-claim (forall ((x Nat)) (= (count x nil) Z)))
(assert-claim (forall ((x Nat)) (not (== x (S x)))))
(assert-claim (forall ((x Nat)) (not (== (S x) Z))))
(assert-claim
  (forall ((x Nat) (y list))
    (= (count x (cons x y)) (S (count x y)))))
(assert-claim (forall ((x Nat)) (not (== x (S (S x))))))
(assert-claim
  (forall ((x Nat) (y Nat)) (= (== (S x) (S y)) (== x y))))
(assert-claim
  (forall ((x Nat) (y Nat))
    (= (count y (cons x nil)) (count x (cons y nil)))))
(assert-claim
  (forall ((x Nat) (y list))
    (= (count x (cons (S x) y)) (count x y))))
(assert-claim
  (forall ((x Nat) (y list))
    (= (count (S x) (cons x y)) (count (S x) y))))
(assert-claim (forall ((x Nat)) (not (== x (S (S (S x)))))))
(assert-claim
  (forall ((x Nat) (y list))
    (= (count (S x) (cons Z y)) (count (S x) y))))
(assert-claim
  (forall ((x Nat) (y list))
    (= (count Z (cons (S x) y)) (count Z y))))
(assert-claim
  (forall ((x Nat) (y Nat) (z Nat) (x2 list))
    (= (count x (cons z (cons y x2))) (count x (cons y (cons z x2))))))
(assert-claim
  (forall ((x Nat) (y Nat))
    (= (count y (cons x (cons x nil)))
      (count x (cons y (cons y nil))))))
(assert-claim
  (forall ((x Nat) (y list))
    (= (count x (cons (S (S x)) y)) (count x y))))
(assert-claim
  (forall ((x Nat) (y list))
    (= (count (S (S x)) (cons x y)) (count (S (S x)) y))))
(assert-claim (forall ((x Nat)) (not (== x (S (S (S (S x))))))))
(assert-claim
  (forall ((x Nat)) (not (== x (count x (cons Z nil))))))
(assert-claim
  (forall ((x Nat) (y Nat))
    (= (count (S x) (cons (S y) nil)) (count x (cons y nil)))))
