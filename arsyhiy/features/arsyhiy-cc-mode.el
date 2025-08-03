;;-*- coding: utf-8; lexical-binding: t -*-

(use-package cc-mode
  :ensure nil
  :config
  ;;; Open a header file in C++ mode by default
  (add-to-list 'auto-mode-alist '("\\.h\\'" . c++-mode)))

(provide 'arsyhiy-cc-mode)


;;; arsyhiy-init.el ends here
