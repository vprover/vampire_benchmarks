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

;SPECIFICATION
(assert-synth ((l lst)) ((n nat)) (=> (distinct l nil) (forall ((k nat)) (=> (inlst k l) (leq k n)))))



