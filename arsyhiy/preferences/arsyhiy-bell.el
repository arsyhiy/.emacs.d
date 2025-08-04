;;; arsyhiy-bell.el --- Bell sound preferences configuration -*- coding: utf-8; lexical-binding: t -*-

;;; Commentary:

;; Configuration for bell sound preferences.

;;; Code:

(setq-default visible-bell nil             ; No visual bell
              ring-bell-function 'ignore)  ; No bell

(provide 'arsyhiy-bell)

;;; arsyhiy-bell.el ends here
