(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(backup-directory-alist '(("." . "~/.emacs.d/backups")))
 '(custom-safe-themes
   '("7478bc74ae421ad2103d4239176f71e6d55ef0be4eb874c328b862af5b93a857"
     "95b0bc7b8687101335ebbf770828b641f2befdcf6d3c192243a251ce72ab1692"
     default))
 '(exec-path-from-shell-variables '("PATH"))
 '(initial-buffer-choice "~/.emacs.d/init.el")
 '(org-capture-templates
   '(("t" "Todo" entry (file+headline "~/org/todo.org" "Inbox")
      "** TODO %? %T")
     ("n" "Notes" entry (file+headline "~/org/notes.org" "Inbox")
      "** NEW %? %t")))
 '(org-todo-keywords '((sequence "TODO" "DONE" "NEW")))
 '(package-selected-packages
   '(consult consult-eglot consult-flycheck corfu corfu-terminal dash
	     editorconfig eglot eldoc eldoc-box exec-path-from-shell
	     flycheck flycheck-eglot gcmh graphql-mode json-mode
	     jsonrpc kind-icon lua-mode magit markdown-mode
	     molokai-theme monokai-theme orderless org projectile
	     smartparens standard-themes use-package vertico)))
;;(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 ;;'(default ((t (:inherit nil :extend nil :stipple nil :background "#000000" :foreground "#ffffff" :inverse-video nil :box nil :strike-through nil :overline nil :underline nil :slant normal :weight regular :height 98 :width normal :foundry "outline" :family "Iosevka")))))

