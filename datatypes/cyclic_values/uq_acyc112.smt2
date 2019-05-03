(set-info :status unsat)
(declare-datatypes ((T 0)) ((
  (f0)
  (f1 (proj0f1 T)))))
(assert (exists ((y11977 T) (y11976 T) (y11975 T) (y11980 T) (y11981 T) (y11979 T) (y11978 T)) (forall ((x11992 T) (x11993 T) (x11991 T) (x11994 T) (x11995 T) (x11989 T)) 
  (or 
    (and (= y11975 (f1 y11976)) (= y11976 (f1 y11977)) (= y11977 (f1 y11975))) 
    (and (= y11978 (f1 y11979)) (= y11979 x11995) (= y11980 (f1 y11981)) (= y11981 (f1 y11978))) (= x11994 (f1 x11994)) (= x11989 (f1 x11989)) (= x11993 x11992) (= x11991 (f1 (f1 (f1 x11991))))))))
(check-sat)
