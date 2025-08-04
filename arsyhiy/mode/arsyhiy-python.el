;;; arsyhiy-python.el  ---  -*- coding: utf-8; lexical-binding: t -*-

;; Copyright (C) 2025
;; Version: 1.0
;; packages-Requires: ((emacs "30"))
;; Keywords: no keywords

;; Commentary:

;; no comment

;; Code 
;;; NOTE: rewrie python config in more right way

;; packages

(use-package elpy
	:defer t
  :ensure t
  :init
  (elpy-enable))

(use-package pyvenv
	:defer t
	:ensure t
)
(provide 'arsyhiy-python)

;;; arsyhiy-python.el ends here
