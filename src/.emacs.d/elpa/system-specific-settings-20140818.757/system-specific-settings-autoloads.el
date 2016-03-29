;;; system-specific-settings-autoloads.el --- automatically extracted autoloads
;;
;;; Code:
(add-to-list 'load-path (or (file-name-directory #$) (car load-path)))

;;;### (autoloads nil "system-specific-settings" "system-specific-settings.el"
;;;;;;  (22194 53488 417487 800000))
;;; Generated autoloads from system-specific-settings.el

(autoload 'if-system-type-match "system-specific-settings" "\
If COND matches `system-type', do THEN, else do ELSE.

Matching is done using `system-specific-settings-do-match'.

\(fn COND THEN &rest ELSE)" nil t)

(put 'if-system-type-match 'lisp-indent-function '2)

(autoload 'if-system-name-match "system-specific-settings" "\
If COND matches `system-name', do THEN, else do ELSE.

Matching is done using `system-specific-settings-do-match'.

\(fn COND THEN &rest ELSE)" nil t)

(put 'if-system-name-match 'lisp-indent-function '2)

(autoload 'when-system-type-match "system-specific-settings" "\
Eval BODY only if `system-type' matches COND.

Matching is done using `system-specific-settings-do-match'.

\(fn COND &rest BODY)" nil t)

(put 'when-system-type-match 'lisp-indent-function '1)

(autoload 'when-system-name-match "system-specific-settings" "\
Eval BODY only if `system-name' matches COND.

Matching is done using `system-specific-settings-do-match'.

\(fn COND &rest BODY)" nil t)

(put 'when-system-name-match 'lisp-indent-function '1)

;;;***

;; Local Variables:
;; version-control: never
;; no-byte-compile: t
;; no-update-autoloads: t
;; End:
;;; system-specific-settings-autoloads.el ends here
