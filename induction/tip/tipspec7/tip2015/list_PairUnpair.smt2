(declare-sort sk 0)
(declare-datatype pair ((pair2 (proj1-pair sk) (proj2-pair sk))))
(declare-datatype list2 ((nil2) (cons2 (head2 sk) (tail2 list2))))
(declare-datatype list ((nil) (cons (head pair) (tail list))))
(define-fun-rec
  unpair
  ((x list)) list2
  (match x
    ((nil nil2)
     ((cons y xys)
      (match y (((pair2 z y2) (cons2 z (cons2 y2 (unpair xys))))))))))
(define-fun-rec
  pairs
  ((x list2)) list
  (match x
    ((nil2 nil)
     ((cons2 y z)
      (match z
        ((nil2 nil)
         ((cons2 y2 xs) (cons (pair2 y y2) (pairs xs)))))))))
(define-fun-rec
  length2
  ((x list2)) Int
  (match x
    ((nil2 0)
     ((cons2 y l) (+ 1 (length2 l))))))
(define-fun-rec
  length
  ((x list)) Int
  (match x
    ((nil 0)
     ((cons y l) (+ 1 (length l))))))
(assert-not
  (forall ((xs list2))
    (=> (= (mod (length2 xs) 2) 0) (= (unpair (pairs xs)) xs))))
(assert-claim (= (unpair nil) nil2))
(assert-claim (= (pairs nil2) nil))
(assert-claim (= (length2 nil2) 0))
(assert-claim (forall ((y list)) (= (pairs (unpair y)) y)))
(assert-claim
  (forall ((y sk) (z sk) (x2 list2))
    (= (length2 (cons2 y x2)) (length2 (cons2 z x2)))))
(assert-claim
  (forall ((y sk) (z list2))
    (= (+ 1 (length2 z)) (length2 (cons2 y z)))))
(assert-claim (forall ((y sk)) (= (pairs (cons2 y nil2)) nil)))
(assert-claim
  (forall ((y list))
    (= (+ (length y) (length y)) (length2 (unpair y)))))
(assert-claim
  (forall ((y sk) (z sk) (x2 list2))
    (= (length (pairs (cons2 y x2))) (length (pairs (cons2 z x2))))))
(assert-claim
  (forall ((y sk) (z sk) (x2 list2))
    (= (pairs (cons2 y (cons2 z x2))) (cons (pair2 y z) (pairs x2)))))
(assert-claim
  (forall ((y sk) (z sk) (x2 list))
    (= (unpair (cons (pair2 y z) x2))
      (cons2 y (cons2 z (unpair x2))))))
(assert-claim
  (forall ((y sk) (z list))
    (= (length (pairs (cons2 y (unpair z)))) (length z))))
(assert-claim
  (forall ((y sk) (z list2)) (= (mod 0 (length2 (cons2 y z))) 0)))
(assert-claim (forall ((y list2)) (= (mod 1 (+ 2 (length2 y))) 1)))
(assert-claim
  (forall ((y sk) (z list2))
    (= (mod (length2 z) (length2 (cons2 y z))) (length2 z))))
(assert-claim
  (forall ((y sk) (z list2))
    (= (+ (length2 z) (mod (length2 z) 2))
      (length2 (unpair (pairs (cons2 y z)))))))
(assert-claim
  (forall ((y sk) (z pair) (x2 list))
    (= (mod 1 (length2 (cons2 y (unpair x2))))
      (mod 1 (length (cons z x2))))))
(assert-claim
  (forall ((y sk) (z list))
    (= (mod 2 (length2 (cons2 y (unpair z))))
      (mod 2 (+ 2 (length z))))))
(assert-claim
  (forall ((y pair) (z list))
    (= (mod 2 (length2 (unpair (cons y z))))
      (mod 2 (+ 2 (length z))))))
(assert-claim
  (forall ((y list2))
    (= (mod (length2 y) (+ 2 (length2 y))) (length2 y))))
(assert-claim
  (forall ((y sk) (z list2))
    (= (mod 2 (+ 2 (length (pairs z))))
      (mod 2 (length2 (cons2 y z))))))
