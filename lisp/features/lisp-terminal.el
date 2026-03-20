(use-package vterm
  :straight t
  :ensure t
  :commands (vterm)
  :config
  ;; Опционально: увеличить размер буфера
  (setq vterm-max-scrollback 10000)

  ;; Опционально: использовать shell по умолчанию
  (setq vterm-shell (or (getenv "SHELL") "/bin/bash")))

(provide 'lisp-terminal)

