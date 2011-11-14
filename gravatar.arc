(require "crypto.arc")

(def gravatar-base ((o secure))
  (if secure
      "https://secure.gravatar.com/avatar/"
      "http://www.gravatar.com/avatar/"))

(def gravatar-opts (opts)
  (awhen opts
    (string #\? (intersperse #\& (map [list _.0 #\= _.1] pair.opts)))))

(def gravatar-id (mail)
  (md5:downcase:trim mail))

(def gravatar (mail (o opts) (o secure))
  (string gravatar-base.secure gravatar-id.mail gravatar-opts.opts))
