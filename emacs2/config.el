(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   '("5291b60ee27dfc12078f787929498ce82efe5e4d42decdbb994be80cdb2def1f"
     "3538194fff1b928df280dc08f041518a8d51ac3ff704c5e46d1517f5c4d8a0e0"
     "c341518f5a80752f3113699a7f845dfc7299667311858e7cdfe64677d359d87e"
     "e4a441d3cea911e8ef36de2eaed043cbe2079484c44c3f2bbab67a46f863a9f6"
     "ca2ce81d33e0b4bd0fdf20caefdde9cb617fec42eeeaf5cd79c80d630bd5cf6a"
     "7478bc74ae421ad2103d4239176f71e6d55ef0be4eb874c328b862af5b93a857"
     "95b0bc7b8687101335ebbf770828b641f2befdcf6d3c192243a251ce72ab1692"
     default))
 '(initial-frame-alist '((vertical-scroll-bars) (width . 80) (height . 40)))
 '(org-capture-templates
   '(("t" "Todo" entry (file+headline "~/org/todo.org" "Inbox")
      "** TODO %? %T")
     ("n" "Notes" entry (file+headline "~/org/notes.org" "Inbox")
      "** NEW %? %t")))
 '(org-todo-keywords '((sequence "TODO" "DONE" "NEW")))
 '(package-selected-packages
   '(consult-eglot consult-flycheck corfu-terminal dash editorconfig
		   eldoc-box exec-path-from-shell flycheck-eglot gcmh
		   graphql-mode json-mode kaolin-themes kind-icon
		   lua-mode magit markdown-mode material-theme
		   molokai-theme monokai-theme moody orderless org
		   projectile rainbow-delimiters smartparens
		   standard-themes sublime-themes use-package vertico)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:inherit nil :extend nil :stipple nil :background "#212026" :foreground "#e6e6e8" :inverse-video nil :box nil :strike-through nil :overline nil :underline nil :slant normal :weight regular :height 114 :width normal :foundry "outline" :family "Anonymice Powerline")))))
