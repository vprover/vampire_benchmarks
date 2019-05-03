(set-info :status unsat)
(declare-codatatypes ((T 0)) ((
  (f0)
  (f1 (proj0f1 T))
  (f2 (proj0f2 T))
  (f3 (proj0f3 T))
  (f4 (proj0f4 T) (proj1f4 T) (proj2f4 T) (proj3f4 T)))))
(assert (exists ((y8826 T) (y8827 T) (y8837 T) (y8836 T) (y8831 T) (y8830 T) (y8833 T) (y8832 T) (y8839 T) (y8838 T) (y8828 T) (y8829 T) (y8840 T) (y8834 T) (y8835 T)) 
  (or 
    (and (= y8826 (f1 y8828)) (= y8828 (f4 y8829 PLACEHOLDER (f3 PLACEHOLDER) (f2 (f3 PLACEHOLDER)))) (= y8829 (f1 y8830)) (= y8830 (f2 y8826)) (= y8827 (f1 (f4 (f1 y8831) PLACEHOLDER (f3 PLACEHOLDER) (f2 (f3 PLACEHOLDER))))) (= y8831 (f2 y8827)) (distinct y8826 y8827)) 
    (and (= y8832 (f1 y8834)) (= y8834 (f3 y8835)) (= y8835 (f2 y8836)) (= y8836 (f3 y8837)) (= y8837 (f2 y8832)) (= y8833 (f1 (f3 y8838))) (= y8838 (f2 y8839)) (= y8839 (f3 y8840)) (= y8840 (f2 y8833)) (distinct y8832 y8833)))))
(check-sat)
