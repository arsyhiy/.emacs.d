(use-package web-mode
  :straight t
  :mode ("\\.html\\'" "\\.htm\\'" "\\.djhtml\\'")
  :hook (web-mode . eglot-ensure)
  :config
  ;; отступы
  (setq web-mode-markup-indent-offset 2)
  (setq web-mode-css-indent-offset 2)
  (setq web-mode-code-indent-offset 2)

  ;; авто-фичи
  (setq web-mode-enable-auto-quoting t)
  (setq web-mode-enable-auto-closing t)
  (setq web-mode-enable-current-element-highlight t)

  ;; Django шаблоны
  (setq web-mode-engines-alist
        '(("django" . "\\.html\\'"))))

(provide 'lisp-web)
