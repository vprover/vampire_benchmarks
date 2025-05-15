(set-logic UFDT)

(declare-sort s 0)
(declare-datatype tree ((leaf) (node (lc tree) (val s) (rc tree))))

(define-fun-rec mirror ((x tree)) tree
  (match x ((leaf leaf)
            ((node l y r) (node (mirror r) y (mirror l))))))

(assert-synth ((t tree)) ((tp tree)) (= (mirror (mirror t)) tp ))

(set-option :uncomputable (mirror))


