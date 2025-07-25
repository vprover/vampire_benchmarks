(declare-sort sk 0)
(declare-datatype list2 ((nil2) (cons2 (head2 sk) (tail2 list2))))
(declare-datatype It ((A) (B) (C)))
(declare-datatype list ((nil) (cons (head It) (tail list))))
(define-fun-rec
  isPrefix
  ((x list) (y list)) Bool
  (match x
    ((nil true)
     ((cons z x2)
      (match y
        ((nil false)
         ((cons x3 x4) (and (= z x3) (isPrefix x2 x4)))))))))
(define-fun-rec
  isRelaxedPrefix
  ((x list) (y list)) Bool
  (match x
    ((nil true)
     ((cons z x2)
      (match x2
        ((nil true)
         ((cons x3 x4)
          (match y
            ((nil false)
             ((cons x5 x6)
              (ite
                (= z x5) (isRelaxedPrefix (cons x3 x4) x6)
                (isPrefix (cons x3 x4) (cons x5 x6)))))))))))))
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
(assert-not
  (forall ((x It) (xs list) (ys list))
    (isRelaxedPrefix (++ xs (cons x nil)) (++ xs ys))))
(assert-claim (forall ((x list)) (isPrefix x x)))
(assert-claim (forall ((x list)) (isRelaxedPrefix x x)))
(assert-claim
  (forall ((x list) (y list))
    (=> (isPrefix x y) (isRelaxedPrefix x y))))
(assert-claim (forall ((y list2)) (= (++2 y nil2) y)))
(assert-claim (forall ((y list2)) (= (++2 nil2 y) y)))
(assert-claim (forall ((x list)) (isPrefix nil x)))
(assert-claim
  (forall ((y list2) (z list2) (x2 list2))
    (= (++2 (++2 y z) x2) (++2 y (++2 z x2)))))
(assert-claim
  (forall ((y sk) (z list2) (x2 list2))
    (= (cons2 y (++2 z x2)) (++2 (cons2 y z) x2))))
(assert-claim (forall ((x list) (y list)) (isPrefix x (++ x y))))
(assert-claim
  (forall ((x list) (y list) (z list) (x2 list) (x3 list))
    (=> (isPrefix y x2)
      (=> (isPrefix x3 x)
        (= (isPrefix z (++ x2 y)) (isPrefix z (++ x2 x3)))))))
