;;; arsyhiy-cc.el --- mode for c/c++ -*- coding: utf-8; lexical-binding: t -*-

;; NOTE: rewrite this entire file

(use-package cc-mode
  :ensure nil
  :config
  ;;; Open a header file in C++ mode by default
  (add-to-list 'auto-mode-alist '("\\.h\\'" . c++-mode)))

(provide 'arsyhiy-cc)
;;; arsyhiy-cc.el ends here
