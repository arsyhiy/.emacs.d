;;; arsyhiy-editing.el  ---  -*- coding: utf-8; lexical-binding: t -*-

;; Copyright (C) 2025
;; Version: 1.0
;; packages-Requires: ((emacs "30"))
;; Keywords: no keywords

;; Commentary:

;; no comment

;; Code 
;;; NOTE: rewrie flycheck config in more right way

;; packages

(use-package flycheck
 :ensure t
 :defer t
 :init (global-flycheck-mode)
(add-hook 'after-init-hook #'global-flycheck-mode)
:hook (go-mode . flycheck-mode))




(provide 'arsyhiy-flycheck)

;;; arsyhiy-flycheck.el ends here
