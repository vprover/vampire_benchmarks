(declare-sort sk 0)
(declare-datatype list ((nil) (cons (head sk) (tail list))))
(define-fun-rec
  qrev
  ((x list) (y list)) list
  (match x
    ((nil y)
     ((cons z xs) (qrev xs (cons z y))))))
(assert-not (forall ((x list)) (= (qrev (qrev x nil) nil) x)))
(assert-claim (forall ((y list)) (= (qrev nil y) y)))
(assert-claim
  (forall ((y list) (z sk) (x2 list))
    (= (qrev (cons z y) x2) (qrev y (cons z x2)))))
(assert-claim
  (forall ((y list) (z list)) (= (qrev (qrev z y) nil) (qrev y z))))
(assert-claim
  (forall ((y list) (z list) (x2 list) (x3 list))
    (= (qrev x2 (qrev (qrev z y) x3)) (qrev (qrev (qrev y z) x2) x3))))
(assert-claim
  (forall ((y sk) (z list) (x2 list))
    (= (qrev (qrev z (cons y nil)) x2)
      (cons y (qrev (qrev z nil) x2)))))
