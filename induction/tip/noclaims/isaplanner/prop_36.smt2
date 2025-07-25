(declare-sort sk 0)
(declare-sort fun1 0)
(declare-sort fun12 0)
(declare-datatype list ((nil) (cons (head sk) (tail list))))
(declare-const lam fun12)
(declare-fun apply1 (fun1 sk) sk)
(declare-fun apply12 (fun12 sk) Bool)
(define-fun-rec
  takeWhile
  ((x fun12) (y list)) list
  (match y
    ((nil nil)
     ((cons z xs) (ite (apply12 x z) (cons z (takeWhile x xs)) nil)))))
(assert (forall ((x sk)) (apply12 lam x)))
(assert-not (forall ((xs list)) (= (takeWhile lam xs) xs)))
