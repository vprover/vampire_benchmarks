(set-info :status unsat)
(declare-datatypes ((T 0)) ((
  (f0)
  (f1 (proj0f1 T) (proj1f1 T) (proj2f1 T) (proj3f1 T))
  (f2 (proj0f2 T) (proj1f2 T) (proj2f2 T))
  (f3 (proj0f3 T) (proj1f3 T) (proj2f3 T) (proj3f3 T)))))
(assert (exists ((y4844 T) (y4845 T) (y4846 T) (y4847 T) (y4841 T) (y4842 T) (y4843 T) (y4839 T) (y4859 T) (y4858 T) (y4853 T) (y4852 T) (y4851 T) (y4850 T) (y4856 T) (y4860 T) (y4861 T)) (forall ((x4863 T) (x4862 T) (x4867 T) (x4865 T) (x4869 T) (x4868 T) (x4870 T) (x4871 T)) 
  (or 
    (and (= y4839 (f3 x4862 (f1 x4870 x4870 x4870 x4870) x4870 x4870)) (= x4862 (f3 y4839 x4870 y4839 x4870))) (= y4841 x4868) (= y4842 (f3 y4842 x4870 x4870 x4870)) 
    (and (= y4843 (f2 y4844 (f3 (f3 x4870 x4870 x4870 x4870) (f1 x4870 x4870 x4870 x4870) (f1 x4870 (f1 x4870 x4870 x4870 x4870) (f1 x4870 x4870 x4870 x4870) x4870) (f1 x4870 x4870 x4870 x4870)) (f3 (f2 x4870 x4870 x4870) (f3 x4870 x4870 x4870 x4870) (f3 (f3 x4870 x4870 x4870 x4870) (f3 x4870 x4870 x4870 x4870) x4870 (f3 x4870 x4870 x4870 x4870)) x4870))) (= y4844 (f2 y4845 (f2 (f1 x4870 x4870 x4870 x4870) (f3 x4870 x4870 x4870 x4870) (f3 x4870 x4870 x4870 x4870)) x4870)) (= y4845 (f2 (f3 (f1 y4843 x4870 x4870 x4870) (f1 x4870 x4870 x4870 x4870) (f1 y4843 x4870 x4870 x4870) x4870) y4846 x4870)) (= y4846 (f2 y4847 (f2 x4870 x4870 x4870) (f3 x4870 x4870 x4870 x4870))) (= y4847 (f2 y4843 x4870 x4870))) 
    (and (= x4869 (f2 x4863 (f1 (f3 x4869 x4870 x4870 x4870) x4870 x4870 (f2 x4870 x4870 x4870)) (f3 x4870 (f3 x4870 x4870 x4870 x4870) (f2 (f1 x4870 x4870 x4870 x4870) x4870 (f3 x4870 x4870 x4870 x4870)) (f1 x4870 (f3 x4870 x4870 x4870 x4870) x4870 x4870)))) (= x4863 (f1 y4850 x4870 (f2 x4870 x4870 (f1 x4870 x4870 x4870 x4870)) (f3 (f3 (f3 x4870 x4870 x4870 x4870) (f2 x4870 x4870 x4870) x4870 x4870) (f2 x4870 x4870 x4870) x4870 (f1 x4870 x4870 x4870 x4870)))) (= y4850 (f3 y4851 (f2 x4870 x4870 x4870) x4870 (f2 x4870 x4870 x4870))) (= y4851 (f3 y4852 (f2 x4870 x4870 x4870) (f2 x4870 x4870 x4870) (f3 x4870 x4870 x4870 x4870))) (= y4852 (f1 x4869 x4869 x4870 x4870))) 
    (and (= y4853 (f2 x4871 (f2 y4853 x4870 x4870) (f3 (f1 x4870 (f2 x4870 x4870 x4870) x4870 (f3 x4870 x4870 x4870 x4870)) (f3 (f3 x4870 x4870 x4870 x4870) x4870 (f1 x4870 x4870 x4870 x4870) x4870) (f3 x4870 x4870 x4870 x4870) (f3 (f2 x4870 x4870 x4870) x4870 (f1 x4870 x4870 x4870 x4870) (f2 x4870 x4870 x4870))))) (= x4871 (f1 x4867 (f3 (f1 x4870 x4870 x4870 x4870) x4870 (f1 x4870 x4870 x4870 x4870) (f1 x4870 x4870 x4870 x4870)) x4870 (f3 x4870 x4870 x4870 x4870))) (= x4867 (f3 y4856 (f1 x4870 x4870 x4870 x4870) (f3 x4870 x4870 x4870 x4870) (f1 x4870 x4870 x4870 x4870))) (= y4856 (f1 y4853 x4870 x4870 x4870))) (= x4865 (f1 x4865 x4870 x4865 x4870)) (= y4858 (f1 y4858 y4858 x4870 x4870)) 
    (and (= y4859 (f1 (f1 y4859 x4870 x4870 x4870) x4870 y4860 (f3 x4870 x4870 x4870 x4870))) (= y4860 (f3 y4861 x4870 x4870 x4870)) (= y4861 (f2 y4859 x4870 x4870)))))))
(check-sat)
