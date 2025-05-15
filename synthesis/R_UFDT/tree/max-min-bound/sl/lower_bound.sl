(set-logic UFDT)
(set-feature :recursion true)

(declare-datatype nat ((s (s0 nat)) (zero)))
(declare-datatype tree ((leaf) (node (lc tree) (val nat) (rc tree))))

(declare-var t tree)

(define-fun-rec add ((x nat) (y nat)) nat (match y ((zero x) ((s y0) (s (add x y0))))))

(define-fun leq ((x nat) (y nat)) Bool (exists ((k nat)) (= (add x k) y)))

(define-fun-rec inbt ((n nat) (t tree)) Bool (match t ((leaf false) ((node l k r) (or (inbt n l) (inbt n r) (= n k))))))


(synth-fun fn ((t tree)) nat)

(constraint (forall ((k nat)) (=> (inbt k t) (leq (fn t) k))))

(check-synth)
