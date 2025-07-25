(declare-sort sk 0)
(declare-datatype list ((nil) (cons (head sk) (tail list))))
(define-fun-rec
  ++
  ((x list) (y list)) list
  (match x
    ((nil y)
     ((cons z xs) (cons z (++ xs y))))))
(assert-not
  (forall ((x list) (y list) (z sk))
    (= (++ (++ x y) (cons z nil)) (++ x (++ y (cons z nil))))))
