(setq inhibit-startup-message t)
(setq make-backup-files nil)

(setq ring-bell-function 'ignore)

(menu-bar-mode -1)
(tool-bar-mode -1)
(scroll-bar-mode -1)

(set-frame-font "Hack Nerd Font 12" nil t)

(global-display-line-numbers-mode 1)
(hl-line-mode 1)
(which-key-mode 1)
(auto-fill-mode 1)

(require 'package)
(add-to-list 'package-archives
             '("melpa" . "https://melpa.org/packages/") t)

(use-package exec-path-from-shell
  :ensure t
  :config
  (exec-path-from-shell-initialize))

(use-package vterm
  :ensure t)

(use-package rainbow-delimiters
  :ensure t
  :config
  (add-hook 'prog-mode-hook #'rainbow-delimiters-mode))

(use-package catppuccin-theme
  :ensure t
  :config
  (load-theme 'catppuccin t))

(use-package telephone-line
  :ensure t
  :config
  (telephone-line-mode 1))

(use-package page-break-lines
  :ensure t
  :config
  (page-break-lines-mode))

(use-package projectile
  :ensure t
  :bind
  ("C-c p" . projectile-command-map)
  :config
  (projectile-mode +1))

(use-package all-the-icons
  :ensure t)

(use-package nerd-icons
  :ensure t)

(use-package dashboard
  :ensure t
  :config
  (dashboard-setup-startup-hook))

(use-package magit
  :ensure t)

(use-package helm
  :ensure t
  :bind
  (("C-x b" . helm-buffers-list)
   ("C-x C-f" . helm-find-files)))

(use-package helm-projectile
  :ensure t
  :config (helm-projectile-on))

(use-package helm-rg
  :ensure t
  :bind ("C-x f" . helm-rg))
  
(use-package tree-sitter-langs
  :ensure t)

(use-package treesit-auto
  :ensure t
  :config
  (global-treesit-auto-mode))

(use-package flycheck
  :ensure t
  :config
  (global-flycheck-mode))

(use-package company
  :ensure
  :hook ((after-init-hook . global-company-mode)))

(use-package copilot-chat
  :ensure t)


(use-package go-mode
  :ensure t)

(use-package eglot
  :config
  :hook ((go-ts-mode python-ts-mode) . eglot-ensure)
  :bind (("C-x q" . eglot-code-actions)
	 ("C-x r" . eglot-rename)))

(use-package emacs
  :custom
  (tab-always-indent 'complete)
  (text-mode-ispell-word-completion nil)
  (read-extended-command-predicate
   #'command-completion-default-include-p))

(defun other-window-backwards ()
  (interactive)
  (other-window -1))

(defun eglot-format-before-save ()
  (when (bound-and-true-p eglot--managed-mode)
    (eglot-format)))

(add-hook 'before-save-hook #'eglot-format-before-save)

(keymap-global-set "C-x 2" 'split-window-right)
(keymap-global-set "C-x 3" 'split-window-below)
(keymap-global-set "C-x p" 'other-window-backwards)
(keymap-global-set "C-c m" 'copilot-chat)
(keymap-global-set "C-x t" 'vterm)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   '(all-the-icons catppuccin-theme company copilot-chat dashboard
		   exec-path-from-shell flycheck go-mode
		   helm-projectile helm-rg magit nerd-icons
		   page-break-lines rainbow-delimiters telephone-line
		   tree-sitter-langs treesit-auto vterm)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )


