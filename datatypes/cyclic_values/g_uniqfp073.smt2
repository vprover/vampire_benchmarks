(set-info :status unsat)
(declare-codatatypes ((T 0)) ((
  (f0)
  (f1 (proj0f1 T) (proj1f1 T))
  (f2 (proj0f2 T))
  (f3 (proj0f3 T))
  (f4 (proj0f4 T) (proj1f4 T)))))
(assert (exists ((y7881 T) (y7880 T) (y7883 T) (y7877 T) (y7885 T) (y7884 T) (y7887 T) (y7886 T) (y7889 T) (y7888 T) (y7890 T) (y7882 T) (y7872 T) (y7894 T) (y7892 T) (y7878 T) (y7873 T) (y7893 T) (y7879 T) (y7863 T) (y7862 T) (y7861 T) (y7860 T) (y7867 T) (y7866 T) (y7865 T) (y7864 T) (y7874 T) (y7875 T) (y7869 T) (y7868 T) (y7870 T) (y7871 T) (y7858 T) (y7859 T) (y7895 T) (y7891 T) (y7876 T)) 
  (or 
    (and (= y7858 (f2 y7858)) (= y7859 (f2 y7859)) (distinct y7858 y7859)) 
    (and (= y7860 (f2 (f1 (f2 y7862) (f2 PLACEHOLDER)))) (= y7862 (f4 y7860 PLACEHOLDER)) (= y7861 (f2 (f1 (f2 (f4 y7861 PLACEHOLDER)) (f2 PLACEHOLDER)))) (distinct y7860 y7861)) 
    (and (= y7863 (f3 y7865)) (= y7865 (f4 y7866 PLACEHOLDER)) (= y7866 (f1 y7867 (f2 (f3 PLACEHOLDER)))) (= y7867 (f1 y7868 (f1 PLACEHOLDER PLACEHOLDER))) (= y7868 (f1 y7863 PLACEHOLDER)) (= y7864 (f3 (f4 y7869 PLACEHOLDER))) (= y7869 (f1 (f1 y7870 (f1 PLACEHOLDER PLACEHOLDER)) (f2 (f3 PLACEHOLDER)))) (= y7870 (f1 y7864 PLACEHOLDER)) (distinct y7863 y7864)) 
    (and (= y7871 (f2 y7873)) (= y7873 (f4 y7874 PLACEHOLDER)) (= y7874 (f2 y7875)) (= y7875 (f4 y7876 (f3 PLACEHOLDER))) (= y7876 (f2 y7871)) (= y7872 (f2 (f4 (f2 (f4 y7877 (f3 PLACEHOLDER))) PLACEHOLDER))) (= y7877 (f2 y7872)) (distinct y7871 y7872)) 
    (and (= y7878 (f2 y7878)) (= y7879 (f2 y7879)) (distinct y7878 y7879)) 
    (and (= y7880 (f2 y7882)) (= y7882 (f4 y7883 (f1 (f2 PLACEHOLDER) (f3 PLACEHOLDER)))) (= y7883 (f3 y7884)) (= y7884 (f2 y7880)) (= y7881 (f2 (f4 y7885 (f1 (f2 PLACEHOLDER) (f3 PLACEHOLDER))))) (= y7885 (f3 y7886)) (= y7886 (f2 y7881)) (distinct y7880 y7881)) 
    (and (= y7887 (f1 (f2 y7889) (f1 (f2 PLACEHOLDER) (f1 PLACEHOLDER PLACEHOLDER)))) (= y7889 (f1 y7890 (f3 PLACEHOLDER))) (= y7890 (f2 y7891)) (= y7891 (f1 y7887 PLACEHOLDER)) (= y7888 (f1 y7892 (f1 (f2 PLACEHOLDER) (f1 PLACEHOLDER PLACEHOLDER)))) (= y7892 (f2 y7893)) (= y7893 (f1 y7894 (f3 PLACEHOLDER))) (= y7894 (f2 y7895)) (= y7895 (f1 y7888 PLACEHOLDER)) (distinct y7887 y7888)))))
(check-sat)