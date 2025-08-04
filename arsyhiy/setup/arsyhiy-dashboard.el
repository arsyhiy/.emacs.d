;;; arsyhiy-dashboard.el  ---  -*- coding: utf-8; lexical-binding: t -*-

;; Copyright (C) 2025
;; Version: 1.0
;; packages-Requires: ((emacs "30"))
;; Keywords: no keywords

;; Commentary:

;; no comment

;; Code 
;;; NOTE: rewrie dashboard config in more right way

;; packages

(use-package dashboard
  :straight
	:ensure t
	:defer t 
  :demand t
  :init
  (add-hook 'dashboard-mode-hook (lambda () (setq show-trailing-whitespace nil)))
  :custom
  (dashboard-center-content t)
  (dashboard-set-heading-icons t)
  (dashboard-set-file-icons t)
  (dashboard-set-navigator t)
  (dashboard-item-names '(("Recent Files:"               . "Recent files:")
                          ("Agenda for today:"           . "Today's agenda:")
                          ("Agenda for the coming week:" . "Agenda:")))
  (dashboard-item-shortcuts '((recents   . "r")
                              (bookmarks . "m")
   				  (projects  . "p")
   				  (agenda    . "a")
    			  (registers . "e")))

  (dashboard-startupify-list '(dashboard-insert-banner
                               dashboard-insert-newline
                               ;;dashboard-insert-banner-title
                               ;;dashboard-insert-newline
                               dashboard-insert-navigator
                               dashboard-insert-newline
                               dashboard-insert-init-info
                               dashboard-insert-items
                               ;;dashboard-insert-newline
                               ;;dashboard-insert-footer
    ))

  (dashboard-display-icons-p t)     ;; display icons on both GUI and terminal
  (dashboard-icon-type 'nerd-icons) ;; use `nerd-icons' package
  (dashboard-icon-file-height 1.75)
  (dashboard-icon-file-v-adjust -0.125)
  (dashboard-heading-icon-height 1.75)
  (dashboard-heading-icon-v-adjust -0.125)

  :config
  (dashboard-setup-startup-hook))

(require 'dashboard)
(provide 'arsyhiy-dashboard)

