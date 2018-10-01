---

layout: post

title:       "SMTP, IMAP and POP3 Email Ports and Servers 2"
description: "A list of default (and for some specific providers) SMTP, IMAP and POP3 email settings (ports and servers)."

categories: [email]
tags:       [smtp, imap, pop3]

resources:
  - "<https://www.arclab.com/en/kb/email/list-of-smtp-and-imap-servers-mailserver-list.html>"
  - "<https://www.arclab.com/en/kb/email/list-of-smtp-and-pop3-servers-mailserver-list.html>"
  - "<http://www.emailaddressmanager.com/tips/mail-settings.html>"

---


## Why & when do I need these settings?

Online email providers are basically email services designed to provide you with email mailbox accesss directly from the web. However, going online and logging on to their sites is not always the most convenient way for reading and sending emails.

On the other hand, you have the alternative to send and receive emails through such a mailbox by using a local email client software, such as Outlook Express, Microsoft Outlook, Thunderbird, etc. In order to properly use it, you need to configure your email software with the incoming and outgoing mail servers of your email provider (Hotmail, Gmail, Yahoo! Mail or else).


## Default Ports and Servers

|                                 | Server        | Authentication | Port        |
|---------------------------------|---------------|----------------|-------------|
| SMTP Server (Outgoing Messages) | Non-Encrypted | AUTH           | 25 (or 587) |
|                                 | Secure (TLS)  | StartTLS       | 587         |
|                                 | Secure (SSL)  | SSL            | 465         |
| IMAP Server (Incoming Messages) | Non-Encrypted | AUTH           | 143         |
|                                 | Secure (TLS)  | StartTLS       | 143         |
|                                 | Secure (SSL)  | SSL            | 993         |
| POP3 Server (Incoming Messages) | Non-Encrypted | AUTH           | 110         |
|                                 | Secure (SSL)  | SSL            | 995         |


## Google - Gmail

|                                 | Server         | Authentication | Port        |
|---------------------------------|----------------|----------------|-------------|
| SMTP Server (Outgoing Messages) | smtp.gmail.com | StartTLS       | 587         |
|                                 | smtp.gmail.com | SSL            | 465         |
| IMAP Server (Incoming Messages) | imap.gmail.com | SSL            | 993         |
| POP3 Server (Incoming Messages) | pop.gmail.com  | SSL            | 995         |

Notes:

- please make sure, that IMAP access is enabled in the account settings;
- please make sure, that POP3 access is enabled in the account settings;
- you also need to enable "less secure apps" (third party apps) in the Gmail settings:
  - <https://support.google.com/accounts/answer/6010255?hl=en>.


## Outlook.com

|                                 | Server                | Authentication | Port        |
|---------------------------------|-----------------------|----------------|-------------|
| SMTP Server (Outgoing Messages) | smtp-mail.outlook.com | StartTLS       | 587         |
|                                 | smtp.live.com         | StartTLS       | 587         |
| IMAP Server (Incoming Messages) | imap-mail.outlook.com | SSL            | 993         |
| POP3 Server (Incoming Messages) | pop3.live.com         | SSL            | 995         |


## Office365.com

|                                 | Server                | Authentication | Port        |
|---------------------------------|-----------------------|----------------|-------------|
| SMTP Server (Outgoing Messages) | smtp.office365.com    | StartTLS       | 587         |
| IMAP Server (Incoming Messages) | outlook.office365.com | SSL            | 993         |
| POP3 Server (Incoming Messages) | outlook.office365.com | SSL            | 995         |

Note:

- if the settings are not working for your account, then login to the outlook web app and go to the "Settings" > "Options" > "Account" > "My Account" > "Settings for POP and IMAP Access".


## Yahoo Mail

|                                 | Server              | Authentication | Port        |
|---------------------------------|---------------------|----------------|-------------|
| SMTP Server (Outgoing Messages) | smtp.mail.yahoo.com | SSL            | 465         |
| IMAP Server (Incoming Messages) | imap.mail.yahoo.com | SSL            | 993         |
| POP3 Server (Incoming Messages) | pop.mail.yahoo.com  | SSL            | 995         |


## Mail.com

|                                 | Server        | Authentication | Port        |
|---------------------------------|---------------|----------------|-------------|
| SMTP Server (Outgoing Messages) | smtp.mail.com | StartTLS       | 587         |
| IMAP Server (Incoming Messages) | pop.mail.com  | SSL            | 993         |
| POP3 Server (Incoming Messages) | pop.mail.com  | SSL            | 995         |


{% include resources.html %}