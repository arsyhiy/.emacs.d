;;; lisp-lsp.el  ---  -*- coding: utf-8; lexical-binding: t -*-

;; Copyright (C) 2025
;; Version: 1.0
;; packages-Requires: ((emacs "30"))
;; Keywords: no keywords

;;; Commentary:


;; no comment

;;; Code:

;; --- Eglot базовая настройка ---
(use-package eglot
  ;;:ensure nil ;; встроен в Emacs 29+
  :hook ((python-mode . eglot-ensure)
         (typescript-mode . eglot-ensure)
         (js-mode . eglot-ensure)
         (c-ts-mode . eglot-ensure)
         (c++-ts-mode . eglot-ensure)
         (go-mode . eglot-ensure)
         (rust-mode . eglot-ensure))
  :config
  ;; меньше лишнего логирования
  (setq eglot-events-buffer-size 0)

  ;; автозакрытие серверов при закрытии буфера
  (setq eglot-autoshutdown t)

  ;; форматирование перед сохранением
  (add-hook 'before-save-hook
            (lambda ()
              (when (eglot-managed-p)
                (eglot-format-buffer)))))


(use-package sideline
  :straight t
  :ensure t
  :hook (flymake-mode . sideline-mode))

(use-package sideline-flymake
  :straight t
  :after (sideline flymake)
  :config
  (setq sideline-backends-right '(sideline-flymake)))

(provide 'lisp-lsp)
;;; lisp-lsp.el ends here
