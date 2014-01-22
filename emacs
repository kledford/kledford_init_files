;; This is the Aquamacs Preferences file.
;; Add Emacs-Lisp code here that should be executed whenever
;; you start Aquamacs Emacs. If errors occur, Aquamacs will stop
;; evaluating this file and print errors in the *Messags* buffer.
;; Use this file in place of ~/.emacs (which is loaded as well.)

;; Taken from http://sigquit.wordpress.com/2008/09/28/single-dot-emacs-file/
;; Get current system's name
(defun insert-system-name()
(interactive)
"Get current system's name"
(insert (format "%s" system-name))
)

;; Get current system type
(defun insert-system-type()
(interactive)
"Get current system type"
(insert (format "%s" system-type))
)

;; Check if system is Darwin/Mac OS X
(defun system-type-is-darwin ()
(interactive)
"Return true if system is darwin-based (Mac OS X)"
(string-equal system-type "darwin")
)

;; Check if system is GNU/Linux
(defun system-type-is-gnu ()
(interactive)
"Return true if system is GNU/Linux-based"
(string-equal system-type "gnu/linux")
)

(defun system-is-my-mac ()
  (interactive)
  "Return true if the system we are running on is my PC at work"
  (string-equal system-name "Keith-Ledfords-MBP.local")
)

(defun system-is-my-work-desktop ()
  (interactive)
  "Return true if the system we are running on is my PC at work"
  (string-equal system-name "atl-kledford-desktop")
)

;; ;; disable closing emacs in Mac OS X
;; (if (system-type-is-darwin)
;; (global-unset-key "\C-z")
;; )
;; ;; Check if the system is my Kubuntu GNU/Linux at work
;; (defun system-is-my-workpc ()
;; (interactive)
;; "Return true if the system we are running on is my PC at work"
;; (string-equal system-name "dev002.workplace.com")
;; )
;; ;; For my machine in my worplace, setup my work email address
;; (if (system-is-my-workpc)
;; (setq user-mail-address "my.name@workplace.com")
;; )

;; END Taken from http://sigquit.wordpress.com/2008/09/28/single-dot-emacs-file/
;Keith-Ledfords-MBP.local
;darwin
;; (if (string-equal system-name "Keith-Ledfords-MBP.local")
;;     (message "SYSTEM NAME MATCH")
;; )

;; System Specific Settings
(if  (system-type-is-darwin)
    (load "~/.emacs_darwin")
;    (load "/Users/kledford/src/git/github/mysrc/programming_docs/emacs/.emacs_darwin")
)





(if (system-is-my-work-desktop)
    (load "~/.emacs_work-desktop")
;;    (message "SETTING EMAIL ADDRESSES FOR MY WORK DESKTOP")
    ;; (setq user-mail-address "keith.ledford@ericsson.com")
    ;; (setq html-helper-address-string "<a href=\"mailto:keith.ledford@ericsson.com\">Keith Ledford &lt;keith.ledford@ericsson.com&gt;</a>")
    ;; (setq  post-email-address "keith.ledford@ericsson.com")
)

