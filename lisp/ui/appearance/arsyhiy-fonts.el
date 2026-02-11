;;; arsyhiy-fonts.el  ---  -*- codifcng: utf-8; lexical-binding: t -*-

;; Copyright (C) 2025
;; Version: 1.0
;; packages-Requires: ((emacs "30"))
;; Keywords: no keywords

;; Commentary:

;; no comment:

;; Code 
;;; NOTE: rewrie fonts config in more right way

;(set-face-attribute 'default nil
;  :font "JetBrainsMonoNL NF-18.0" ;; Set your favorite type of font or download JetBrains Mono
;  :height 120
;  :weight 'medium)
  ;; This sets the default font on all graphical frames created after restarting Emacs.
  ;; Does the same thing as 'set-face-attribute default' above, but emacsclient fonts
  ;; are not right unless I also add this method of setting the default font.

;  (add-to-list 'default-frame-alist '(font . "JetBrainsMonoNL NF-18.0")) ;; Set your favorite font
;  (setq-default line-spacing 0.12)

(defvar my/monitor-font-alist
  '((("Laptop") . "JetBrainsMonoNL NF-18")   ;; маленький экран
    (("Desktop") . "JetBrainsMonoNL NF-12"))) ;; большой монитор
;; Здесь "Laptop"/"Desktop" — идентификатор экрана (можно через mm-size, pixel-size и т.д.)

(defun my/update-font-based-on-monitor ()
  "Применяет шрифт в зависимости от текущего монитора."
  (interactive)
  (let* ((attrs (frame-monitor-attributes))
         (width-mm (car (cdr (assoc 'mm-size attrs))))
         (chosen-font
          (cond
           ((<= width-mm 350) "JetBrainsMonoNL NF-18") ;; маленький экран
           (t "JetBrainsMonoNL NF-12"))))
    (set-face-attribute 'default nil :font chosen-font)
    (set-frame-font chosen-font nil t)
    (message "Font updated to %s for monitor width %dmm" chosen-font width-mm)))

(provide 'arsyhiy-fonts)
