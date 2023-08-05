(in-package :lem)
;; Vim mode
(lem-vi-mode:vi-mode)

;; Load paredit
(lem-paredit-mode:paredit-mode)

(add-hook lem:*find-file-hook*
          (lambda (buffer)
              (change-buffer-mode buffer 'lem-paredit-mode:paredit-mode t)))


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