;;(if (system-is-my-mac)
(if (string-equal system-name "Keith-Ledfords-MBP.local")
    (load "~/.emacs_keith-ledfords-mbp-local")
;    (load "/Users/kledford/src/git/github/mysrc/programming_docs/emacs/.emacs-keith-ledfords-mbp.local")
    ;;(load "/Users/kledford/src/git/github/mysrc/programming_docs/emacs/.emacs_keith-ledfords-mbp.local")
  )

;; END  System Specific Settings

(custom-set-variables
 ;; custom-set-variables was added by Custom -- don't edit or cut/paste it!
 ;; Your init file should contain only one such instance.
 '(all-christian-calendar-holidays t t)
 '(c-comment-prefix-regexp (quote ((java-mode . "") (other . ""))))
 '(case-fold-search t)
 '(cperl-close-paren-offset -4)
 '(cperl-continued-statement-offset 4)
 '(cperl-indent-level 4)
 '(cperl-tab-always-indent t)
 '(current-language-environment "English")
 '(font-lock-global-modes t)
 '(font-lock-maximum-size 71680)
 '(font-lock-mode-hook (quote (ignore)))
 '(global-font-lock-mode t nil (font-lock))
 '(hi-lock-mode t nil (hi-lock))
 '(nxml-auto-insert-xml-declaration-flag t)
 '(nxml-bind-meta-tab-to-complete-flag t)
 '(nxml-slash-auto-complete-flag t)
;; '(post-email-address "keith.ledford@ericsson.com")
 '(query-user-mail-address nil)
 '(show-trailing-whitespace t)
 '(transient-mark-mode t)
 '(develock-auto-enable nil)
 '(column-number-mode t)
;; '(user-mail-address "keith.ledford@ericsson.com"))
)
(setq inhibit-splash-screen t) 
;; Make all "yes or no" prompts show "y or n" instead
(fset 'yes-or-no-p 'y-or-n-p)
(custom-set-faces
  ;; custom-set-faces was added by Custom -- don't edit or cut/paste it!
  ;; Your init file should contain only one such instance.
 '(default ((t (:size "14pt" :family "Charter"))))
 '(trailing-whitespace ((((class color) (background dark)) (:foreground "red" :underline unspecified)))))
(add-to-list 'load-path "~/.emacs_modes/")
(require 'color-theme)
(color-theme-dark-laptop)

;;; taken from ~/svn/localhost/repos/kledford/
;;; Display full path name if appropriate on mode line.
(add-hook 'find-file-hooks 
	  '(lambda ()
	     (setq mode-line-buffer-identification 'buffer-file-truename)))


(global-set-key "\C-cc" 'comment-region)
(setq comment-start "# ")
(global-set-key "\C-cu" 'uncomment-region)
(global-set-key "\C-xg" 'goto-line)
(global-set-key [delete] 'delete-char)
(global-set-key [kp-delete] 'delete-char)
(global-set-key "\C-w" 'backward-kill-word)
(global-set-key "\M-w" 'kill-region)

;;;start gnuserv 20070403
(server-start)

(setq frame-title-format
  '("%S: " (buffer-file-name "%f" (dired-directory dired-directory "%b"))))


(require 'backups)
(move-backups t)
(setq backup-directory "~/.emacs_backups")

;; Recent files 
;; http://www.emacswiki.org/cgi-bin/wiki/RecentFiles
(recentf-mode 1)

;; ;; FOR crypt++.el
;; (setq crypt-encryption-type 'gpg
;;       crypt-encryption-file-extension "\\(\\.gpg\\)$"
;;       crypt-bind-insert-file nil
;;       crypt-freeze-vs-fortran nil)
;; (define-key global-map "\C-c\C-e" 'crypt-encrypted-mode)
;; (modify-coding-system-alist 'file "\\.bz\\'" 'no-conversion)
;; (modify-coding-system-alist 'file "\\.bz2\\'" 'no-conversion)
;; (modify-coding-system-alist 'file "\\.gpg\\'" 'no-conversion)
;; (modify-coding-system-alist 'file "\\.gz\\'" 'no-conversion)
;; (modify-coding-system-alist 'file "\\.Z\\'" 'no-conversion)
;; ;; END FOR crypt++.el

;; use Unix-style line endings
(setq-default inhibit-eol-conversion t)
(set-buffer-file-coding-system 'no-conversion)

(progn        ; Font-locking faces set-up
  (setq
   font-lock-maximum-decoration t
   font-lock-maximum-size (if font-lock-maximum-decoration
 			      (* 70 1024)
			    (* 150 1024))))

(setq tramp-default-method "scp")

;; (autoload 'fetchmail-mode "fetchmail-mode.el" "Mode for editing .fetchmailrc files" t)
;; (autoload 'dns-mode "dns-mode.el" "Mode for editing dns files" t)
;; (add-to-list 'auto-mode-alist '("\\.dns?\\'" . dns-mode))
;; (autoload 'netsaint-mode "netsaint-mode.el" "Mode for editing netsaint cfg files" t)
;; (add-hook 'netsaint-mode-hook 'turn-on-font-lock)
;; (autoload 'php-mode "php-mode.el" "mode for editing php files" t)
;; (add-to-list 'auto-mode-alist '("\\.php?\\'" . php-mode)) 
;; (autoload 'post-mode "/home/kledford/emacs/post" "Mode for editing mail/news messages" t)
;; (add-to-list 'auto-mode-alist '("\\mutt.*\\'" . post-mode)) 


;; Enable html mode for .tpl files (nsite)
(add-to-list 'auto-mode-alist
             '("\\.tpl$" . html-mode))
(setq html-helper-do-write-file-hooks t)

;; Enable php mode for .str files (nsite)
(add-to-list 'auto-mode-alist
             '("\\.str$" . php-mode))

(add-to-list 'auto-mode-alist
	     '("\\.pl$" . cperl-mode))

(add-to-list 'auto-mode-alist
	     '("\\.cgi$" . cperl-mode))

;; (autoload 'muttrc-mode "muttrc-mode.el"
;;   "Major mode to edit muttrc files" t)
;; (setq auto-mode-alist
;;       (append '(("muttrc\\'" . muttrc-mode))
;; 	      auto-mode-alist))

;;; Convert DOS file format to Unix

;; look at 
;; M-x comint-strip-ctrl-m
;;   Command: Strip trailing `^M' characters from the current output group.


;; from: elf@ee.ryerson.ca (Luis Fernandes)
;; 22 May 1997

;;; Usage: M-x dos2unix
;;;
(defun dos2unix ()
  "Convert this entire buffer from MS-DOS text file format to UNIX."
  (interactive)
  (save-excursion
    (goto-char (point-min))
    (replace-regexp "\r$" "" nil)
    (goto-char (1- (point-max)))
    (if (looking-at "\C-z")
        (delete-char 1))))

;;; dos2unix and unix2dos from Benjamin Rutt's .emacs
;; Convert A Buffer From Dos ^M End Of Lines To Unix End Of Lines
(defun Dos2unix ()
 (Interactive)
 (Goto-Char (Point-Min))
 (While (Search-Forward "\R" Nil T) (Replace-Match "")))

;vice versa
(defun unix2dos ()
  (interactive)
  (goto-char (point-min))
  (while (search-forward "\n" nil t) (replace-match "\r\n")))

; Insert date into buffer
(defun insert-date ()
  "Insert date at point."
  (interactive)
  (insert (format-time-string "%Y%m%d%H%M%S")))

(setq-default
 frame-title-format
 (list 
  '((buffer-file-name 
     " %f" 
     (dired-directory
      dired-directory
      (revert-buffer-function 
       " %b"
       ("%b - Dir:  " default-directory)))))))

(setq-default
 icon-title-format
 (list 
  '((buffer-file-name 
     " %f" 
     (dired-directory
      dired-directory
      (revert-buffer-function 
       " %b"
       ("%b - Dir:  " default-directory)))))))

; don't automatically add new lines when 
;;scrolling down at the bottom of a buffer 
(setq next-line-add-newlines nil)

(setq display-time-day-and-date t
   display-time-24hr-format nil)
   (display-time)
(setq line-number-mode t)

;;; settings based on Perl Best Practices
(setq fill-column 78)
(setq auto-fill-mode t)
(defalias 'perl-mode 'cperl-mode)
;; ;;; END settings based on Perl Best Practices

;; added on 20080319 for perlcritic minor mode

(autoload 'perlcritic        "perlcritic" "" t)
(autoload 'perlcritic-region "perlcritic" "" t)
(autoload 'perlcritic-mode   "perlcritic" "" t)
(eval-after-load "cperl-mode"
  '(add-hook 'cperl-mode-hook 'perlcritic-mode))

;; added on 20030408 from url http://list-archive.xemacs.org/xemacs/199805/msg00364.html

(make-variable-buffer-local 'cperl-mode)
(setq-default cperl-mode nil)           ; is this buffer in perl-mode?
(add-hook 'cperl-mode-hook
  (defun my-cperl-mode-hook ()
    (setq cperl-mode t)
    (define-key cperl-mode-map "\C-c'" 'cperl-toggle-abbrev)
    (define-key cperl-mode-map "\C-c;" 'cperl-toggle-auto-newline)
    (define-key cperl-mode-map "\C-c)" (deftoggle cperl-electric-parens-mark))
    (define-key cperl-mode-map "\C-c(" (deftoggle cperl-electric-parens
       cperl-val
       (macro lambda (sym val) `(setq ,sym (if ,val t 'null))) nil nil
       ((setq my-cperl-electric-parens (cperl-val 'cperl-electric-parens)))))
    (setq my-cperl-electric-parens (cperl-val 'cperl-electric-parens))
    (unless (eq (caar minor-mode-alist) 'my-cperl-electric-parens)
      (mapc #'(lambda (x)
                (setq minor-mode-alist
                      (cons x (delete x minor-mode-alist))))
            (nreverse '((my-cperl-electric-parens   (cperl-mode "("))
                        (abbrev-mode                (cperl-mode "'"))
                        (cperl-auto-newline         (cperl-mode ";"))
                        (cperl-electric-parens-mark (cperl-mode ")"))))))
    (define-key cperl-mode-map "\C-hf" nil)
    (define-key cperl-mode-map "\C-hv" nil)
    (define-key cperl-mode-map "\C-c\C-v" 'send-cperldb-command)
    (define-key cperl-mode-map "\C-c\M-+" 'cperl-beautify-regexp)
    (define-key cperl-mode-map "\C-c "    'cperl-find-bad-style)
    (define-key cperl-mode-map "\C-c="    'cperl-lineup)
    (define-key cperl-mode-map "\C-cd"    'cperldb-break)
    (define-key cperl-mode-map "\C-ch"    'cperl-find-pods-heres)
    (define-key cperl-mode-map "\C-cp"    'send-cperldb-command) ; "print"
    (define-key cperl-mode-map "\C-xpt" 'perltidy-buffer)
    (define-key cperl-mode-map "\C-x`"    'cperldb-next-error)))

;; Build the function menu when I enter Cperl mode
(add-hook 'cperl-mode-hook 'imenu-add-menubar-index)

(add-to-list 'cperl-mode-hook
             (lambda ()
               (substitute-key-definition
                'save-buffer
                'cperl-save-buffer
                cperl-mode-map
                global-map)))
(defvar cperl-auto-tidy t)
(defun cperl-save-buffer (&optional args)
  "Perltidy and save current buffer in visited file if modified."
  (interactive)
  (if (and (buffer-modified-p)
           cperl-auto-tidy)
      (perltidy-buffer))
  (save-buffer))
(defun perl-buffer () (interactive (shell-command-on-region  (point-min) (point-max) "perl" nil nil nil)))

(defun cperl-auto-tidy (&optional arg)
  "Automatically perltidy (or not)"
  (setq cperl-auto-tidy (if arg t nil)))
(defun cperl-toggle-auto-tidy ()
  (interactive)
  (setq cperl-auto-tidy (not cperl-auto-tidy)))
(defun perltidy-buffer ()
  "Runs an entire buffer through perltidy."
  (interactive)
  (let ((orig-point (point)))
    (shell-command-on-region
     (point-min) (point-max)
     "perltidy -st -se -q -syn" nil t shell-command-default-error-buffer)
    (goto-char (if (<= orig-point (point-max))
                   orig-point
                 (point-max)))))

(defvar my-perldoc-history nil)

(defun my-perldoc (arg)
  (interactive
   (progn
     (autoload 'perl-word-at-point-hard "perl")
     (let* ((def (perl-word-at-point-hard))
            (arg (read-string (format "PerlDoc%s: " 
                                      (if def (format " (default %s)" def) ""))
                              my-perldoc-history)))
       (list (if (string= arg "") def arg)))))
  (let ((manual-program "perldoc"))
    (man arg)))

(defvar my-perl-info-nodes
  (sort 
   (append '(("TOC"  . "perltoc")
             ("Top"  . "Top")
             ("Perl" . "perl")
             ("0"    . "perlfaq")
             ("Func" . "Function Index")
             ("Var"  . "Variable Index")
             ("Diag" . "Diagnostic Message Index"))
           (mapcar (function (lambda (x) (cons x (concat "perl" x))))
                   '("delta" "faq" "data" "syn" "op" "re" "run" "func"
                     "var" "sub" "mod" "modlib" "form" "locale" "ref" "dsc"
                     "lol" "toot" "obj" "tie" "bot" "ipc" "debug" "diag" "sec"
                     "trap" "style" "pod" "book" "embed" "apio" "xs" "xstut"
                     "guts" "call"))
           (mapcar (function (lambda (x) 
                               (cons (int-to-string x)
                                     (format "perlfaq%d" x))))
                   '(1 2 3 4 5 6 7 8 9)))
   (function (lambda (x y) (string< (car x) (car y))))))

(defun my-perl-info (str)
  (interactive 
   (list (completing-read "Info perl: " my-perl-info-nodes nil t)))
  (Info-goto-node (concat "(perl)" (cdr (assoc str my-perl-info-nodes)))))

(defun my-perl-info-faq (num)
  (interactive
   (list (if current-prefix-arg (prefix-numeric-value current-prefix-arg)
           (read-number "Info perlfaq[1-9]: " 'int))))
  (my-perl-info (if (= num 0) "faq" (int-to-string num))))

(defmacro deftoggle (sym &optional get set comment before after message)
  "Define a function my-toggle-SYM to toggle SYM on and off.
GET and SET are either nil in which case SYM and (setq SYM) are used,
  functions (eg default-value and set-default) called with SYM and SYM VAL,
  or (macro lambda (SYM) ...) and (macro lambda (SYM VAL) ...) respectively.
COMMENT is additional comment for my-toggle-SYM,
BEFORE and AFTER are lists of additional forms around the toggle code,
MESSAGE is a (macro lambda (SYM VAL) ...) replacing the normal \"SYM is VAL.\""
  (cond ((null get) (setq get sym))
        ((symbolp get) (setq get `(,get (quote ,sym))))
        ((setq get (macroexpand (list get sym)))))
  (let ((val `(if arg (> (prefix-numeric-value arg) 0) (not ,get))))
    (cond ((null set) (setq set `(setq ,sym ,val)))
          ((symbolp set) (setq set `(,set (quote ,sym) ,val)))
          ((setq set (macroexpand (list set sym val)))))
    `(defun ,(intern (concat "my-toggle-" (symbol-name sym))) (&optional arg)
       ,(concat "Toggle " (symbol-name sym) ". Return the new value.
With positive ARG set it, with nonpositive ARG reset it."
                (if comment (concat "\n" comment)))
       (interactive "P")
       ,@before
       ,set
       ,@after
       (when (interactive-p)
         ,(if message (macroexpand (list message sym get))
            `(message "%s is %s" (quote ,sym) ,get)))
       ,get)))

;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; ;; HTML Helper mode
;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; ;(setq load-path (cons "path_to_html-helper-mode_directory" load-path))
(autoload 'html-helper-mode "html-helper-mode" "Yay HTML" t)
(setq auto-mode-alist (cons '("\\.html$" . html-helper-mode) auto-mode-alist))
(setq auto-mode-alist (cons '("\\.htm$" . html-helper-mode) auto-mode-alist))

;; Recognize server-parsed HTML files
(setq auto-mode-alist (cons '("\\.shtml$" . html-helper-mode) auto-mode-alist))

;; Insert new document HTML template
(setq html-helper-build-new-buffer t)

;; ;; Insert address
;; (setq html-helper-address-string 
;;   "<a href=\"mailto:keith.ledford@ericsson.com\">Keith Ledford &lt;keith.ledford@ericsson.com&gt;</a>")

;; Enable time stamp
(setq html-helper-do-write-file-hooks t)

;; Enable hyperlink prompt
(setq tempo-interactive t)

;;Bouncing Brackets
;;http://www.happygiraffe.net/emacstips

;;One of the nice things about vi is that you can use the % key to
;;find matching partner of a parenthesis. This function and keybinding
;;makes emacs do the same, but only when the cursor is on top of a
;;parenthesis, otherwise it just inserts a percent sign as you would
;;expect.

(defun match-paren (arg)
  "Go to the matching parenthesis if on parenthesis otherwise insert %."
  (interactive "p")
  (cond ((looking-at "\\s\(") (forward-list 1) (backward-char 1))
        ((looking-at "\\s\)") (forward-char 1) (backward-list 1))
        (t (self-insert-command (or arg 1)))))
(global-set-key "%" 'match-paren)

(put 'upcase-region 'disabled nil)

;; (defun procmail-mode ()
;;   "Mode for highlighting procmailrc files"
;;   (interactive)
;;   (setq mode-name "Procmail"
;; 	major-mode 'procmail))

;; (setq procmail-font-lock-keywords
;;       (list '("#.*"
;; 	      . font-lock-comment-face)
;; 	    '("^[\t ]*:.*"
;; 	      . font-lock-type-face)
;; 	    '("[A-Za-z_]+=.*"
;; 	      . font-lock-keyword-face)
;; 	    '("^[\t ]*\\*.*"
;; 	      . font-lock-doc-string-face)
;; 	    '("\$[A-Za-z0-9_]+"
;; 	      . font-lock-function-name-face)))

;; Enable dot-mode
(autoload 'dot-mode "dot-mode" nil t) ; vi `.' command emulation
(require 'dot-mode)
(add-hook 'find-file-hooks 'dot-mode-on)

;; PC Function Keys
(global-set-key [f1] 'goto-line) 
(global-set-key [f2] 'comment-region)
(global-set-key [f3] 'uncomment-region)
(global-set-key [f4] 'indent-region)
(global-set-key [f5] 'bury-buffer)
(global-set-key [f8] 'run-perl) 

;; ------------------------------------------------------------
;; own enhancements
;; auto-insert for .pl and .pm and .ptk
(load-library "autoinsert")

(define-auto-insert "\\.pl$" 'perl-auto-insert)
(defun perl-auto-insert ()
  (progn
    (insert "#!/usr/bin/env perl\n")
    (insert "#\n# $Id$\n#\n\n")
    (insert "use warnings;\n")
    (insert "use strict;\n")
    (insert "our $VERSION = '0.1.0';\n")
    (insert "use Carp;\n")
    (insert "use English;\n")
    (insert "use File::Basename;\n")
    (insert "use Getopt::Long;\n")
    (insert "use Pod::Usage;\n")
    (insert "use Data::Dumper;\n$Data::Dumper::Indent   = 1;\n")
    (insert "$Data::Dumper::Sortkeys = 1;\n\n")
    (insert "my %opt = (\n\t\n);\n")
    (insert "my @opt_specs = (\n\t")
    (insert "\t# Default options for help\n")
    (insert "\t'usage',\n")
    (insert "\t'help',\n")
    (insert "\t'man',\n")
    (insert "\t'version',\n")
    (insert "\n);\n")
    (insert "GetOptions(\\%opt, @opt_specs) or pod2usage -exitval => 2, -verbose => 0;\n")
    (insert "pod2usage(-verbose => 0) if $opt{usage};\n")
    (insert "pod2usage(-verbose => 1) if $opt{help};\n")
    (insert "pod2usage(-verbose => 2) if $opt{man};\n")
    (insert "version()                if $opt{version};\n\n")
    (insert "## subs ##\n")
    (insert "sub version {\n")
    (insert "my $program = basename($0);\n")
    (insert "print <<\"EOF\";\n\n")
    (insert "$program $VERSION\n")
    (insert "\n")
    (insert "Copyright (C) 2010, Ericsson Television, Inc.,\n")
    (insert "\n")
    (insert "EOF\n")
    (insert "exit 0;\n")
    (insert "}\n\n")
    (insert "## main ##")
    (insert "\n\n")
    (insert "=head1 NAME\n
=head1 VERSION")
    )
  )

(add-hook 'find-file-hooks 'auto-insert)

;; taken from http://sodonnell.wordpress.com/2007/06/21/emacs-ruby-foo/
(add-hook 'ruby-mode-hook
	  (lambda()
            (add-hook 'local-write-file-hooks
                      '(lambda()
                         (save-excursion
                           (untabify (point-min) (point-max))
                           (delete-trailing-whitespace)
                           )))
            (set (make-local-variable 'indent-tabs-mode) 'nil)
            (set (make-local-variable 'tab-width) 2)
            (imenu-add-to-menubar "RubyMode")
            (define-key ruby-mode-map "\C-m" 'newline-and-indent) ;Not sure if this line is 100% right but it works!
            (require 'ruby-electric)
            (ruby-electric-mode t)
            ))
(require 'ruby-block)
(ruby-block-mode t)
(setq ruby-block-highlight-toggle t)

(define-auto-insert "\\.rb$" 'ruby-auto-insert)
(defun ruby-auto-insert ()
  (progn
    (insert "#!/usr/bin/env ruby\n")
    (insert "#\n# $Id$\n#\n\n")
    (insert "require 'rubygems'\n")
    (insert "require 'trollop'\n")
    (insert "require 'pp'\n")
    (insert "require 'thread'\n\n")
    (insert "# get command line options\n")
    (insert "options = Trollop::options do\n")
    (insert "   version \"$Id: $\"\n")
    (insert "   banner <<-EOB\n")
    (insert "   #{$0} has the following options\n")
    (insert "   EOB\n\n")
    (insert "   opt :threads, \"number of threads to run\", :default => 20\n")
    (insert "   opt :output, \"output format [csv, text]\", :default => \"csv\"\n")
    (insert "   opt :verbose, \"verbose output sent to stderr\", :default => false\n")
    (insert "end\n")
    (insert "Trollop::die \"need at least one arg\" if ARGV.empty?\n")
    (insert "\n\n")
    (insert "pool = ThreadPool.new(options[:threads].to_i)\n")
    )
  )



;; ;; Adding simple note support
;; (require 'simplenote)
;; (setq simplenote-email "keith@ledfords.us")
;; (simplenote-setup)


(autoload 'markdown-mode "markdown-mode.el" "Major mode for editing Markdown files" t) (setq auto-mode-alist (cons '("\\.text" . markdown-mode) auto-mode-alist))

(autoload 'puppet-mode "puppet-mode" "Major mode for editing puppet manifests")

(add-to-list 'auto-mode-alist '("\\.pp$" . puppet-mode))
