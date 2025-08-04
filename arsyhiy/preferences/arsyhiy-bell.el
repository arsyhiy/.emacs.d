;;; arsyhiy-bell.el  ---  -*- coding: utf-8; lexical-binding: t -*-

;; Copyright (C) 2025
;; Version: 1.0
;; packages-Requires: ((emacs "30"))
;; Keywords: no keywords

;; Commentary:

;; no comment

;; Code 
;;; NOTE: rewrie bell config in more right way

(setq-default visible-bell nil             ; No visual bell
              ring-bell-function 'ignore)  ; No bell

(provide 'arsyhiy-bell)

;;; arsyhiy-bell.el ends here
