;; Phaticusthiccy Emacs-Train @2021 
;; All Right Reserved

(defun deletefile (&optional @no-backup-p)
 
  (interactive "P")
  (let* (
         ($fname (buffer-file-name))
         ($buffer-is-file-p $fname)
         ($backup-suffix (concat "~" (format-time-string "%Y%m%dT%H%M%S") "~")))
    (if $buffer-is-file-p
        (progn
          (save-buffer $fname)
          (when (not @no-backup-p)
            (copy-file
             $fname
             (concat $fname $backup-suffix)
             t))
          (delete-file $fname)
          (message "Deleted. Backup created at 「%s」." (concat $fname $backup-suffix)))
      (when (not @no-backup-p)
        (widen)
        (write-region (point-min) (point-max) (concat "xx" $backup-suffix))
        (message "Backup created at 「%s」." (concat "xx" $backup-suffix))))
    (kill-buffer (current-buffer))))

;;; More Advanced Version 

(defun xah-delete-current-file (&optional @no-backup-p)
  
  (interactive "P")
  (if (eq major-mode 'dired-mode)
      (progn
        (message "you in dired. nothing's done.")
        ;; (dired-up-directory)
        ;; (dired-flag-file-deletion 1)
        ;; (dired-do-flagged-delete)
        ;; (revert-buffer)
        )
    (let (($bstr (buffer-string)))
      (when (> (length $bstr) 0)
        (if (< (point-max) 1000000)
            (kill-new $bstr)
          (message "Content not copied. buffer size is greater than 1 megabytes.")))
      (if (buffer-file-name)
          (xah-delete-current-file-make-backup @no-backup-p)
        (when (buffer-file-name)
          (when (file-exists-p (buffer-file-name))
            (progn
              (delete-file (buffer-file-name))
              (message "Deleted file: 「%s」." (buffer-file-name)))))
        (let ((buffer-offer-save nil))
          (set-buffer-modified-p nil)
          (kill-buffer (current-buffer)))))))
