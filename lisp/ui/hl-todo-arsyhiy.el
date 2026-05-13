;;; init.el --- starting point for emacs configuration -*- lexical-binding: t; -*-
;; Author: arsyhiy
;; Package-Requires: ((emacs "30.1"))


;;; Commentary:
;;; Code:

(use-package hl-todo
  :straight t
  :config
  (global-hl-todo-mode 1))


(provide 'hl-todo-arsyhiy)


;;; options.el ends here
