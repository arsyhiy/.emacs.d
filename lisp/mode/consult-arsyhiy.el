;;; consult-arsyhiy.el --- Search and navigate via completing-read  -*- lexical-binding: t; -*-
;; Author: arsyhiy
;; Package-Requires: ((emacs "30.1"))

;;; Commentary:

;;; Code:

(use-package consult
  :ensure t
  :straight t
  :defer t
  :init
  
  (advice-add #'register-preview :override #'consult-register-window)

  (setq xref-show-xrefs-function #'consult-xref
        xref-show-definitions-function #'consult-xref))

(provide 'consult-arsyhiy)
;;; consult-arsyhiy.el ends here
