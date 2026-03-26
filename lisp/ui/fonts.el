;;; fonts.el  -*- coding: utf-8; lexical-binding: t; -*-

(defvar my/monitor-font-alist
  '((350 . "JetBrainsMonoNL NF-18")
    (9999 . "JetBrainsMonoNL NF-15")))

(defun my/get-font-by-width (width)
  (cdr (seq-find (lambda (entry) (<= width (car entry)))
                 my/monitor-font-alist)))

(defun my/update-font-based-on-monitor (&optional frame)
  (let ((frame (or frame (selected-frame))))
    (when (display-graphic-p frame)
      (let* ((attrs (frame-monitor-attributes frame))
             (mm-size (cdr (assoc 'mm-size attrs)))
             (width-mm (or (car mm-size) 400))
             (font (my/get-font-by-width width-mm)))
        (when font
          (set-face-attribute 'default frame :font font)
          (message "Font → %s (%dmm)" font width-mm))))))

(add-hook 'after-make-frame-functions #'my/update-font-based-on-monitor)
(add-hook 'server-after-make-frame-hook #'my/update-font-based-on-monitor)
(add-hook 'focus-in-hook #'my/update-font-based-on-monitor)
(my/update-font-based-on-monitor)

(provide 'fonts)
;;; fonts.el ends here
