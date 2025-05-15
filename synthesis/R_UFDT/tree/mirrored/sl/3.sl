(set-logic HO_UFDT)
(set-feature :recursion true)

(declare-sort s 0)
(declare-datatype tree ((leaf) (node (lc tree) (val s) (rc tree))))

(declare-var t tree)
(declare-var mirror (-> tree tree))

(assume (forall ((x tree)) (= (mirror x) (match x ((leaf leaf) ((node l y r) (node (mirror r) y (mirror l))))))))

(synth-fun ftp ((t tree)) tree)

(constraint (= (mirror (mirror t)) (ftp t)))

(check-synth)
