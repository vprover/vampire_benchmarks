(set-info :status unsat)
(declare-datatypes ((T 0)) ((
  (f0)
  (f1 (proj0f1 T) (proj1f1 T)))))
(assert (exists ((y1861 T) (y1860 T) (y1862 T) (y1853 T) (y1854 T) (y1855 T) (y1856 T) (y1857 T) (y1858 T) (y1859 T)) 
  (or 
    (and (= y1853 (f1 y1854 PLACEHOLDER)) (= y1854 (f1 y1855 (f1 PLACEHOLDER PLACEHOLDER))) (= y1855 (f1 y1856 (f1 PLACEHOLDER PLACEHOLDER))) (= y1856 (f1 y1853 PLACEHOLDER))) (= y1857 (f1 (f1 y1857 PLACEHOLDER) (f1 PLACEHOLDER PLACEHOLDER))) 
    (and (= y1858 (f1 y1859 (f1 PLACEHOLDER PLACEHOLDER))) (= y1859 (f1 y1860 (f1 PLACEHOLDER PLACEHOLDER))) (= y1860 (f1 y1861 PLACEHOLDER)) (= y1861 (f1 y1862 PLACEHOLDER)) (= y1862 (f1 y1858 PLACEHOLDER))))))
(check-sat)
