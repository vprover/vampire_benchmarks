(declare-sort sk 0)
(declare-datatype list ((nil) (cons (head sk) (tail list))))
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
(assert-not
  (forall ((x list) (y list) (z sk))
    (= (rev (++ x (++ y (cons z nil)))) (cons z (rev (++ x y))))))
(assert-claim (= (rev nil) nil))
(assert-claim (forall ((y list)) (= (++ y nil) y)))
(assert-claim (forall ((y list)) (= (++ nil y) y)))
(assert-claim (forall ((y list)) (= (rev (rev y)) y)))
(assert-claim
  (forall ((y sk)) (= (rev (cons y nil)) (cons y nil))))
(assert-claim
  (forall ((y list) (z list) (x2 list))
    (= (++ (++ y z) x2) (++ y (++ z x2)))))
(assert-claim
  (forall ((y sk) (z list) (x2 list))
    (= (cons y (++ z x2)) (++ (cons y z) x2))))
(assert-claim
  (forall ((y list) (z list))
    (= (++ (rev z) (rev y)) (rev (++ y z)))))
