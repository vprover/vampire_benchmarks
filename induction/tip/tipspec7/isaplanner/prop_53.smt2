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
(assert-not
  (forall ((n Nat) (xs list)) (= (count n xs) (count n (sort xs)))))
(assert-claim (= (sort nil) nil))
(assert-claim (forall ((x Nat) (y Nat)) (=> (== y x) (= x y))))
(assert-claim (forall ((x Nat)) (<=2 x x)))
(assert-claim (forall ((x Nat) (y Nat)) (= (== y x) (== x y))))
(assert-claim (forall ((x Nat)) (== x x)))
(assert-claim
  (forall ((x Nat) (y Nat)) (=> (<=2 x y) (= (<=2 y x) (== x y)))))
(assert-claim (forall ((x Nat)) (<=2 Z x)))
(assert-claim (forall ((x Nat)) (= (count x nil) Z)))
(assert-claim (forall ((x Nat)) (= (insort x nil) (cons x nil))))
(assert-claim (forall ((x list)) (= (insort Z x) (cons Z x))))
(assert-claim (forall ((x list)) (= (sort (sort x)) (sort x))))
(assert-claim (forall ((x Nat)) (<=2 x (S x))))
(assert-claim
  (forall ((x Nat) (y Nat)) (=> (<=2 x y) (<=2 x (S y)))))
(assert-claim (forall ((x Nat)) (not (<=2 (S x) x))))
(assert-claim
  (forall ((x Nat) (y Nat)) (=> (<=2 y x) (not (<=2 (S x) y)))))
(assert-claim
  (forall ((x Nat) (y list)) (= (count x (sort y)) (count x y))))
(assert-claim
  (forall ((x Nat) (y list))
    (= (sort (cons x y)) (insort x (sort y)))))
(assert-claim
  (forall ((x Nat) (y list))
    (= (sort (insort x y)) (insort x (sort y)))))
(assert-claim
  (forall ((x Nat) (y list))
    (= (count x (cons x y)) (S (count x y)))))
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
  (forall ((x Nat) (y list))
    (= (insort (S x) (cons x y)) (cons x (insort (S x) y)))))
(assert-claim
  (forall ((x Nat) (y Nat) (z list))
    (=> (<=2 x y)
      (= (insort (S y) (cons x z)) (cons x (insort (S y) z))))))
(assert-claim
  (forall ((x Nat) (y Nat) (z Nat) (x2 list))
    (= (count x (cons z (cons y x2))) (count x (cons y (cons z x2))))))
(assert-claim
  (forall ((x Nat) (y Nat) (z Nat) (x2 list))
    (= (count x (cons y (insort z x2)))
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
(assert-claim
  (forall ((x Nat) (y Nat))
    (= (<=2 (count y (cons Z nil)) x) (<=2 (count y (cons x nil)) y))))
(assert-claim
  (forall ((x Nat)) (not (== x (count x (cons Z nil))))))
(assert-claim
  (forall ((x Nat) (y Nat))
    (= (count (S x) (cons (S y) nil)) (count x (cons y nil)))))
(assert-claim
  (forall ((x Nat) (y list))
    (= (insort (S Z) (cons (S x) y)) (cons (S Z) (cons (S x) y)))))
