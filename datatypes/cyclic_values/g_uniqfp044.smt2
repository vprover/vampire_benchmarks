(set-info :status unsat)
(declare-codatatypes ((T 0)) ((
  (f0)
  (f1 (proj0f1 T))
  (f2 (proj0f2 T) (proj1f2 T) (proj2f2 T) (proj3f2 T))
  (f3 (proj0f3 T)))))
(assert (exists ((y4671 T) (y4670 T) (y4677 T) (y4676 T) (y4675 T) (y4674 T) (y4673 T) (y4672 T) (y4666 T) (y4667 T) (y4686 T) (y4669 T) (y4684 T) (y4685 T) (y4682 T) (y4683 T) (y4680 T) (y4681 T) (y4679 T) (y4668 T) (y4678 T)) 
  (or 
    (and (= y4666 (f3 y4666)) (= y4667 (f3 y4667)) (distinct y4666 y4667)) 
    (and (= y4668 (f1 y4668)) (= y4669 (f1 y4669)) (distinct y4668 y4669)) 
    (and (= y4670 (f1 y4670)) (= y4671 (f1 y4671)) (distinct y4670 y4671)) 
    (and (= y4672 (f1 y4674)) (= y4674 (f2 y4675 (f2 (f3 PLACEHOLDER) PLACEHOLDER PLACEHOLDER (f3 PLACEHOLDER)) PLACEHOLDER (f3 (f3 PLACEHOLDER)))) (= y4675 (f2 y4676 (f1 PLACEHOLDER) PLACEHOLDER (f3 (f3 PLACEHOLDER)))) (= y4676 (f2 y4677 (f2 PLACEHOLDER PLACEHOLDER PLACEHOLDER PLACEHOLDER) (f2 PLACEHOLDER PLACEHOLDER PLACEHOLDER PLACEHOLDER) (f3 PLACEHOLDER))) (= y4677 (f3 y4672)) (= y4673 (f1 y4678)) (= y4678 (f2 y4679 (f2 (f3 PLACEHOLDER) PLACEHOLDER PLACEHOLDER (f3 PLACEHOLDER)) PLACEHOLDER (f3 (f3 PLACEHOLDER)))) (= y4679 (f2 y4680 (f1 PLACEHOLDER) PLACEHOLDER (f3 (f3 PLACEHOLDER)))) (= y4680 (f2 y4681 (f2 PLACEHOLDER PLACEHOLDER PLACEHOLDER PLACEHOLDER) (f2 PLACEHOLDER PLACEHOLDER PLACEHOLDER PLACEHOLDER) (f3 PLACEHOLDER))) (= y4681 (f3 y4673)) (distinct y4672 y4673)) 
    (and (= y4682 (f2 y4682 y4682 PLACEHOLDER PLACEHOLDER)) (= y4683 (f2 y4683 y4683 PLACEHOLDER PLACEHOLDER)) (distinct y4682 y4683)) 
    (and (= y4684 (f2 y4686 (f1 PLACEHOLDER) y4684 (f1 PLACEHOLDER))) (= y4686 (f2 y4684 PLACEHOLDER y4684 PLACEHOLDER)) (= y4685 (f2 (f2 y4685 PLACEHOLDER y4685 PLACEHOLDER) (f1 PLACEHOLDER) y4685 (f1 PLACEHOLDER))) (distinct y4684 y4685)))))
(check-sat)
