(set-info :status unsat)
(declare-codatatypes ((T 0)) ((
  (f0)
  (f1 (proj0f1 T) (proj1f1 T))
  (f2 (proj0f2 T) (proj1f2 T) (proj2f2 T))
  (f3 (proj0f3 T) (proj1f3 T) (proj2f3 T))
  (f4 (proj0f4 T)))))
(assert (exists ((y858 T) (y878 T) (y879 T) (y888 T) (y869 T) (y868 T) (y853 T) (y856 T) (y859 T) (y876 T) (y860 T) (y874 T) (y862 T) (y872 T) (y873 T) (y870 T) (y871 T) (y850 T) (y875 T) (y865 T) (y885 T) (y864 T) (y887 T) (y886 T) (y863 T) (y884 T) (y883 T) (y867 T) (y861 T) (y880 T) (y890 T) (y866 T) (y889 T) (y882 T)) (forall ((x899 T) (x898 T) (x897 T) (x896 T) (x895 T) (x894 T) (x892 T) (x891 T) (x900 T)) 
  (or 
    (and (= y850 (f3 y850 PLACEHOLDER PLACEHOLDER)) (= x892 (f3 x892 PLACEHOLDER PLACEHOLDER)) (distinct y850 x892)) 
    (and (= x900 (f1 x900 PLACEHOLDER)) (= y853 (f1 y853 PLACEHOLDER)) (distinct x900 y853)) 
    (and (= x898 (f4 x898)) (= x894 (f4 x894)) (distinct x898 x894)) 
    (and (= y856 (f3 y856 y856 PLACEHOLDER)) (= x891 x897) (distinct y856 x891)) 
    (and (= y858 (f1 y860 (f4 x896))) (= y860 (f4 y861)) (= y861 (f2 y858 y858 PLACEHOLDER)) (= y859 (f1 y862 (f4 x896))) (= y862 (f4 y863)) (= y863 (f2 y859 y859 PLACEHOLDER)) (distinct y858 y859)) 
    (and (= y864 (f4 y866)) (= y866 (f1 y867 PLACEHOLDER)) (= y867 (f3 y868 PLACEHOLDER PLACEHOLDER)) (= y868 (f1 y869 PLACEHOLDER)) (= y869 (f4 y864)) (= y865 (f4 y870)) (= y870 (f1 y871 PLACEHOLDER)) (= y871 (f3 y872 PLACEHOLDER PLACEHOLDER)) (= y872 (f1 y873 PLACEHOLDER)) (= y873 (f4 y865)) (distinct y864 y865)) 
    (and (= y874 (f4 y876)) (= y876 (f3 y874 PLACEHOLDER PLACEHOLDER)) (= y875 (f4 x899)) (= x899 (f3 y875 PLACEHOLDER PLACEHOLDER)) (distinct y874 y875)) 
    (and (= y878 (f2 y880 PLACEHOLDER (f3 PLACEHOLDER PLACEHOLDER PLACEHOLDER))) (= y880 (f1 y878 PLACEHOLDER)) (= y879 (f2 x895 PLACEHOLDER (f3 PLACEHOLDER PLACEHOLDER PLACEHOLDER))) (= x895 (f1 y879 PLACEHOLDER)) (distinct y878 y879)) 
    (and (= y882 (f1 y882 PLACEHOLDER)) (= y883 (f1 y883 PLACEHOLDER)) (distinct y882 y883)) 
    (and (= y884 (f3 (f3 (f1 (f2 (f2 y884 PLACEHOLDER PLACEHOLDER) PLACEHOLDER (f4 PLACEHOLDER)) (f1 PLACEHOLDER PLACEHOLDER)) (f4 (f1 PLACEHOLDER PLACEHOLDER)) PLACEHOLDER) (f1 y886 (f3 PLACEHOLDER PLACEHOLDER PLACEHOLDER)) (f3 PLACEHOLDER (f2 x896 (f2 x896 (f3 PLACEHOLDER PLACEHOLDER PLACEHOLDER) PLACEHOLDER) (f1 PLACEHOLDER PLACEHOLDER)) (f3 PLACEHOLDER (f3 PLACEHOLDER x896 x896) (f1 PLACEHOLDER PLACEHOLDER))))) (= y886 (f4 y887)) (= y887 (f2 y888 x896 (f1 PLACEHOLDER PLACEHOLDER))) (= y888 (f2 y884 PLACEHOLDER PLACEHOLDER)) (= y885 (f3 (f3 (f1 (f2 (f2 y885 PLACEHOLDER PLACEHOLDER) PLACEHOLDER (f4 PLACEHOLDER)) (f1 PLACEHOLDER PLACEHOLDER)) (f4 (f1 PLACEHOLDER PLACEHOLDER)) PLACEHOLDER) (f1 y889 (f3 PLACEHOLDER PLACEHOLDER PLACEHOLDER)) (f3 PLACEHOLDER (f2 x896 (f2 x896 (f3 PLACEHOLDER PLACEHOLDER PLACEHOLDER) PLACEHOLDER) (f1 PLACEHOLDER PLACEHOLDER)) (f3 PLACEHOLDER (f3 PLACEHOLDER x896 x896) (f1 PLACEHOLDER PLACEHOLDER))))) (= y889 (f4 (f2 y890 x896 (f1 PLACEHOLDER PLACEHOLDER)))) (= y890 (f2 y885 PLACEHOLDER PLACEHOLDER)) (distinct y884 y885))))))
(check-sat)