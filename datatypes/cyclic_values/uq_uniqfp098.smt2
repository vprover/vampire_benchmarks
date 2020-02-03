(set-info :status unsat)
(declare-codatatypes ((T 0)) ((
  (f0)
  (f1 (proj0f1 T))
  (f2 (proj0f2 T) (proj1f2 T) (proj2f2 T) (proj3f2 T))
  (f3 (proj0f3 T))
  (f4 (proj0f4 T) (proj1f4 T) (proj2f4 T) (proj3f4 T)))))
(assert (exists ((y10898 T) (y10875 T) (y10899 T) (y10890 T) (y10888 T) (y10874 T) (y10884 T) (y10885 T) (y10886 T) (y10887 T) (y10880 T) (y10877 T) (y10882 T) (y10881 T) (y10876 T) (y10904 T) (y10883 T) (y10896 T) (y10900 T) (y10903 T) (y10870 T) (y10866 T) (y10867 T) (y10864 T) (y10865 T) (y10871 T) (y10863 T) (y10873 T) (y10872 T) (y10894 T) (y10901 T) (y10879 T) (y10878 T) (y10868 T) (y10869 T) (y10902 T)) (forall ((x10908 T) (x10909 T) (x10906 T) (x10914 T) (x10905 T) (x10911 T) (x10910 T) (x10913 T) (x10912 T) (x10907 T)) 
  (or 
    (and (= x10911 x10906) (= y10864 (f3 x10911)) (= y10863 (f2 y10865 y10863 x10912 x10912)) (= y10865 (f3 y10863)) (distinct x10911 y10863)) 
    (and (= y10866 (f2 y10866 x10912 y10866 x10912)) (= y10867 (f2 y10867 x10912 y10867 x10912)) (distinct y10866 y10867)) 
    (and (= y10868 (f2 y10870 (f1 (f3 x10912)) x10912 (f1 (f3 x10912)))) (= y10870 (f3 y10871)) (= y10871 (f3 y10872)) (= y10872 (f3 y10873)) (= y10873 (f4 y10868 x10912 x10912 x10912)) (= y10869 (f2 (f3 y10874) (f1 (f3 x10912)) x10912 (f1 (f3 x10912)))) (= y10874 (f3 y10875)) (= y10875 (f3 y10876)) (= y10876 (f4 y10869 x10912 x10912 x10912)) (distinct y10868 y10869)) 
    (and (= y10877 (f2 (f1 (f1 (f4 y10877 x10912 x10912 x10912))) x10912 y10879 x10912)) (= y10879 (f3 y10880)) (= y10880 (f4 (f2 y10877 x10912 x10912 x10912) y10881 (f1 x10912) (f1 x10912))) (= y10881 (f4 y10877 x10912 x10912 x10912)) (= y10878 (f2 (f1 (f1 (f4 y10878 x10912 x10912 x10912))) x10912 y10882 x10912)) (= y10882 (f3 y10883)) (= y10883 (f4 (f2 y10878 x10912 x10912 x10912) y10884 (f1 x10912) (f1 x10912))) (= y10884 (f4 y10878 x10912 x10912 x10912)) (distinct y10877 y10878)) 
    (and (= y10885 (f1 (f4 (f4 (f3 y10887) x10912 x10912 (f4 x10912 (f4 x10912 x10912 x10912 x10912) (f1 x10912) (f1 x10912))) x10912 (f3 x10912) x10912))) (= y10887 (f4 y10885 x10912 x10912 x10912)) (= y10886 (f1 (f4 y10888 x10912 (f3 x10912) x10912))) (= y10888 (f4 x10905 x10912 x10912 (f4 x10912 (f4 x10912 x10912 x10912 x10912) (f1 x10912) (f1 x10912)))) (= x10905 (f3 y10890)) (= y10890 (f4 y10886 x10912 x10912 x10912)) (distinct y10885 y10886)) 
    (and (= x10910 (f4 x10910 x10912 x10912 x10912)) (= x10907 x10909) (distinct x10910 x10907)) 
    (and (= x10914 (f4 x10914 x10912 x10912 x10912)) (= y10894 (f4 y10894 x10912 x10912 x10912)) (distinct x10914 y10894)) 
    (and (= x10913 (f1 x10908)) (= x10908 (f2 y10898 (f4 (f4 x10912 x10912 x10912 x10912) x10912 (f1 x10912) x10912) x10912 x10912)) (= y10898 (f1 y10899)) (= y10899 (f1 x10913)) (= y10896 (f1 y10900)) (= y10900 (f2 y10901 (f4 (f4 x10912 x10912 x10912 x10912) x10912 (f1 x10912) x10912) x10912 x10912)) (= y10901 (f1 y10902)) (= y10902 (f1 y10896)) (distinct x10913 y10896)) 
    (and (= y10903 (f4 y10903 x10912 x10912 x10912)) (= y10904 (f4 y10904 x10912 x10912 x10912)) (distinct y10903 y10904))))))
(check-sat)