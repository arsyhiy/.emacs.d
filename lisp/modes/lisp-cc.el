;;; lisp-cc.el  ---  -*- coding: utf-8; lexical-binding: t -*-

;; copyright (c) 2025
;; version: 1.0
;; packages-requires: ((emacs "30"))
;; keywords: no keywords

;; commentary:

;; no comment

;; code 

;; packages

(use-package cc-mode
  :straight t
  :ensure nil
  :config
  ;; Open a header file in C++ mode by default
  (add-to-list 'auto-mode-alist '("\\.h\\'" . c++-mode)))

(provide 'lisp-cc)
;;; lisp-cc.el ends here
