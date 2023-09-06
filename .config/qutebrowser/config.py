config.load_autoconfig()
config.source("qutebrowser-themes/themes/onedark.py")
config.bind("p", "open -p {url}")

config.bind('<z><l>', 'spawn --userscript qute-pass -U secret -u "login: (.+)" -d dmenu')
config.bind('<z><u><l>', 'spawn --userscript qute-pass -U secret -u "login: (.+)" -e -d dmenu')
config.bind('<z><p><l>', 'spawn --userscript qute-pass -U secret -u "login: (.+)" -w -d dmenu')
config.bind('<z><o><l>', 'spawn --userscript qute-pass --otp-only -d dmenu')
