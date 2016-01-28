(require 'package) ;; You might already have this line
(add-to-list 'package-archives
             '("melpa" . "https://melpa.org/packages/"))
(when (< emacs-major-version 24)
  ;; For important compatibility libraries like cl-lib
  (add-to-list 'package-archives '("gnu" . "http://elpa.gnu.org/packages/")))
(package-initialize)

(defun ensure-package-installed (package)
     (if (package-installed-p package)
       nil
       (package-install package)))

(defun ensure-packages-installed (packages)
  (mapcar 'ensure-package-installed packages))

;; make sure to have downloaded archive description.
;; Or use package-archive-contents as suggested by Nicolas Dudebout
(or (file-exists-p package-user-dir)
    (package-refresh-contents))

(setq required_packages (list))
(load "~/.emacs.d/common_packages.el")

(ensure-packages-installed required_packages)

;; activate installed packages
(package-initialize)
(tool-bar-mode -1)
(menu-bar-mode -1)
(scroll-bar-mode -1)
; (require 'neotree) 
(add-to-list 'custom-theme-load-path "~/.emacs.d/elpa/solarized-theme-20151211.535")
(add-to-list 'load-path "~/.emacs.d/elpa/solarized-theme-20151211.535")
;(load-theme 'solarized-dark t)
(load-theme 'monokai t)
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
(when (memq window-system '(mac ns))
    (exec-path-from-shell-initialize))
(set-frame-font "Source Code Pro" nil t)
(set-face-attribute 'default nil :height 100)
(require 'pretty-mode)
; if you want to set it globally
; (global-pretty-mode t)
; if you want to set it only for a specific mode
(setq-default
 company-idle-delay 0.1
 company-minimum-prefix-length 1
 )
(add-hook 'my-pretty-language-hook 'turn-on-pretty-mode)
(add-hook 'after-init-hook #'global-flycheck-mode)
(add-hook 'after-init-hook 'global-company-mode)
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
(setq neo-smart-open t)
;(setq projectile-switch-project-action 'neotree-projectile-action)
;(add-hook 'neotree-mode-hook (lambda ()
;  (define-key evil-normal-state-local-map (kbd "TAB") 'neotree-enter)
;  (define-key evil-normal-state-local-map (kbd "SPC") 'neotree-enter)
;  (define-key evil-normal-state-local-map (kbd "q") 'neotree-hide)
;  (define-key evil-normal-state-local-map (kbd "RET") 'neotree-enter)))
;(setq-default neo-persist-show t)
;    (when neo-persist-show
;      (add-hook 'popwin:before-popup-hook
;                (lambda () (setq neo-persist-show nil)))
;      (add-hook 'popwin:after-popup-hook
;                (lambda () (setq neo-persist-show t))))


(require 'popwin)
(popwin-mode 1)
(defun my/python-mode-hook ()
  (add-to-list 'company-backends 'company-jedi))

(add-hook 'python-mode-hook 'my/python-mode-hook)

(add-hook 'python-mode-hook 'jedi:setup)
(company-quickhelp-mode 1)
(add-hook 'c++-mode-hook 'rtags-enable-standard-keybindings)
(add-hook 'c-mode-hook 'rtags-enable-standard-keybindings)
(add-hook 'c++-mode-hook 'irony-mode) 
(add-hook 'c-mode-hook 'irony-mode)
(add-hook 'objc-mode-hook 'irony-mode)

;; replace the `completion-at-point' and `complete-symbol' bindings in
;; irony-mode's buffers by irony-mode's function
(defun my-irony-mode-hook ()
  (define-key irony-mode-map [remap completion-at-point]
    'irony-completion-at-point-async)
  (define-key irony-mode-map [remap complete-symbol]
    'irony-completion-at-point-async))
(add-hook 'irony-mode-hook 'my-irony-mode-hook)
(add-hook 'irony-mode-hook 'irony-cdb-autosetup-compile-options)

(eval-after-load 'company
  '(add-to-list 'company-backends 'company-irony))
(eval-after-load 'flycheck
  '(add-hook 'flycheck-mode-hook #'flycheck-irony-setup))

;(global-set-key [f8] 'neotree-toggle)
(add-to-list 'auto-mode-alist '("\\.h\\'" . c++-mode))

(defun my-c-mode-common-hook ()
 ;; my customizations for all of c-mode, c++-mode, objc-mode, java-mode
 (c-set-offset 'substatement-open 0)
 ;; other customizations can go here

 (setq c++-tab-always-indent t)
 (setq c-basic-offset 4)                  ;; Default is 2
 (setq c-indent-level 4)                  ;; Default is 2

 (setq tab-stop-list '(4 8 12 16 20 24 28 32 36 40 44 48 52 56 60))
 (setq tab-width 4)
 (setq indent-tabs-mode t)  ; use spaces only if nil
 )

(add-hook 'c-mode-common-hook 'my-c-mode-common-hook)
(add-hook 'c++-mode-common-hook 'my-c-mode-common-hook)


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
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   (quote
    (cmake-ide evil-easymotion evil-magit evil-tutor flx-ido fsharp-mode goto-chg helm-flycheck helm-ls-git helm-projectile levenshtein llvm-mode magit magit-popup markdown-toc popup pos-tip pretty-mode projectile rtags s smart-mode-line-powerline-theme solarized-theme undo-tree with-editor))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
