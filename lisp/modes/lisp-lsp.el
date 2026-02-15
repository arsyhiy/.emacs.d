;;; lisp-lsp.el  ---  -*- coding: utf-8; lexical-binding: t -*-

;; Copyright (C) 2025
;; Version: 1.0
;; packages-Requires: ((emacs "30"))
;; Keywords: no keywords

;;; Commentary:


;; no comment

;;; Code:

(use-package lsp-mode
  :straight t
  :commands lsp lsp-deferred
  :hook ((c-mode          . lsp-deferred)
         (c++-mode        . lsp-deferred)
         (go-mode         . lsp-deferred)
         (elpy-mode     . lsp-deferred)
         (js-mode         . lsp-deferred)
         (lsp-mode        . lsp-enable-which-key-integration))
  :custom
  (lsp-enable-on-type-formatting nil))

(use-package lsp-ui
  :straight t
  :defer t
  :ensure t
  :commands lsp-ui-mode
  :custom
  (lsp-headerline-breadcrumb-enable nil)
  (lsp-ui-sideline-show-diagnostics t)
  (lsp-ui-sideline-show-hover t)
  (lsp-ui-sideline-show-code-actions t)
  (lsp-ui-sideline-update-mode t))

(provide 'lisp-lsp)
;;; lisp-lsp.el ends here
