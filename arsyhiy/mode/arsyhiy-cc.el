;;; arsyhiy-cc.el  ---  -*- coding: utf-8; lexical-binding: t -*-

;; copyright (c) 2025
;; version: 1.0
;; packages-requires: ((emacs "30"))
;; keywords: no keywords

;; commentary:

;; no comment

;; code 
;;; note: rewrie cc config in more right way

;; packages

(use-package cc-mode
  :ensure nil
  :config
  ;;; Open a header file in C++ mode by default
  (add-to-list 'auto-mode-alist '("\\.h\\'" . c++-mode)))

(provide 'arsyhiy-cc)
;;; arsyhiy-cc.el ends here
