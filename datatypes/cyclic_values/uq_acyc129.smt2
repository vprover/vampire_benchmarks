(set-info :status unsat)
(declare-datatypes ((T 0)) ((
  (f0)
  (f1 (proj0f1 T) (proj1f1 T) (proj2f1 T))
  (f2 (proj0f2 T) (proj1f2 T) (proj2f2 T))
  (f3 (proj0f3 T)))))
(assert (exists ((y13855 T) (y13838 T) (y13839 T) (y13850 T) (y13852 T) (y13837 T) (y13853 T) (y13856 T) (y13849 T) (y13848 T) (y13845 T) (y13857 T) (y13854 T) (y13851 T) (y13841 T) (y13840 T) (y13843 T) (y13842 T)) (forall ((x13864 T) (x13866 T) (x13867 T) (x13861 T) (x13862 T) (x13868 T) (x13869 T)) 
  (or 
    (and (= y13837 (f3 y13838)) (= y13838 (f3 y13839)) (= y13839 (f2 (f1 (f1 y13837 x13861 x13861) (f1 x13861 x13861 x13861) x13861) y13840 (f3 (f1 x13861 x13861 x13861)))) (= y13840 (f3 y13841)) (= y13841 (f3 y13837))) 
    (and (= y13842 (f2 (f1 y13842 x13861 x13861) y13843 x13861)) (= y13843 (f1 y13842 x13861 x13861))) (= x13866 (f3 x13866)) 
    (and (= y13845 (f2 x13864 (f3 x13861) (f2 x13861 (f1 x13861 x13861 x13861) x13861))) (= x13864 (f1 x13869 (f2 x13861 x13861 x13861) (f3 x13861))) (= x13869 (f1 y13845 x13861 x13861))) 
    (and (= y13848 (f2 y13849 (f2 x13861 (f2 x13861 (f3 x13861) (f2 x13861 x13861 x13861)) (f3 (f3 x13861))) (f3 x13861))) (= y13849 (f2 y13850 (f1 x13861 x13861 x13861) (f3 x13861))) (= y13850 (f2 y13851 (f3 x13861) (f3 (f1 x13861 x13861 x13861)))) (= y13851 (f1 y13852 (f2 x13861 x13861 x13861) x13861)) (= y13852 (f3 y13848))) 
    (and (= y13853 (f3 y13854)) (= y13854 (f3 y13855)) (= y13855 (f3 y13856)) (= y13856 (f2 y13857 x13861 (f1 x13861 x13861 x13861))) (= y13857 (f2 y13853 x13861 x13861))) (= x13868 x13862) (= x13867 (f2 x13867 x13861 x13861))))))
(check-sat)
