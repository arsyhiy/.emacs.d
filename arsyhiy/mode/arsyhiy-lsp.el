;;; arsyhiy-lsp.el  ---  -*- coding: utf-8; lexical-binding: t -*-

;; Copyright (C) 2025
;; Version: 1.0
;; packages-Requires: ((emacs "30"))
;; Keywords: no keywords

;; Commentary:

;; no comment

;; Code 
;;; NOTE: rewrie lsp config in more right way

;; packages

(require 'package)
  (add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/") t)
  (package-initialize)

  (setq package-selected-packages '(lsp-mode yasnippet lsp-treemacs helm-lsp
    projectile hydra flycheck company avy which-key helm-xref dap-mode))

  (when (cl-find-if-not #'package-installed-p package-selected-packages)
    (package-refresh-contents)
    (mapc #'package-install package-selected-packages))

  ;; sample `helm' configuration use https://github.com/emacs-helm/helm/ for details
  (helm-mode)
  (require 'helm-xref)
  (define-key global-map [remap find-file] #'helm-find-files)
  (define-key global-map [remap execute-extended-command] #'helm-M-x)
  (define-key global-map [remap switch-to-buffer] #'helm-mini)

  (which-key-mode)
  (add-hook 'c-mode-hook 'lsp)
  (add-hook 'c++-mode-hook 'lsp)
  (add-hook 'golang-mode-hook 'lsp)
  (add-hook 'python-mode-hook 'lsp)
  (add-hook 'js-mode-hook 'lsp)

  (setq gc-cons-threshold (* 100 1024 1024)
        Read-process-output-max (* 1024 1024)
        treemacs-space-between-root-nodes nil
        company-idle-delay 0.0
        company-minimum-prefix-length 1
        lsp-idle-delay 0.1)  ;; clangd is fast

  (with-eval-after-load 'lsp-mode
    (add-hook 'lsp-mode-hook #'lsp-enable-which-key-integration)
    (require 'dap-cpptools)
    (yas-global-mode))

(set-language-environment "UTF-8")


(use-package lsp-ui
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
