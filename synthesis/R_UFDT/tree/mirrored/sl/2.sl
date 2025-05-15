(set-logic UFDT)
(set-feature :recursion true)

(declare-sort s 0)
(declare-datatype tree ((leaf) (node (lc tree) (val s) (rc tree))))

(declare-var t tree)

(define-fun-rec mirror ((x tree)) tree (match x ((leaf leaf) ((node l y r) (node (mirror r) y (mirror l))))))


(synth-fun ftp ((t tree)) tree)

(constraint (= (mirror (ftp t)) t))

(check-synth)
