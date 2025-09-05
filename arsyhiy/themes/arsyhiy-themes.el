;;; arsyhiy-themes.el  ---  -*- coding: utf-8; lexical-binding: t -*-

;; Copyright (C) 2025
;; Version: 1.0
;; packages-Requires: ((emacs "30"))
;; Keywords: no keywords

;; Commentary:

;; no comment

;; Code 
;;; NOTE: rewrie themes config in more right way

;; packages

(use-package modus-themes
    :straight t
  :ensure t
  :defer t)

(load-theme 'modus-vivendi t)
(provide 'arsyhiy-themes)
