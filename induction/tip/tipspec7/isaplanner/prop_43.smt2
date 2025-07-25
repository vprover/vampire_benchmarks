(declare-sort sk 0)
(declare-sort fun1 0)
(declare-sort fun12 0)
(declare-datatype list ((nil) (cons (head sk) (tail list))))
(declare-fun apply1 (fun1 sk) sk)
(declare-fun apply12 (fun12 sk) Bool)
(define-fun-rec
  takeWhile
  ((x fun12) (y list)) list
  (match y
    ((nil nil)
     ((cons z xs) (ite (apply12 x z) (cons z (takeWhile x xs)) nil)))))
(define-fun-rec
  dropWhile
  ((x fun12) (y list)) list
  (match y
    ((nil nil)
     ((cons z xs) (ite (apply12 x z) (dropWhile x xs) (cons z xs))))))
(define-fun-rec
  ++
  ((x list) (y list)) list
  (match x
    ((nil y)
     ((cons z xs) (cons z (++ xs y))))))
(assert-not
  (forall ((p fun12) (xs list))
    (= (++ (takeWhile p xs) (dropWhile p xs)) xs)))
(assert-claim (forall ((y list)) (= (++ y nil) y)))
(assert-claim (forall ((y list)) (= (++ nil y) y)))
(assert-claim (forall ((y fun12)) (= (dropWhile y nil) nil)))
(assert-claim (forall ((y fun12)) (= (takeWhile y nil) nil)))
(assert-claim
  (forall ((y list) (z list) (x2 list))
    (= (++ (++ y z) x2) (++ y (++ z x2)))))
(assert-claim
  (forall ((y sk) (z list) (x2 list))
    (= (cons y (++ z x2)) (++ (cons y z) x2))))
(assert-claim
  (forall ((y fun12) (z list))
    (= (dropWhile y (dropWhile y z)) (dropWhile y z))))
(assert-claim
  (forall ((y fun12) (z list))
    (= (dropWhile y (takeWhile y z)) nil)))
(assert-claim
  (forall ((y fun12) (z list))
    (= (takeWhile y (dropWhile y z)) nil)))
(assert-claim
  (forall ((y fun12) (z fun12) (x2 list))
    (= (takeWhile z (takeWhile y x2)) (takeWhile y (takeWhile z x2)))))
(assert-claim
  (forall ((y fun12) (z list))
    (= (takeWhile y (takeWhile y z)) (takeWhile y z))))
(assert-claim
  (forall ((y fun12) (z list))
    (= (++ (takeWhile y z) (dropWhile y z)) z)))
(assert-claim
  (forall ((y list) (z fun12) (x2 list))
    (= (dropWhile z (++ y (dropWhile z x2)))
      (++ (dropWhile z y) (dropWhile z x2)))))
(assert-claim
  (forall ((y fun12) (z list) (x2 list))
    (= (dropWhile y (++ (dropWhile y z) x2)) (dropWhile y (++ z x2)))))
(assert-claim
  (forall ((y fun12) (z fun12) (x2 list))
    (= (dropWhile z (dropWhile y (takeWhile z x2))) nil)))
(assert-claim
  (forall ((y list) (z fun12) (x2 list))
    (= (takeWhile z (++ x2 (dropWhile z y))) (takeWhile z x2))))
(assert-claim
  (forall ((y fun12) (z list) (x2 list))
    (= (takeWhile y (++ z (takeWhile y x2))) (takeWhile y (++ z x2)))))
(assert-claim
  (forall ((y list) (z fun12) (x2 list))
    (= (takeWhile z (++ (takeWhile z y) x2))
      (++ (takeWhile z y) (takeWhile z x2)))))
(assert-claim
  (forall ((y fun12) (z fun12) (x2 sk))
    (= (dropWhile z (dropWhile y (cons x2 nil)))
      (dropWhile y (dropWhile z (cons x2 nil))))))
(assert-claim
  (forall ((y fun12) (z fun12) (x2 sk))
    (= (takeWhile z (dropWhile y (cons x2 nil)))
      (dropWhile y (takeWhile z (cons x2 nil))))))
