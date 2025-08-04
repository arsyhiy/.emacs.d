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

(use-package almost-mono-themes
	:ensure t
	:defer t
  :config
  ;; (load-theme 'almost-mono-black t)
  ;; (load-theme 'almost-mono-gray t)
  ;; (load-theme 'almost-mono-cream t)
	;;(load-theme 'almost-mono-white t)
  )

(load-theme 'almost-mono-gray t)
(provide 'arsyhiy-themes)
