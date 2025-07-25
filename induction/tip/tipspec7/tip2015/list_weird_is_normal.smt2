(declare-sort Any 0)
(declare-sort sk 0)
(declare-datatype list4 ((nil4) (cons4 (head4 sk) (tail4 list4))))
(declare-datatype
  list3 ((nil3) (cons3 (head3 list4) (tail3 list3))))
(declare-datatype list ((nil) (cons (head Any) (tail list))))
(declare-datatype
  list2 ((nil2) (cons2 (head2 list) (tail2 list2))))
(define-fun-rec
  weird_concat2
  ((x list3)) list4
  (match x
    ((nil3 nil4)
     ((cons3 y xss)
      (match y
        ((nil4 (weird_concat2 xss))
         ((cons4 z xs) (cons4 z (weird_concat2 (cons3 xs xss))))))))))
(define-fun-rec
  weird_concat
  ((x list2)) list
  (match x
    ((nil2 nil)
     ((cons2 y xss)
      (match y
        ((nil (weird_concat xss))
         ((cons z xs) (cons z (weird_concat (cons2 xs xss))))))))))
(define-fun-rec
  ++3
  ((x list4) (y list4)) list4
  (match x
    ((nil4 y)
     ((cons4 z xs) (cons4 z (++3 xs y))))))
(define-fun-rec
  concat3
  ((x list3)) list4
  (match x
    ((nil3 nil4)
     ((cons3 y xs) (++3 y (concat3 xs))))))
(define-fun-rec
  ++2
  ((x list3) (y list3)) list3
  (match x
    ((nil3 y)
     ((cons3 z xs) (cons3 z (++2 xs y))))))
(define-fun-rec
  ++
  ((x list) (y list)) list
  (match x
    ((nil y)
     ((cons z xs) (cons z (++ xs y))))))
(define-fun-rec
  concat2
  ((x list2)) list
  (match x
    ((nil2 nil)
     ((cons2 y xs) (++ y (concat2 xs))))))
(assert-not (forall ((x list2)) (= (concat2 x) (weird_concat x))))
(assert-claim (= (concat3 nil3) nil4))
(assert-claim
  (forall ((y list3)) (= (weird_concat2 y) (concat3 y))))
(assert-claim (forall ((y list4)) (= (++3 y nil4) y)))
(assert-claim (forall ((y list4)) (= (++3 nil4 y) y)))
(assert-claim
  (forall ((y list4) (z list3))
    (= (concat3 (cons3 y z)) (++3 y (concat3 z)))))
(assert-claim
  (forall ((y list4) (z list4) (x2 list4))
    (= (++3 (++3 y z) x2) (++3 y (++3 z x2)))))
(assert-claim
  (forall ((y sk) (z list4) (x2 list4))
    (= (cons4 y (++3 z x2)) (++3 (cons4 y z) x2))))
(assert-claim
  (forall ((y list3) (z list3))
    (= (++3 (concat3 y) (concat3 z)) (concat3 (++2 y z)))))
