(use-package js-ts-mode
  :ensure nil
  :hook (js-ts-mode . eglot-ensure))

(use-package typescript-ts-mode
  :ensure nil
  :hook (typescript-ts-mode . eglot-ensure))


(provide 'lisp-javascript)
