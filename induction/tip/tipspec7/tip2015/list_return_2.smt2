(declare-sort sk 0)
(declare-sort fun1 0)
(declare-sort fun12 0)
(declare-datatype list ((nil) (cons (head sk) (tail list))))
(declare-const lam fun12)
(declare-const lam2 fun12)
(declare-fun apply1 (fun1 sk) sk)
(declare-fun apply12 (fun12 sk) list)
(define-fun
  return
  ((x sk)) list (cons x nil))
(define-fun-rec
  ++
  ((x list) (y list)) list
  (match x
    ((nil y)
     ((cons z xs) (cons z (++ xs y))))))
(define-fun-rec
  >>=
  ((x list) (y fun12)) list
  (match x
    ((nil nil)
     ((cons z xs) (++ (apply12 y z) (>>= xs y))))))
(assert (forall ((x sk)) (= (apply12 lam x) (return x))))
(assert (forall ((z sk)) (= (apply12 lam2 z) (return z))))
(assert-not (forall ((xs list)) (= (>>= xs lam) xs)))
(assert-claim (forall ((y list)) (= (++ y nil) y)))
(assert-claim (forall ((y list)) (= (++ nil y) y)))
(assert-claim (forall ((z fun12)) (= (>>= nil z) nil)))
(assert-claim (forall ((y sk)) (= (cons y nil) (return y))))
(assert-claim (forall ((y list)) (= (>>= y lam2) y)))
(assert-claim
  (forall ((y sk) (z list)) (= (++ (return y) z) (cons y z))))
(assert-claim
  (forall ((y list) (z list) (x2 list))
    (= (++ (++ y z) x2) (++ y (++ z x2)))))
(assert-claim
  (forall ((z list) (x2 list) (x3 fun12))
    (= (++ (>>= z x3) (>>= x2 x3)) (>>= (++ z x2) x3))))
