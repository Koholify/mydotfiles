;; -*- lexical-binding: t; -*-

;; Persist history over Emacs restarts. Vertico sorts by history position.
(use-package savehist
  :init
  (savehist-mode))

(use-package smartparens
  :init
  (smartparens-mode))

(use-package editorconfig
  :init
  (editorconfig-mode))

(use-package eldoc-box
  :bind ("C-c k" . eldoc-box-help-at-point)
  :hook
  (eldoc-mode-hook . eldoc-box-hover-at-point-mode))


(add-hook 'csharp-mode-hook (lambda() (auto-save-mode -1)))
