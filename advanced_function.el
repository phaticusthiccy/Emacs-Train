;; Phaticusthiccy Emacs-Train @2021 
;; All Right Reserved

;; defining a function with 2 optional params named cc and dd

(defun myfun (aa bb &optional cc dd)
  "test optional arguments"
  (insert aa bb cc dd)
  )

;; call it
(myfun "1" "2" "3" "4")
