;;; arsyhiy-org.el  ---  -*- coding: utf-8; lexical-binding: t -*-

;; Copyright (C) 2025
;; Version: 1.0
;; packages-Requires: ((emacs "30"))
;; Keywords: no keywords

;; Commentary:

;; no comment

;; Code 
;;; NOTE: rewrie org config in more right way

;; packages

(use-package org
  :ensure t
	:defer t
  :custom
  (org-edit-src-content-indentation 2) ;; Set src block automatic indent to 4 instead of 2.

  :hook
  (org-mode . org-indent-mode) ;; Indent text
  ;; The following prevents <> from auto-pairing when electric-pair-mode is on.
  ;; Otherwise, org-tempo is broken when you try to <s TAB...
  ;;(org-mode . (lambda ()
   ;;              (setq-local electric-pair-inhibit-predicate
   ;;                          `(lambda (c)
   ;;                             (if (char-equal c ?<) t (,electric-pair-inhibit-predicate c))))))
  )


(use-package toc-org
  :defer t
  :ensure t
  :commands toc-org-enable
  :hook (org-mode . toc-org-mode))

(use-package org-superstar
  :defer t
  :ensure t
  :after org
  :hook (org-mode . org-superstar-mode))


(provide 'arsyhiy-org)

;;; arsyhiy-org-mode.el ends here
