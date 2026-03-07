;;; lisp-javascript.el  ---  -*- coding: utf-8; lexical-binding: t -*-

;; copyright (c) 2025
;; version: 1.0
;; packages-requires: ((emacs "30"))
;; keywords: no keywords

;; commentary:

;; no comment

;; code 

;; packages

(use-package typescript-ts-mode
  :straight t
  :ensure nil
  :hook (typescript-ts-mode . eglot-ensure))

(use-package typescript-mode
  :straight t
  :mode ("\\.ts\\'" . typescript-mode)
  :init
  (add-to-list 'auto-mode-alist '("\\.ts\\'" . typescript-mode))
  :config
  (setq typescript-indent-level 2))

(use-package web-mode
  :straight t
  :ensure t
  :mode "\\.tsx\\'"
  :config
  (setq web-mode-enable-auto-closing t)
  (setq web-mode-enable-auto-quoting t)
  (setq web-mode-enable-auto-opening t)
  (setq web-mode-markup-indent-offset 2)
  (setq web-mode-code-indent-offset 2)
  (setq web-mode-css-indent-offset 2))

(provide 'lisp-javascript)
;;; lisp-javascript.el ends here
