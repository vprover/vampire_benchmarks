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
  ++
  ((x list) (y list)) list
  (match x
    ((nil y)
     ((cons z xs) (cons z (++ xs y))))))
(assert-not
  (forall ((n Nat) (m Nat) (xs list))
    (=> (not (== n m))
      (= (count n (++ xs (cons m nil))) (count n xs)))))
