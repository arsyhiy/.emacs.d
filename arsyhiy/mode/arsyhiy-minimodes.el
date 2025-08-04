;;; arsyhiy-minimodes.el  ---  -*- coding: utf-8; lexical-binding: t -*-

;; Copyright (C) 2025
;; Version: 1.0
;; packages-Requires: ((emacs "30"))
;; Keywords: no keywords

;; Commentary:

;; no comment

;; Code 
;;; NOTE: rewrie minimodes config in more right way

(defun arsyhiy-minimodes()
  ;;(pixel-scroll-precision-mode 1))
  (delete-selection-mode t)   ;; Select text and delete it by typing.
  (electric-indent-mode nil)  ;; Turn off the weird indenting that Emacs does by default.
  (electric-pair-mode t)      ;; Turns on automatic parens pairing
  (setq select-enable-clipboard t) ; Merge system's and Emacs' clipboard
  (global-auto-revert-mode t) ;; Automatically reload file and show changes if the file has changed
  (setq-default indent-tabs-mode nil)
)

(arsyhiy-minimodes)

(provide 'arsyhiy-minimodes)
;;; arsyhiy-minimodes.el ends here
