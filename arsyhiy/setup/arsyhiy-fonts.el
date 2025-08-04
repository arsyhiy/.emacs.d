;;; arsyhiy-fonts.el  ---  -*- coding: utf-8; lexical-binding: t -*-

;; Copyright (C) 2025
;; Version: 1.0
;; packages-Requires: ((emacs "30"))
;; Keywords: no keywords

;; Commentary:

;; no comment

;; Code 
;;; NOTE: rewrie fonts config in more right way

(set-face-attribute 'default nil
  :font "JetBrainsMonoNL NF-12.0" ;; Set your favorite type of font or download JetBrains Mono
  :height 180
  :weight 'medium)
  ;; This sets the default font on all graphical frames created after restarting Emacs.
  ;; Does the same thing as 'set-face-attribute default' above, but emacsclient fonts
  ;; are not right unless I also add this method of setting the default font.

  (add-to-list 'default-frame-alist '(font . "JetBrainsMonoNL NF-14.0")) ;; Set your favorite font
  (setq-default line-spacing 0.12)


(provide 'arsyhiy-fonts)
