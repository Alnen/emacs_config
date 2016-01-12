(require 'package) ;; You might already have this line
(add-to-list 'package-archives
             '("melpa" . "https://melpa.org/packages/"))
(when (< emacs-major-version 24)
  ;; For important compatibility libraries like cl-lib
  (add-to-list 'package-archives '("gnu" . "http://elpa.gnu.org/packages/")))
(package-initialize) ;; You might already have this line
(tool-bar-mode -1) 
(add-to-list 'custom-theme-load-path "~/.emacs.d/elpa/solarized-theme-20151211.535")
(add-to-list 'load-path "~/.emacs.d/elpa/solarized-theme-20151211.535")
(load-theme 'solarized-dark t)
(require 'evil)
(evil-mode 1)
(global-linum-mode t)
(projectile-global-mode)
(require 'flx-ido)
(ido-mode 1)
(ido-everywhere 1)
(flx-ido-mode 1)
;; disable ido faces to see flx highlights.
(setq ido-enable-flex-matching t)
(setq ido-use-faces nil)
(display-time-mode)
(require 'smart-mode-line)
(setq sml/no-confirm-load-theme t)
(setq powerline-arrow-shape 'curve)
(setq powerline-default-separator-dir '(right . left))
(setq sml/theme 'powerline)
(setq sml/mode-width 0)
(setq sml/name-width 20)
(rich-minority-mode 1)
(setf rm-blacklist "")
(sml/setup)
(set-frame-font "Source Code Pro" nil t)
(set-face-attribute 'default nil :height 100)
(require 'pretty-mode)
; if you want to set it globally
(global-pretty-mode t)
; if you want to set it only for a specific mode
(add-hook 'my-pretty-language-hook 'turn-on-pretty-mode)
(add-hook 'after-init-hook #'global-flycheck-mode)
; (add-hook 'after-init-hook 'global-company-mode)
(require 'evil-magit)
(evilem-default-keybindings "SPC")
(require 'fsharp-mode)
(setq evil-motion-state-modes (append evil-emacs-state-modes evil-motion-state-modes))
(setq evil-emacs-state-modes nil)
(autoload 'markdown-mode "markdown-mode"
   "Major mode for editing Markdown files" t)
(add-to-list 'auto-mode-alist '("\\.text\\'" . markdown-mode))
(add-to-list 'auto-mode-alist '("\\.markdown\\'" . markdown-mode))
(add-to-list 'auto-mode-alist '("\\.md\\'" . markdown-mode))
(require 'helm-config)
(require 'helm-flycheck) ;; Not necessary if using ELPA package
 (eval-after-load 'flycheck
   '(define-key flycheck-mode-map (kbd "C-c ! h") 'helm-flycheck))
(require 'helm-ls-git)
(global-set-key (kbd "C-<f6>") 'helm-ls-git-ls)
(global-set-key (kbd "C-x C-d") 'helm-browse-project)
(require 'rtags) ;; optional, must have rtags installed
(cmake-ide-setup)




; platform specific
(setq cmake-ide-clang-flags-c '(
 "/usr/include/c++/5"
 "/usr/include/x86_64-linux-gnu/c++/5"
 "/usr/include/c++/5/backward"
 "/usr/lib/gcc/x86_64-linux-gnu/5/include"
 "/usr/local/include"
 "/usr/lib/gcc/x86_64-linux-gnu/5/include-fixed"
 "/usr/include/x86_64-linux-gnu"
 "/usr/include"
 ))
(setq cmake-ide-clang-flags-c++ '(
 "/usr/include/c++/5"
 "/usr/include/x86_64-linux-gnu/c++/5"
 "/usr/include/c++/5/backward"
 "/usr/lib/gcc/x86_64-linux-gnu/5/include"
 "/usr/local/include"
 "/usr/lib/gcc/x86_64-linux-gnu/5/include-fixed"
 "/usr/include/x86_64-linux-gnu"
 "/usr/include"
 ))
