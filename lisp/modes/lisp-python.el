;; lisp-python.el  ---  -*- coding: utf-8; lexical-binding: t -*-

;; Copyright (C) 2025
;; Version: 1.0
;; packages-Requires: ((emacs "30"))
;; Keywords: no keywords

;; Commentary:

;; no comment

;; Code 

;; packages

(use-package python
  :ensure nil
  :mode ("\\.py\\'" . python-ts-mode)
  :hook (python-ts-mode . eglot-ensure)
  :config
  ;; Remap старого python-mode
  (add-to-list 'major-mode-remap-alist
               '(python-mode . python-ts-mode)))


(use-package pyvenv
  :defer t 
  :straight t
  :defer t
  :ensure t
  :config
  ;; Автоактивация виртуального окружения, если есть .venv в проекте
  (pyvenv-mode 1))

(provide 'lisp-python)
;; lisp-python.el ends here
