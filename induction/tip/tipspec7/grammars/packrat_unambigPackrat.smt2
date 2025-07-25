(declare-sort sk 0)
(declare-datatype list2 ((nil2) (cons2 (head2 sk) (tail2 list2))))
(declare-datatype Tok ((X) (Y) (Z)))
(declare-datatype list ((nil) (cons (head Tok) (tail list))))
(declare-datatype B2 ((SB (proj1-SB B2)) (ZB)))
(declare-datatype A2 ((SA (proj1-SA A2)) (ZA)))
(declare-datatype S ((A (proj1-A A2)) (B (proj1-B B2))))
(define-fun-rec
  ++2
  ((x list2) (y list2)) list2
  (match x
    ((nil2 y)
     ((cons2 z xs) (cons2 z (++2 xs y))))))
(define-fun-rec
  ++
  ((x list) (y list)) list
  (match x
    ((nil y)
     ((cons z xs) (cons z (++ xs y))))))
(define-fun-rec
  linA
  ((x A2)) list
  (match x
    (((SA a) (++ (cons X nil) (++ (linA a) (cons Y nil))))
     (ZA (cons X (cons Z (cons Y nil)))))))
(define-fun-rec
  linB
  ((x B2)) list
  (match x
    (((SB b) (++ (cons X nil) (++ (linB b) (cons Y (cons Y nil)))))
     (ZB (cons X (cons Z (cons Y (cons Y nil))))))))
(define-fun
  linS
  ((x S)) list
  (match x
    (((A a) (linA a))
     ((B b) (linB b)))))
(assert-not
  (forall ((u S) (v S)) (=> (= (linS u) (linS v)) (= u v))))
(assert-claim
  (= (linA (SA (SA (SA ZA)))) (cons X (cons X (linB (SB ZB))))))
(assert-claim (= (linA (SA ZA)) (cons X (linB ZB))))
(assert-claim (forall ((y list2)) (= (++2 y nil2) y)))
(assert-claim (forall ((y list2)) (= (++2 nil2 y) y)))
(assert-claim (forall ((x A2)) (= (linA x) (linA x))))
(assert-claim (forall ((x B2)) (= (linB x) (linB x))))
(assert-claim
  (forall ((y list2) (z list2) (x2 list2))
    (= (++2 (++2 y z) x2) (++2 y (++2 z x2)))))
(assert-claim
  (forall ((y sk) (z list2) (x2 list2))
    (= (cons2 y (++2 z x2)) (++2 (cons2 y z) x2))))
(assert-claim
  (forall ((x list)) (= (++ (linA ZA) (cons Y x)) (++ (linB ZB) x))))
(assert-claim
  (forall ((x list))
    (= (cons X (cons Z (cons Y x))) (++ (linA ZA) x))))
