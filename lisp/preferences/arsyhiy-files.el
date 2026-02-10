;;; arsyhiy-files.el  ---  -*- coding: utf-8; lexical-binding: t -*-

;; Copyright (C) 2025
;; Version: 1.0
;; packages-Requires: ((emacs "30"))
;; Keywords: no keywords

;; Commentary:

;; no comment

;; Code 
;;; NOTE: rewrie files config in more right way

(defun arsyhiy-file ()
  (setq make-backup-files nil) ;; Stop creating ~ backup files
  (setq auto-save-default nil) ;; Stop creating # auto save files
  )
 
(arsyhiy-file)

(provide 'arsyhiy-files)
