(mapcar 
    (lambda (package)
        (add-to-list 'required_packages package))
    '(  ag
        async
        auto-complete
        avy
        cmake-ide
        company-irony
        company-jedi
        company-quickhelp
        dash
        epl
        evil
        evil-easymotion
        ;evil-ediff
	evil-escape
        evil-magit
	evil-org
        evil-tutor
        evil-smartparens
        exec-path-from-shell	
        flx
        flx-ido
        flycheck
        flycheck-irony
        fsharp-mode
        git-commit
        goto-chg
        helm
	helm-ag
        helm-core
        helm-flycheck
        helm-ls-git
        helm-projectile
        import-popwin
        irony
        let-alist
        levenshtein
        llvm-mode
        magit
        magit-popup
        markdown-mode
        markdown-preview-mode
        markdown-toc
	monokai-theme
        neotree
        pkg-info
        popup
        popwin
        pos-tip
        powerline
        pretty-mode
        projectile
	puml-mode
        py-import-check
        rich-minority
        rtags
        s
        seq
        smart-mode-line
        smart-mode-line-powerline-theme
        smartparens
        solarized-theme
        symon
        undo-tree
        use-package
        with-editor
        yasnippet))
