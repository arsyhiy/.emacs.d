;;; lisp-flycheck.el --- Flycheck configuration -*- lexical-binding: t; -*-

;; Copyright (C) 2025
;; Version: 1.0
;; packages-Requires: ((emacs "30"))
;; Keywords: no keywords

;; Commentary:

;; no comment

;; Code 

;; packages


(use-package flycheck
  :straight t
  :custom
  (flycheck-check-syntax-automatically '(save mode-enabled))

  :hook
  (after-init . global-flycheck-mode)

  :config
  ;; Панель ошибок всегда снизу
  (add-to-list 'display-buffer-alist
               '("\\*Flycheck errors\\*"
                 (display-buffer-reuse-window display-buffer-in-side-window)
                 (side            . bottom)
                 (reusable-frames . visible)
                 (window-height   . 0.33)))

  ;; Функция toggle с фокусом при открытии
  (defun my/flycheck-toggle-errors ()
    "Открывает или закрывает список ошибок Flycheck (toggle). При открытии фокус переходит в панель."
    (interactive)
    (let ((err-window (get-buffer-window "*Flycheck errors*")))
      (if err-window
          (quit-window nil err-window)
        (flycheck-list-errors)
        (when-let ((new-err-window (get-buffer-window "*Flycheck errors*")))
          (select-window new-err-window t)))))

  ;; Автоматически закрывать панель после прыжка к ошибке (RET)
  (defun my/flycheck-goto-error-and-close ()
    "Перейти к ошибке и закрыть окно со списком ошибок."
    (interactive)
    (call-interactively #'flycheck-error-list-goto-error)  ; стандартная команда RET
    (let ((err-window (get-buffer-window "*Flycheck errors*")))
      (when err-window
        (quit-window nil err-window))))

  ;; Переопределяем RET в буфере ошибок
  (with-eval-after-load 'flycheck
    (define-key flycheck-error-list-mode-map (kbd "RET") #'my/flycheck-goto-error-and-close))

  :bind
  (("C-c e" . my/flycheck-toggle-errors)
   ;; или другие варианты клавиш
   ))

(provide 'lisp-flycheck)
;;; lisp-flycheck.el ends here
