(set-info :status unsat)
(declare-codatatypes ((T 0)) ((
  (f0)
  (f1 (proj0f1 T) (proj1f1 T) (proj2f1 T) (proj3f1 T))
  (f2 (proj0f2 T)))))
(assert (exists ((y1026 T) (y1055 T) (y1047 T) (y1023 T) (y1049 T) (y1048 T) (y1050 T) (y1051 T) (y1045 T) (y1044 T) (y1054 T) (y1042 T) (y1053 T) (y1029 T) (y1028 T) (y1038 T) (y1039 T) (y1025 T) (y1024 T) (y1027 T) (y1035 T) (y1032 T) (y1033 T) (y1030 T) (y1022 T) (y1036 T) (y1052 T) (y1037 T) (y1034 T)) (forall ((x1060 T) (x1061 T) (x1062 T) (x1064 T) (x1065 T) (x1059 T) (x1056 T)) 
  (or 
    (and (= y1022 x1056) (= y1024 (f2 y1025)) (= y1025 (f2 y1026)) (= y1026 (f1 y1022 PLACEHOLDER PLACEHOLDER PLACEHOLDER)) (= y1023 (f1 (f1 (f2 y1023) (f1 PLACEHOLDER PLACEHOLDER PLACEHOLDER PLACEHOLDER) PLACEHOLDER PLACEHOLDER) (f2 (f1 (f1 PLACEHOLDER PLACEHOLDER PLACEHOLDER PLACEHOLDER) (f2 PLACEHOLDER) (f2 PLACEHOLDER) (f1 PLACEHOLDER PLACEHOLDER PLACEHOLDER PLACEHOLDER))) y1027 (f2 (f1 PLACEHOLDER PLACEHOLDER PLACEHOLDER PLACEHOLDER)))) (= y1027 (f2 y1028)) (= y1028 (f2 y1029)) (= y1029 (f1 y1023 PLACEHOLDER PLACEHOLDER PLACEHOLDER)) (distinct y1022 y1023)) 
    (and (= y1030 (f1 (f1 (f2 y1032) (f1 PLACEHOLDER PLACEHOLDER PLACEHOLDER PLACEHOLDER) PLACEHOLDER (f1 PLACEHOLDER PLACEHOLDER (f1 PLACEHOLDER PLACEHOLDER PLACEHOLDER PLACEHOLDER) (f1 PLACEHOLDER PLACEHOLDER PLACEHOLDER PLACEHOLDER))) (f2 (f1 (f2 PLACEHOLDER) PLACEHOLDER (f1 (f1 PLACEHOLDER PLACEHOLDER PLACEHOLDER PLACEHOLDER) PLACEHOLDER (f2 PLACEHOLDER) (f2 PLACEHOLDER)) (f1 PLACEHOLDER (f2 PLACEHOLDER) (f2 PLACEHOLDER) PLACEHOLDER))) PLACEHOLDER PLACEHOLDER)) (= y1032 (f2 y1033)) (= y1033 (f2 y1030)) (= x1060 (f1 (f1 (f2 (f2 (f2 x1060))) (f1 PLACEHOLDER PLACEHOLDER PLACEHOLDER PLACEHOLDER) PLACEHOLDER (f1 PLACEHOLDER PLACEHOLDER (f1 PLACEHOLDER PLACEHOLDER PLACEHOLDER PLACEHOLDER) (f1 PLACEHOLDER PLACEHOLDER PLACEHOLDER PLACEHOLDER))) (f2 (f1 (f2 PLACEHOLDER) PLACEHOLDER (f1 (f1 PLACEHOLDER PLACEHOLDER PLACEHOLDER PLACEHOLDER) PLACEHOLDER (f2 PLACEHOLDER) (f2 PLACEHOLDER)) (f1 PLACEHOLDER (f2 PLACEHOLDER) (f2 PLACEHOLDER) PLACEHOLDER))) PLACEHOLDER PLACEHOLDER)) (distinct y1030 x1060)) 
    (and (= y1034 (f2 y1036)) (= y1036 (f2 y1037)) (= y1037 (f2 y1038)) (= y1038 (f1 y1039 (f1 PLACEHOLDER PLACEHOLDER PLACEHOLDER PLACEHOLDER) PLACEHOLDER (f2 PLACEHOLDER))) (= y1039 (f2 y1034)) (= y1035 (f2 (f2 (f2 (f1 (f2 y1035) (f1 PLACEHOLDER PLACEHOLDER PLACEHOLDER PLACEHOLDER) PLACEHOLDER (f2 PLACEHOLDER)))))) (distinct y1034 y1035)) 
    (and (= x1061 x1062) (= x1064 (f2 x1064)) (distinct x1061 x1064)) 
    (and (= y1042 (f1 y1042 y1042 y1044 PLACEHOLDER)) (= y1044 (f2 y1042)) (= x1065 (f1 x1065 x1065 y1045 PLACEHOLDER)) (= y1045 (f2 x1065)) (distinct y1042 x1065)) 
    (and (= x1059 (f2 y1048)) (= y1048 (f2 y1049)) (= y1049 (f2 y1050)) (= y1050 (f1 (f1 x1059 PLACEHOLDER PLACEHOLDER PLACEHOLDER) y1051 (f1 PLACEHOLDER PLACEHOLDER PLACEHOLDER PLACEHOLDER) PLACEHOLDER)) (= y1051 (f2 x1059)) (= y1047 (f2 y1052)) (= y1052 (f2 y1053)) (= y1053 (f2 y1054)) (= y1054 (f1 (f1 y1047 PLACEHOLDER PLACEHOLDER PLACEHOLDER) y1055 (f1 PLACEHOLDER PLACEHOLDER PLACEHOLDER PLACEHOLDER) PLACEHOLDER)) (= y1055 (f2 y1047)) (distinct x1059 y1047))))))
(check-sat)