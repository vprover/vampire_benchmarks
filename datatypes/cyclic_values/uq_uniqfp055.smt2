(set-info :status unsat)
(declare-codatatypes ((T 0)) ((
  (f0)
  (f1 (proj0f1 T) (proj1f1 T))
  (f2 (proj0f2 T) (proj1f2 T))
  (f3 (proj0f3 T) (proj1f3 T) (proj2f3 T) (proj3f3 T)))))
(assert (exists ((y5865 T) (y5864 T) (y5867 T) (y5866 T) (y5861 T) (y5873 T) (y5863 T) (y5871 T) (y5893 T) (y5869 T) (y5868 T) (y5878 T) (y5879 T) (y5877 T) (y5890 T) (y5872 T) (y5897 T) (y5874 T) (y5870 T) (y5889 T) (y5888 T) (y5876 T) (y5886 T) (y5885 T) (y5884 T) (y5894 T) (y5882 T) (y5881 T) (y5880 T) (y5887 T) (y5891 T) (y5895 T) (y5892 T)) (forall ((x5898 T) (x5903 T) (x5902 T) (x5901 T) (x5900 T) (x5907 T) (x5906 T) (x5905 T) (x5904 T)) 
  (or 
    (and (= y5861 (f3 (f2 (f1 (f3 y5861 PLACEHOLDER PLACEHOLDER PLACEHOLDER) PLACEHOLDER) (f3 PLACEHOLDER PLACEHOLDER PLACEHOLDER PLACEHOLDER)) (f1 (f3 PLACEHOLDER PLACEHOLDER PLACEHOLDER PLACEHOLDER) (f1 (f2 PLACEHOLDER PLACEHOLDER) (f2 PLACEHOLDER PLACEHOLDER))) (f3 (f3 y5863 (f2 PLACEHOLDER PLACEHOLDER) PLACEHOLDER (f3 PLACEHOLDER PLACEHOLDER PLACEHOLDER PLACEHOLDER)) (f1 PLACEHOLDER PLACEHOLDER) (f3 PLACEHOLDER PLACEHOLDER PLACEHOLDER PLACEHOLDER) (f3 (f3 PLACEHOLDER PLACEHOLDER PLACEHOLDER PLACEHOLDER) PLACEHOLDER (f2 PLACEHOLDER PLACEHOLDER) (f1 PLACEHOLDER PLACEHOLDER))) (f1 PLACEHOLDER PLACEHOLDER))) (= y5863 (f1 y5861 PLACEHOLDER)) (= x5898 (f3 (f2 (f1 (f3 x5898 PLACEHOLDER PLACEHOLDER PLACEHOLDER) PLACEHOLDER) (f3 PLACEHOLDER PLACEHOLDER PLACEHOLDER PLACEHOLDER)) (f1 (f3 PLACEHOLDER PLACEHOLDER PLACEHOLDER PLACEHOLDER) (f1 (f2 PLACEHOLDER PLACEHOLDER) (f2 PLACEHOLDER PLACEHOLDER))) (f3 (f3 y5864 (f2 PLACEHOLDER PLACEHOLDER) PLACEHOLDER (f3 PLACEHOLDER PLACEHOLDER PLACEHOLDER PLACEHOLDER)) (f1 PLACEHOLDER PLACEHOLDER) (f3 PLACEHOLDER PLACEHOLDER PLACEHOLDER PLACEHOLDER) (f3 (f3 PLACEHOLDER PLACEHOLDER PLACEHOLDER PLACEHOLDER) PLACEHOLDER (f2 PLACEHOLDER PLACEHOLDER) (f1 PLACEHOLDER PLACEHOLDER))) (f1 PLACEHOLDER PLACEHOLDER))) (= y5864 (f1 x5898 PLACEHOLDER)) (distinct y5861 x5898)) 
    (and (= y5865 (f2 (f1 (f2 (f2 y5867 (f3 PLACEHOLDER PLACEHOLDER PLACEHOLDER PLACEHOLDER)) (f3 (f1 PLACEHOLDER PLACEHOLDER) (f2 PLACEHOLDER PLACEHOLDER) PLACEHOLDER PLACEHOLDER)) PLACEHOLDER) (f1 PLACEHOLDER (f1 PLACEHOLDER PLACEHOLDER)))) (= y5867 x5901) (= y5866 (f2 y5868 (f1 PLACEHOLDER (f1 PLACEHOLDER PLACEHOLDER)))) (= y5868 (f1 y5869 PLACEHOLDER)) (= y5869 (f2 y5870 (f3 (f1 PLACEHOLDER PLACEHOLDER) (f2 PLACEHOLDER PLACEHOLDER) PLACEHOLDER PLACEHOLDER))) (= y5870 (f2 y5871 (f3 PLACEHOLDER PLACEHOLDER PLACEHOLDER PLACEHOLDER))) (= y5871 (f1 y5866 PLACEHOLDER)) (distinct y5865 y5866)) 
    (and (= y5872 (f1 y5872 PLACEHOLDER)) (= y5873 x5902) (distinct y5872 y5873)) 
    (and (= y5874 (f2 (f3 (f2 y5874 PLACEHOLDER) PLACEHOLDER (f2 PLACEHOLDER PLACEHOLDER) (f1 PLACEHOLDER PLACEHOLDER)) PLACEHOLDER)) (= x5907 (f2 y5876 PLACEHOLDER)) (= y5876 (f3 y5877 PLACEHOLDER (f2 PLACEHOLDER PLACEHOLDER) (f1 PLACEHOLDER PLACEHOLDER))) (= y5877 (f2 x5907 PLACEHOLDER)) (distinct y5874 x5907)) 
    (and (= y5878 (f2 y5880 (f1 PLACEHOLDER PLACEHOLDER))) (= y5880 (f3 y5878 PLACEHOLDER PLACEHOLDER PLACEHOLDER)) (= y5879 (f2 y5881 (f1 PLACEHOLDER PLACEHOLDER))) (= y5881 (f3 y5879 PLACEHOLDER PLACEHOLDER PLACEHOLDER)) (distinct y5878 y5879)) 
    (and (= y5882 (f2 y5882 PLACEHOLDER)) (= x5905 x5903) (distinct y5882 x5905)) 
    (and (= y5884 (f3 (f3 y5884 PLACEHOLDER PLACEHOLDER PLACEHOLDER) y5886 (f3 PLACEHOLDER PLACEHOLDER PLACEHOLDER PLACEHOLDER) (f1 PLACEHOLDER PLACEHOLDER))) (= y5886 x5906) (= y5885 (f3 (f3 y5885 PLACEHOLDER PLACEHOLDER PLACEHOLDER) (f3 y5885 PLACEHOLDER y5885 PLACEHOLDER) (f3 PLACEHOLDER PLACEHOLDER PLACEHOLDER PLACEHOLDER) (f1 PLACEHOLDER PLACEHOLDER))) (distinct y5884 y5885)) 
    (and (= y5887 (f3 y5889 x5904 (f1 (f3 y5887 PLACEHOLDER PLACEHOLDER PLACEHOLDER) PLACEHOLDER) (f3 (f1 (f3 PLACEHOLDER PLACEHOLDER PLACEHOLDER PLACEHOLDER) PLACEHOLDER) (f1 (f3 PLACEHOLDER PLACEHOLDER PLACEHOLDER PLACEHOLDER) PLACEHOLDER) (f1 PLACEHOLDER PLACEHOLDER) (f3 PLACEHOLDER PLACEHOLDER PLACEHOLDER PLACEHOLDER)))) (= y5889 (f3 y5890 (f2 PLACEHOLDER PLACEHOLDER) (f3 (f2 PLACEHOLDER PLACEHOLDER) PLACEHOLDER (f2 PLACEHOLDER PLACEHOLDER) (f1 PLACEHOLDER PLACEHOLDER)) (f1 (f1 PLACEHOLDER PLACEHOLDER) PLACEHOLDER))) (= y5890 (f2 y5891 PLACEHOLDER)) (= y5891 (f1 y5887 PLACEHOLDER)) (= y5888 (f3 (f3 y5892 (f2 PLACEHOLDER PLACEHOLDER) (f3 (f2 PLACEHOLDER PLACEHOLDER) PLACEHOLDER (f2 PLACEHOLDER PLACEHOLDER) (f1 PLACEHOLDER PLACEHOLDER)) (f1 (f1 PLACEHOLDER PLACEHOLDER) PLACEHOLDER)) x5904 (f1 (f3 y5888 PLACEHOLDER PLACEHOLDER PLACEHOLDER) PLACEHOLDER) (f3 (f1 (f3 PLACEHOLDER PLACEHOLDER PLACEHOLDER PLACEHOLDER) PLACEHOLDER) (f1 (f3 PLACEHOLDER PLACEHOLDER PLACEHOLDER PLACEHOLDER) PLACEHOLDER) (f1 PLACEHOLDER PLACEHOLDER) (f3 PLACEHOLDER PLACEHOLDER PLACEHOLDER PLACEHOLDER)))) (= y5892 (f2 y5893 PLACEHOLDER)) (= y5893 (f1 y5888 PLACEHOLDER)) (distinct y5887 y5888)) 
    (and (= y5894 (f2 y5894 PLACEHOLDER)) (= y5895 (f2 y5895 PLACEHOLDER)) (distinct y5894 y5895)) 
    (and (= x5900 (f1 x5900 PLACEHOLDER)) (= y5897 (f1 y5897 PLACEHOLDER)) (distinct x5900 y5897))))))
(check-sat)