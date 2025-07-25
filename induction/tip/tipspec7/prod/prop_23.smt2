(declare-sort sk 0)
(declare-datatype list ((nil) (cons (head sk) (tail list))))
(declare-datatype Nat ((Z) (S (proj1-S Nat))))
(define-fun-rec
  length
  ((x list)) Nat
  (match x
    ((nil Z)
     ((cons y xs) (S (length xs))))))
(define-fun-rec
  half
  ((x Nat)) Nat
  (match x
    ((Z Z)
     ((S y)
      (match y
        ((Z Z)
         ((S z) (S (half z)))))))))
(define-fun-rec
  ++
  ((x list) (y list)) list
  (match x
    ((nil y)
     ((cons z xs) (cons z (++ xs y))))))
(assert-not
  (forall ((x list) (y list))
    (= (half (length (++ x y))) (half (length (++ y x))))))
(assert-claim (= (length nil) Z))
(assert-claim (= (half Z) Z))
(assert-claim (= (half (S Z)) Z))
(assert-claim (forall ((y list)) (= (++ y nil) y)))
(assert-claim (forall ((y list)) (= (++ nil y) y)))
(assert-claim
  (forall ((y list) (z list))
    (= (length (++ z y)) (length (++ y z)))))
(assert-claim
  (forall ((y sk) (z list)) (= (length (cons y z)) (S (length z)))))
(assert-claim (forall ((x Nat)) (= (half (S (S x))) (S (half x)))))
(assert-claim
  (forall ((y list) (z list) (x2 list))
    (= (++ (++ y z) x2) (++ y (++ z x2)))))
(assert-claim
  (forall ((y sk) (z list) (x2 list))
    (= (cons y (++ z x2)) (++ (cons y z) x2))))
(assert-claim
  (forall ((y list)) (= (half (length (++ y y))) (length y))))
(assert-claim
  (forall ((y list)) (= (half (S (length (++ y y)))) (length y))))
(assert-claim
  (forall ((x Nat)) (= (half (half (half (half (half x))))) Z)))
(assert-claim
  (forall ((x Nat))
    (= (half (S (half (half (half (half x))))))
      (half (half (half (half x)))))))
