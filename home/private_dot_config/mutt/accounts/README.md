# Mutt Accounts

To integrate an account, follow these steps:

1. Create a new file in this directory (e.g. `./org.example.demo`)
2. Insert the configuration below
3. Read the section for your email provider and add provider specific settings.
4. Go to `./default` and include the new file, add account hooks and key
   bindings.

Example configuration:
```muttrc
# sender info
set from = "demo@example.org"
set realname = "John Doe"

# imap credentials
set imap_user = "demo@example.org"
set imap_pass = "`pass show email/demo@example.org | head -n1`"

# imap settings
set imap_check_subscribed
set imap_keepalive = 300
set ssl_force_tls = yes
set mail_check = 120
set timeout = 10
# allow to open connection automatically
unset imap_passive

# folders
set folder = "imaps://imap.example.com:993"
set spoolfile = "+INBOX"
set postponed = "+Drafts"
set record = "+Sent"
set trash = "+Trash"
mailboxes = "+INBOX "

# copy outgoing messages to records
set copy = yes

# smtp
set smtp_url = "smtps://demo@smtp.example.org:587"
set smtp_pass = "`pass show email/demo@example.org | head -n1`"

# signature file
#set signature = "~/.mutt/signature"
```

## Gmail

### Connection

When using two-factor authentication, the connection requires an
[app-specific password](https://security.google.com/settings/security/apppasswords).

```muttrc
set imap_user = "username@gmail.com"
set smtp_url = "smtps://username@smtp.gmail.com:587"
```

### Folders

Names are language specific, e.g. `set postponed = "+[Gmail]/Entwürfe"` for German.

```muttrc
set spoolfile = "+INBOX"
set postponed = "+[Gmail]/Drafts"
set record = "+[Gmail]/Sent Mail"
set trash = "+[Gmail]/Trash"

# disable as gmail copies outgoing messages automatically
set copy = no

# archive messages
macro index,pager y "<save-message>=[Gmail]/All Messages<enter><enter>" "Archive"
```
