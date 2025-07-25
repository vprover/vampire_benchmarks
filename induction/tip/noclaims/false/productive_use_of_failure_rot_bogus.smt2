(declare-datatype Nat ((S (proj1-S Nat)) (Z)))
(declare-datatype list ((nil) (cons (head Nat) (tail list))))
(define-fun-rec
  ++
  ((x list) (y list)) list
  (match x
    ((nil y)
     ((cons z xs) (cons z (++ xs y))))))
(define-fun-rec
  rotate
  ((x Nat) (y list)) list
  (match x
    (((S z)
      (match y
        ((nil nil)
         ((cons x2 x3) (rotate z (++ x3 (cons x2 nil)))))))
     (Z y))))
(assert-not (forall ((n Nat) (xs list)) (= xs (rotate n xs))))
