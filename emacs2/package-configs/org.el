;; -*- lexical-binding: t; -*-

(use-package org
  :config
  (setq org-default-notes-file (concat org-directory "/notes.org"))
  :hook
  (org-mode . org-indent-mode)
  )
