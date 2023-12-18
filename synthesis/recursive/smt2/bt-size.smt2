(set-info :smt-lib-version 2.6)
(set-info :category "crafted")


(declare-datatypes ((nat 0) (tree 0))
  (((zero) (s (s0 nat)))
   ((Nil) (node (lc tree) (val nat) (rc tree)))))


; k-times successor function
(declare-fun s2(nat nat) nat)

; definition of s' (base case)
; s'(x,zero) = x

(assert (forall ((x nat)) (=(s2 x zero) x)))

; definition of s' (step case)
; s'(x,s(k))=s(s'(x,k))

(assert (forall ((x nat) (k nat)) (=(s2 x (s k)) (s (s2 x k)))))



(declare-fun size (tree) nat)


(assert (= (size Nil) zero) )

(assert (forall ((l tree) (r tree) (x nat)) (= (size (node l x r)) (s (s2 (size l) (size r)) ) ) ) )

;(assert (forall ((t tree) (x nat)) (= (size (node t x Nil)) (s (size t)) ) ) )
;(assert (forall ((t tree) (x nat)) (= (size (node Nil x t)) (s (size t)) ) ) )



(assert-not (forall ((t tree)) (exists ((y nat)) (= y (size t)) ) ) ) 


(set-option :uncomputable (size))
(check-sat)
