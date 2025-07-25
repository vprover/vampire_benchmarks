(declare-sort fun1 0)
(declare-sort fun12 0)
(declare-datatype list ((nil) (cons (head Int) (tail list))))
(declare-fun lam (Int) fun12)
(declare-const lam2 fun1)
(declare-fun apply1 (fun1 Int) fun12)
(declare-fun apply12 (fun12 Int) Bool)
(define-fun-rec
  ssort-minimum1
  ((x Int) (y list)) Int
  (match y
    ((nil x)
     ((cons y1 ys1)
      (ite (<= y1 x) (ssort-minimum1 y1 ys1) (ssort-minimum1 x ys1))))))
(define-fun-rec
  deleteBy
  ((x fun1) (y Int) (z list)) list
  (match z
    ((nil nil)
     ((cons y2 ys)
      (ite (apply12 (apply1 x y) y2) ys (cons y2 (deleteBy x y ys)))))))
(define-fun-rec
  ssort
  ((x list)) list
  (match x
    ((nil nil)
     ((cons y ys)
      (let ((m (ssort-minimum1 y ys)))
        (cons m (ssort (deleteBy lam2 m (cons y ys)))))))))
(define-fun-rec
  count
  ((x Int) (y list)) Int
  (match y
    ((nil 0)
     ((cons z ys) (ite (= x z) (+ 1 (count x ys)) (count x ys))))))
(assert (forall ((z Int)) (= (apply1 lam2 z) (lam z))))
(assert
  (forall ((z Int) (x2 Int)) (= (apply12 (lam z) x2) (= z x2))))
(assert-not
  (forall ((x Int) (xs list)) (= (count x (ssort xs)) (count x xs))))
