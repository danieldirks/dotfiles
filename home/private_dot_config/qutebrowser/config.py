# see https://www.qutebrowser.org/doc/help/configuring.html

import os
from urllib.request import urlopen

# load autoconfig.yml
config.load_autoconfig()

# content
config.set('content.cookies.accept', 'no-3rdparty')  # all, no-3rdparty, no-unknown-3rdparty, never
config.set('content.javascript.enabled', True)
config.set('content.local_content_can_access_remote_urls', True)
config.set('content.local_content_can_access_file_urls', False)

# theme: Catppuccin Mocha
config.set("colors.webpage.darkmode.enabled", True)
if not os.path.exists(config.configdir / "theme.py"):
    theme = "https://raw.githubusercontent.com/catppuccin/qutebrowser/main/setup.py"
    with urlopen(theme) as themehtml:
        with open(config.configdir / "theme.py", "a") as file:
            file.writelines(themehtml.read().decode("utf-8"))
if os.path.exists(config.configdir / "theme.py"):
    import theme
    theme.setup(c, 'mocha', True)
