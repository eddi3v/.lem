(in-package :lem)
;; Vim mode
(lem-vi-mode:vi-mode)

(defparameter *fer/vi-exit-q-buffers* '("*peek-source*"))

(define-command fer/exit-vi-buffer ()()
  (let* ((buffer (current-buffer))
         (buffer-name (buffer-name buffer)))
    (when (find buffer-name *fer/vi-exit-q-buffers* 
                :test 'string-equal)
      (delete-active-window)))) 

;; My functions
(define-command open-init-file () ()
  (find-file 
   (merge-pathnames "init.lisp" (lem-home))))

