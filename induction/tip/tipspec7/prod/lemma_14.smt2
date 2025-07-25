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
  even
  ((x Nat)) Bool
  (match x
    ((Z true)
     ((S y)
      (match y
        ((Z false)
         ((S z) (even z))))))))
(define-fun-rec
  ++
  ((x list) (y list)) list
  (match x
    ((nil y)
     ((cons z xs) (cons z (++ xs y))))))
(assert-not
  (forall ((w list) (x sk) (y sk) (z list))
    (= (even (length (++ w z)))
      (even (length (++ w (cons x (cons y z))))))))
(assert-claim (even Z))
(assert-claim (= (length nil) Z))
(assert-claim (forall ((y list)) (= (++ y nil) y)))
(assert-claim (forall ((y list)) (= (++ nil y) y)))
(assert-claim (forall ((x Nat)) (=> (even x) (not (even (S x))))))
(assert-claim
  (forall ((y list) (z list))
    (= (length (++ z y)) (length (++ y z)))))
(assert-claim
  (forall ((y sk) (z list)) (= (length (cons y z)) (S (length z)))))
(assert-claim (forall ((x Nat)) (= (even (S (S x))) (even x))))
(assert-claim
  (forall ((y list) (z list) (x2 list))
    (= (++ (++ y z) x2) (++ y (++ z x2)))))
(assert-claim
  (forall ((y sk) (z list) (x2 list))
    (= (cons y (++ z x2)) (++ (cons y z) x2))))
(assert-claim (forall ((y list)) (even (length (++ y y)))))
(assert-claim
  (forall ((y list) (z list) (x2 list))
    (= (even (length (++ y (++ x2 z))))
      (even (length (++ y (++ z x2)))))))
(assert-claim
  (forall ((y list) (z list))
    (= (even (length (++ z (++ y y)))) (even (length z)))))
