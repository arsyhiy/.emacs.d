;;; arsyhiy-lsp.el  ---  -*- coding: utf-8; lexical-binding: t -*-

;; Copyright (C) 2025
;; Version: 1.0
;; packages-Requires: ((emacs "30"))
;; Keywords: no keywords

;; Commentary:

;; no comment

;; Code 

(use-package lsp-mode
  :straight t
  
  :hook
  ('c-mode-hook 'lsp)
  ('c++-mode-hook 'lsp)
  ('golang-mode-hook 'lsp)
  ('python-mode-hook 'lsp)
  ('js-mode-hook 'lsp)
  ('lsp-mode-hook #'lsp-enable-which-key-integration)
  )

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

(provide 'arsyhiy-lsp)
;;; arsyhiy-lsp.el ends here
