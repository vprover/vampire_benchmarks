(set-logic UFDT)
(set-feature :recursion true)

(declare-datatype nat ((s (s0 nat)) (zero)))
(declare-datatype lst ((nil) (cons (cons0 nat) (cons1 lst))))

(declare-var l lst)

(define-fun-rec add ((x nat) (y nat)) nat (match y ((zero x) ((s y0) (s (add x y0))))))

(define-fun leq ((x nat) (y nat)) Bool (exists ((k nat)) (= (add x k) y)))

(define-fun-rec inlst ((x nat) (y lst)) Bool (match y ((nil false) ((cons y0 y1) (or (= x y0) (inlst x y1))))))

(define-fun-rec sorted ((x lst)) Bool (match x ((nil true) ((cons x0 x1) (match x1 ((nil true) ((cons x2 x3) (and (leq x0 x2) (sorted (cons x2 x3))))))))))


(synth-fun fs ((l lst)) lst)

(constraint (and (sorted (fs l)) (forall ((n nat)) (= (inlst n (fs l)) (inlst n l)))))

(check-synth)
