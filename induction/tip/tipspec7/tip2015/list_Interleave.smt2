(declare-sort sk 0)
(declare-datatype list ((nil) (cons (head sk) (tail list))))
(define-fun-rec
  interleave
  ((x list) (y list)) list
  (match x
    ((nil y)
     ((cons z xs) (cons z (interleave y xs))))))
(define-funs-rec
  ((evens
    ((x list)) list)
   (odds
    ((x list)) list))
  ((match x
     ((nil nil)
      ((cons y xs) (cons y (odds xs)))))
   (match x
     ((nil nil)
      ((cons y xs) (evens xs))))))
(assert-not
  (forall ((xs list)) (= (interleave (evens xs) (odds xs)) xs)))
(assert-claim (= (evens nil) nil))
(assert-claim (= (odds nil) nil))
(assert-claim (forall ((y list)) (= (interleave y nil) y)))
(assert-claim (forall ((y list)) (= (interleave nil y) y)))
(assert-claim
  (forall ((y sk) (z list))
    (= (evens (cons y z)) (cons y (odds z)))))
(assert-claim (forall ((y list)) (= (evens (interleave y y)) y)))
(assert-claim
  (forall ((y sk) (z list)) (= (odds (cons y z)) (evens z))))
(assert-claim (forall ((y list)) (= (odds (interleave y y)) y)))
(assert-claim
  (forall ((y sk) (z list) (x2 list))
    (= (interleave (cons y x2) z) (cons y (interleave z x2)))))
(assert-claim
  (forall ((y list)) (= (interleave (evens y) (odds y)) y)))
(assert-claim
  (forall ((y list))
    (= (evens (evens (odds (evens (odds y)))))
      (evens (odds (evens (odds y)))))))
