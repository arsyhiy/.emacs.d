;; lisp-cc.el  ---  -*- coding: utf-8; lexical-binding: t -*-

;; copyright (c) 2025
;; version: 1.0
;; packages-requires: ((emacs "30"))
;; keywords: no keywords

;; commentary:

;; no comment

;; code 

;; packages

(use-package c-ts-mode
  :ensure nil
  :hook (c-ts-mode . eglot-ensure))

(use-package c++-ts-mode
  :ensure nil
  :hook (c++-ts-mode . eglot-ensure))

(setq major-mode-remap-alist
      '((c-mode . c-ts-mode)
        (c++-mode . c++-ts-mode)))

(provide 'lisp-cc)
;; lisp-cc.el ends here
