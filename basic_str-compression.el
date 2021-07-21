;; Phaticusthiccy Emacs-Train @2021 
;; All Right Reserved

;; compare string
(equal "abc" "abc") ;  t

;; dedicated function for comparing string
(string-equal "abc" "abc") ;  t

(string-equal "abc" "Abc") ;  nil. ; Case matters!!

;; can be used to compare string and symbol
(string-equal "abc" 'abc) ;  t
