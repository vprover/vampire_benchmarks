(set-logic UFDT)

(declare-datatype nat ((s (s0 nat)) (zero)))
(declare-datatype lst ((nil) (cons (cons0 nat) (cons1 lst))))

(define-fun-rec add ((x nat) (y nat)) nat
  (match y ((zero x)
           ((s y0) (s (add x y0))))))

(define-fun leq ((x nat) (y nat)) Bool
  (exists ((k nat))(= (add x k) y))
)

(define-fun-rec inlst ((x nat) (y lst)) Bool
  (match y ((nil false)
            ((cons y0 y1) (or (= x y0) (inlst x y1))))))

(define-fun-rec sorted ((x lst)) Bool
(match x ((nil true)
           ((cons x0 x1) (match x1 ((nil true)
                                    ((cons x2 x3) (and (leq x0 x2) (sorted (cons x2 x3))))))))))

(define-fun-rec len ((x lst)) nat
  (match x ((nil zero)
            ((cons x0 x1) (s (len x1))))))


; returns sorted list of same length as input list such that every member of input list is also member of output list and vice versa 
;SPECIFICATION
(assert-synth ((l lst)) ((s lst)) (and (and (= (len s) (len l))(sorted s)) (forall ((n nat))(= (inlst n s) (inlst n l)))))



