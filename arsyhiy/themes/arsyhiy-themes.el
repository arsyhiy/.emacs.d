;;; arsyhiy-themes.el  ---  -*- coding: utf-8; lexical-binding: t -*-

;; Copyright (C) 2025
;; Version: 1.0
;; packages-Requires: ((emacs "30"))
;; Keywords: no keywords

;; Commentary:

;; no comment

;; Code
;;
;
;;
;;; NOTE: rewrie themes config in more right way

;; packages

(use-package ef-themes 
    :straight t
  :ensure t
  :defer t)

(load-theme 'ef-maris-light t)

;(add-to-list 'custom-theme-load-path "~/.emacs.d/themes/")
;(load-theme 'colormate t)


(provide 'arsyhiy-themes)
