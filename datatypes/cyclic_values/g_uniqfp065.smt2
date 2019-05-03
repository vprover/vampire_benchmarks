(set-info :status unsat)
(declare-codatatypes ((T 0)) ((
  (f0)
  (f1 (proj0f1 T))
  (f2 (proj0f2 T))
  (f3 (proj0f3 T) (proj1f3 T) (proj2f3 T)))))
(assert (exists ((y6864 T) (y6865 T) (y6866 T) (y6867 T) (y6860 T) (y6861 T) (y6862 T) (y6863 T) (y6868 T) (y6869 T) (y6859 T) (y6873 T) (y6872 T) (y6871 T) (y6870 T)) 
  (or 
    (and (= y6859 (f3 y6861 (f3 (f1 y6859) (f1 PLACEHOLDER) (f2 PLACEHOLDER)) (f2 (f2 PLACEHOLDER)))) (= y6861 (f1 y6862)) (= y6862 (f1 y6863)) (= y6863 (f2 y6859)) (= y6860 (f3 y6864 (f3 (f1 y6860) (f1 PLACEHOLDER) (f2 PLACEHOLDER)) (f2 (f2 PLACEHOLDER)))) (= y6864 (f1 y6865)) (= y6865 (f1 y6866)) (= y6866 (f2 y6860)) (distinct y6859 y6860)) 
    (and (= y6867 (f1 y6867)) (= y6868 (f1 y6868)) (distinct y6867 y6868)) 
    (and (= y6869 (f2 y6871)) (= y6871 (f2 y6872)) (= y6872 (f1 y6873)) (= y6873 (f3 y6869 PLACEHOLDER PLACEHOLDER)) (= y6870 (f2 (f2 (f1 (f3 y6870 PLACEHOLDER PLACEHOLDER))))) (distinct y6869 y6870)))))
(check-sat)
