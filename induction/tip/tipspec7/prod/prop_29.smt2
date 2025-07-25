(declare-sort sk 0)
(declare-datatype list ((nil) (cons (head sk) (tail list))))
(define-fun-rec
  qrev
  ((x list) (y list)) list
  (match x
    ((nil y)
     ((cons z xs) (qrev xs (cons z y))))))
(define-fun-rec
  ++
  ((x list) (y list)) list
  (match x
    ((nil y)
     ((cons z xs) (cons z (++ xs y))))))
(define-fun-rec
  rev
  ((x list)) list
  (match x
    ((nil nil)
     ((cons y xs) (++ (rev xs) (cons y nil))))))
(assert-not (forall ((x list)) (= (rev (qrev x nil)) x)))
(assert-claim (= (rev nil) nil))
(assert-claim (forall ((y list)) (= (++ y nil) y)))
(assert-claim (forall ((y list)) (= (++ nil y) y)))
(assert-claim (forall ((y list)) (= (qrev y nil) (rev y))))
(assert-claim (forall ((y list)) (= (qrev nil y) y)))
(assert-claim (forall ((y list)) (= (rev (rev y)) y)))
(assert-claim
  (forall ((y list) (z list)) (= (++ (rev y) z) (qrev y z))))
(assert-claim
  (forall ((y list) (z list)) (= (rev (++ z y)) (qrev y (rev z)))))
(assert-claim
  (forall ((y sk)) (= (rev (cons y nil)) (cons y nil))))
(assert-claim
  (forall ((y list) (z list) (x2 list))
    (= (++ (++ y z) x2) (++ y (++ z x2)))))
(assert-claim
  (forall ((y sk) (z list) (x2 list))
    (= (cons y (++ z x2)) (++ (cons y z) x2))))
