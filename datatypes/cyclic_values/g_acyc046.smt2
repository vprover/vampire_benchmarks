(set-info :status unsat)
(declare-datatypes ((T 0)) ((
  (f0)
  (f1 (proj0f1 T))
  (f2 (proj0f2 T))
  (f3 (proj0f3 T) (proj1f3 T) (proj2f3 T) (proj3f3 T))
  (f4 (proj0f4 T) (proj1f4 T)))))
(assert (exists ((y4754 T) (y4755 T) (y4756 T) (y4757 T) (y4750 T) (y4751 T) (y4752 T) (y4753 T) (y4758 T) (y4759 T) (y4749 T) (y4748 T) (y4768 T) (y4765 T) (y4764 T) (y4767 T) (y4766 T) (y4761 T) (y4760 T) (y4763 T) (y4762 T)) 
  (or 
    (and (= y4748 (f3 (f1 (f2 y4749)) (f3 (f2 (f4 PLACEHOLDER PLACEHOLDER)) (f1 PLACEHOLDER) PLACEHOLDER (f3 PLACEHOLDER (f1 PLACEHOLDER) PLACEHOLDER (f1 PLACEHOLDER))) PLACEHOLDER (f2 (f2 PLACEHOLDER)))) (= y4749 (f2 y4750)) (= y4750 (f3 y4748 PLACEHOLDER PLACEHOLDER PLACEHOLDER))) 
    (and (= y4751 (f3 y4752 (f1 (f4 PLACEHOLDER PLACEHOLDER)) PLACEHOLDER PLACEHOLDER)) (= y4752 (f2 y4753)) (= y4753 (f3 y4751 PLACEHOLDER PLACEHOLDER PLACEHOLDER))) 
    (and (= y4754 (f2 y4755)) (= y4755 (f4 y4756 (f1 (f2 (f1 PLACEHOLDER))))) (= y4756 (f2 y4757)) (= y4757 (f3 y4758 (f2 PLACEHOLDER) PLACEHOLDER (f4 PLACEHOLDER PLACEHOLDER))) (= y4758 (f1 y4754))) (= y4759 (f1 y4759)) 
    (and (= y4760 (f1 y4761)) (= y4761 (f4 y4762 (f2 (f2 (f3 PLACEHOLDER PLACEHOLDER PLACEHOLDER PLACEHOLDER))))) (= y4762 (f4 y4763 (f2 PLACEHOLDER))) (= y4763 (f2 y4764)) (= y4764 (f2 y4760))) (= y4765 (f1 y4765)) (= y4766 (f2 y4766)) 
    (and (= y4767 (f4 (f4 y4768 PLACEHOLDER) (f1 PLACEHOLDER))) (= y4768 (f2 y4767))))))
(check-sat)
