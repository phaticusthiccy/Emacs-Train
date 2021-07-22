;; Phaticusthiccy Emacs-Train @2021 
;; All Right Reserved

(if (locate-library "calculator")
    (progn
     (autoload 'calculator "calculator"
      "Run the Emacs calculator." t)
     (global-set-key [(control return)] 'calculator)))
