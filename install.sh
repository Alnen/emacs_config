#!/bin/sh
rm ~/.emacs.d/init.el
rm ~/.emacs.d/common_packages.el
rm ~/.emacs.d/Snippets
ln -s ${PWD}/init.el            ~/.emacs.d/init.el            
ln -s ${PWD}/common_packages.el ~/.emacs.d/common_packages.el 
ln -s ${PWD}/Snippets           ~/.emacs.d/Snippets
