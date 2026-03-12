;; lisp-performance.el  ---  -*- coding: utf-8; lexical-binding: t -*-

;; Copyright (C) 2025
;; Version: 1.0
;; packages-Requires: ((emacs "30"))
;; Keywords: no keywords

;; Commentary:

;; no comment

;; Code:

;; https://emacs-lsp.github.io/lsp-mode/page/performance/
(setq gc-cons-threshold 100000000
  read-process-output-max (* 1024 1024))

;; https://www.masteringemacs.org/article/speed-up-emacs-libjansson-native-elisp-compilation
(if (and (fboundp 'native-comp-available-p)
  (native-comp-available-p))
(setq comp-deferred-compilation t
  package-native-compile t)
(message "Native complation is *not* available, lsp performance will suffer..."))
  
(unless (functionp 'json-serialize)
  (message "Native JSON is *not* available, lsp performance will suffer..."))

;; do not steal focus while doing async compilations
(setq warning-suppress-types '((comp)))


(use-package gcmh
  :straight t
  :demand t
  :config
  (setq gcmh-high-cons-threshold (* 100 1024 1024))
  (gcmh-mode 1))

;; для совсем экстремальной отзывчивости (добавь в early-init.el в самый верх)
;; (setq gc-cons-threshold most-positive-fixnum
;;       gc-cons-percentage 0.6)
;; (add-hook 'emacs-startup-hook
;;           (lambda ()
;;             (setq gc-cons-threshold 100000000
;;                   gc-cons-percentage 0.1)))

(provide 'lisp-performance)
;; lisp-performance.el ends here
