;; SMTP設定
(setq wl-smtp-posting-server "grey.ep.sci.hokudai.ac.jp")
(setq smtp-local-domain "grey.ep.sci.hokudai.ac.jp")

;; デフォルトIMAP設定
(setq elmo-imap4-default-server "grey.ep.sci.hokudai.ac.jp")
(setq elmo-imap4-default-user "masuda")
;; パスワードを暗号化しない
(setq elmo-imap4-default-authenticate-type 'clear)

;; ???????
(setq wl-from "masuda kazutaka <masuda@ep.sci.hokudai.ac.jp>")
(setq wl-message-id-domain "ep.sci.hokudai.ac.jp")
;; Message-ID を from 名から作成する
(setq wl-message-id-use-wl-from t)
;; メッセージを送信する前に確認する
(setq wl-interactive-send t)

;; 漢字 IMAPフォルダを有効にする
(setq elmo-imap4-use-modified-utf7 t)

;; 最初に読みにいくIMAPフォルダ
(setq wl-default-folder "%inbox")
;; ゴミ箱IMAPフォルダ
(setq wl-trash-folder "%Trash")
;; 送信IMAPフォルダ
(setq wl-fcc "%Sent")

;; ????????????? 3????
(setq wl-stay-folder-window t)
;; ????????????????
(setq wl-draft-reply-buffer-style 'full)
;; ????IMAP??????????????
(setq wl-fcc-force-as-read t)
;; ?????????????????
(setq wl-draft-always-delete-myself t)

;; ソート順
(add-to-list 'wl-summary-sort-specs 'rdate)

;; 振り分け設定
;; "$"以外を振り分け対象に
;; (setq wl-summary-auto-refile-skip-marks '("$"))
(setq wl-refile-rule-alist
      '(("To" ("gfdlab-ml@ep\.sci\.hokudai\.ac\.jp" . "gfdlab"))
      	("To" ("rsaloon-ml@ep\.sci\.hokudai\.ac\.jp" . "rsaloon"))
      	("To" ("epnetfan-ml@ep\.sci\.hokudai\.ac\.jp" . "epnetfan"))
      	("To" ("epcore-ml@ep\.sci\.hokudai\.ac\.jp" . "epnetfan"))
      	("To" ("naitei@scc-k\.co\.jp" . "SCC"))
	)
)
;; すべてのメッセージを自動リファイルする
(setq wl-summary-auto-refile-skip-marks nil)


;; メッセージ表示
;; 一旦すべてのヘッダを非表示に
(setq wl-message-ignored-field-list '("^.*:"))
;; 見たいヘッダのみを表示
(setq wl-message-visible-field-list
      '("^Subject:"
        "^From:"
        "^To:"
        "^Cc:"
        "^Date:"
        "^Message-ID:"
        ))

;; 返信設定
;; "a" で普通に返信. メーリングリストなどがあればそちらに返信. 
(setq wl-draft-reply-without-argument-list
      '((("X-ML-Name" "Reply-To") . (("Reply-To") nil nil))
        ("X-ML-Name" . (("To" "Cc") nil nil))
        ("Followup-To" . (nil nil ("Followup-To")))
        ("Newsgroups" . (nil nil ("Newsgroups")))
        ("Reply-To" . (("Reply-To") nil nil))
        ("Mail-Reply-To" . (("Mail-Reply-To") nil nil))
        ("From" . (("From") nil nil))))
;; "C-u a" で関係のあるひとすべてに返信.
(setq wl-draft-reply-with-argument-list
      '(("Followup-To" . (("From") nil ("Followup-To")))
        ("Newsgroups" . (("From") nil ("Newsgroups")))
        ("Mail-Followup-To" . (("Mail-Followup-To") nil ("Newsgroups")))
        ("From" . (("From") ("To" "Cc") ("Newsgroups"))))
)	