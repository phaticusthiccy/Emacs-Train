;; Phaticusthiccy Emacs-Train @2021 
;; All Right Reserved

;; defining a function with rest args

(defun ff (aa bb &rest cc)
  "test rest arguments"
  (message "%s" cc) ; cc is a list
  )

;; test
(ff "1" "2" "3" "4")
;; ("3" "4")
