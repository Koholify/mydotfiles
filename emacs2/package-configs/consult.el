;; -*- lexical-binding: t; -*-

(use-package consult
  :after flycheck
  :bind (
	 ([remap swith-to-buffer] . consult-buffer)
	 ("C-x l" . consult-line)
	 :map flycheck-command-map
	 ("l" . consult-flycheck)
	 )
  )
