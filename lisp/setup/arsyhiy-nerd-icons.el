;;; arsyhiy-nerd-icons.el  ---  -*- coding: utf-8; lexical-binding: t -*-

;; Copyright (C) 2025
;; Version: 1.0
;; packages-Requires: ((emacs "30"))
;; Keywords: no keywords

;; Commentary:

;; no comment

;; Code 
;;; NOTE: rewrie nerd-icons config in more right way

;; packages

(use-package nerd-icons
    :straight t
	:ensure t
	:defer t
  :if (display-graphic-p))


(use-package nerd-icons-dired
    :straight t
	:ensure t
	:defer t
  :hook (dired-mode . (lambda () (nerd-icons-dired-mode t))))

(use-package nerd-icons-ibuffer
    :straight t
	:ensure t 
	:defer t
  :hook (ibuffer-mode . nerd-icons-ibuffer-mode))

(provide 'arsyhiy-nerd-icons)
