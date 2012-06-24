(setq ispell-dictionary-base-alist nil)

;; english spell checking by default
(ignore-errors
  (ispell-change-dictionary "en" t))

(put 'ispell-local-dictionary 'safe-local-variable 'string-or-null-p)

;; save the personal dictionary without confirmation
(setq ispell-silently-savep t)

(require 'flyspell)

(defun switch-dictionary ()
  "Switch between en and fr dictionaries."
  (interactive)
  (ispell-change-dictionary
   (if (string=
        (or ispell-local-dictionary ispell-dictionary)
        "fr")
       "en" "fr"))
  (when flyspell-mode
    (flyspell-delete-all-overlays)
    (flyspell-buffer)))

;; flyspell comments and strings in programming modes
;; (preventing it from finding mistakes in the code)
(add-hook 'autoconf-mode-hook   'flyspell-prog-mode)
(add-hook 'autotest-mode-hook   'flyspell-prog-mode)
(add-hook 'c++-mode-hook        'flyspell-prog-mode)
(add-hook 'c-mode-hook          'flyspell-prog-mode)
(add-hook 'cperl-mode-hook      'flyspell-prog-mode)
(add-hook 'emacs-lisp-mode-hook 'flyspell-prog-mode)
(add-hook 'makefile-mode-hook   'flyspell-prog-mode)
(add-hook 'nxml-mode-hook       'flyspell-prog-mode)
(add-hook 'python-mode-hook     'flyspell-prog-mode)
(add-hook 'ruby-mode-hook       'flyspell-prog-mode)

(provide 'init-ispell)
