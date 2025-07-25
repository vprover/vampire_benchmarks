(declare-sort sk 0)
(declare-sort fun1 0)
(declare-sort fun12 0)
(declare-datatype list ((nil) (cons (head sk) (tail list))))
(declare-fun apply1 (fun1 sk) sk)
(declare-fun apply12 (fun12 sk) Bool)
(define-fun-rec
  filter
  ((x fun12) (y list)) list
  (match y
    ((nil nil)
     ((cons z xs)
      (ite (apply12 x z) (cons z (filter x xs)) (filter x xs))))))
(define-fun-rec
  ++
  ((x list) (y list)) list
  (match x
    ((nil y)
     ((cons z xs) (cons z (++ xs y))))))
(assert-not
  (forall ((p fun12) (xs list) (ys list))
    (= (filter p (++ xs ys)) (++ (filter p xs) (filter p ys)))))
(assert-claim (forall ((y list)) (= (++ y nil) y)))
(assert-claim (forall ((y list)) (= (++ nil y) y)))
(assert-claim (forall ((y fun12)) (= (filter y nil) nil)))
(assert-claim
  (forall ((y list) (z list) (x2 list))
    (= (++ (++ y z) x2) (++ y (++ z x2)))))
(assert-claim
  (forall ((y sk) (z list) (x2 list))
    (= (cons y (++ z x2)) (++ (cons y z) x2))))
(assert-claim
  (forall ((y fun12) (z fun12) (x2 list))
    (= (filter z (filter y x2)) (filter y (filter z x2)))))
(assert-claim
  (forall ((y fun12) (z list))
    (= (filter y (filter y z)) (filter y z))))
(assert-claim
  (forall ((y fun12) (z list) (x2 list))
    (= (++ (filter y z) (filter y x2)) (filter y (++ z x2)))))
