# https://www.qutebrowser.org/doc/help/configuring.html
# https://www.qutebrowser.org/doc/help/settings.html

import os
from urllib.request import urlopen

# reassign to supress lsp errors below
config = config
c = c

# load autoconfig.yml
config.load_autoconfig()

# general
c.backend = "webengine"
c.content.pdfjs = False
c.editor.command = [
        "i3-sensible-terminal", "-e", "/usr/bin/nvim",
        "-f", "{file}",
        "-c", "normal {line}G{column0}l"]
c.scrolling.bar = "always"

# blocking
c.content.blocking.adblock.lists = [
        "https://raw.githubusercontent.com/uBlockOrigin/uAssets/master/filters/filters-2023.txt",
        "https://raw.githubusercontent.com/bogachenko/fuckfuckadblock/master/fuckfuckadblock.txt",
        "https://easylist.to/easylist/easylist.txt",
        ]
c.content.blocking.enabled = True
c.content.blocking.method = "both"

# security
c.content.canvas_reading = False
c.content.cookies.accept = 'no-3rdparty'
c.content.geolocation = "ask"
c.content.headers.do_not_track = True
c.content.headers.referer = "same-domain"
# c.content.headers.user_agent = "Mozilla/5.0 (Windows NT 10.0; rv:68.0) Gecko/20100101 Firefox/68.0"
c.content.javascript.clipboard = "none"
c.content.javascript.enabled = True
c.content.local_content_can_access_remote_urls = False
c.content.local_content_can_access_file_urls = False
c.content.media.video_capture = "ask"
c.content.media.audio_capture = "ask"
c.content.media.audio_video_capture = "ask"
c.content.notifications.enabled = False
c.content.webgl = False
c.content.webrtc_ip_handling_policy = "default-public-interface-only"
c.content.xss_auditing = False

# defaults
c.url.default_page = 'https://start.duckduckgo.com'
c.url.start_pages = ['https://start.duckduckgo.com']
c.url.searchengines = \
    {"DEFAULT": "https://duckduckgo.com/?q={}",
     "a": "https://web.archive.org/web/*/{}",
     "ddg": "https://duckduckgo.com/?q={}",
     "gh": "https://github.com/search?q={}",
     "r": "https://www.reddit.com/search?q={}",
     "yt": "https://www.youtube.com/results?search_query={}",
     }

# tabs
c.tabs.background = True  # open in background
c.tabs.indicator.width = 0
c.tabs.min_width = 200
c.tabs.new_position.unrelated = 'next'  # open new tab after current
c.tabs.position = "left"
c.tabs.select_on_remove = "prev"
c.tabs.show = "multiple"  # show only if more than one
c.tabs.title.format = "{index}{private}{title_sep}{audio}{current_title}"
c.window.title_format = "{perc}{audio}{current_title}{title_sep}qutebrowser{private}"
c.tabs.width = 26

# session - autosave and restore on restart
c.auto_save.session = True
c.session.lazy_restore = True

# video playback
c.content.autoplay = False

# downloads
c.downloads.location.directory = '~/downloads'
c.downloads.location.prompt = False
c.downloads.open_dispatcher = "xdg-open {}"
c.downloads.position = "bottom"
c.downloads.remove_finished = 60000

# commands
c.aliases["archive"] = "open --tab https://web.archive.org/save/{url}"
c.aliases["view-archive"] = "open --tab https://web.archive.org/web/*/{url}"

# bindings
config.bind("gF", "view-source --edit", "normal")
config.bind("gp", "open -p", "normal")
if "<Ctrl-W>" in c.bindings.default["normal"]:
    del c.bindings.default["normal"]["<Ctrl-W>"]

# user bindings
config.bind('<Space>b', 'config-cycle content.blocking.enabled true false')
config.bind("<Space>m", 'spawn --detach mpv "{url}"', "normal")
config.bind("<Space>M", 'hint links spawn --detach mpv "{hint-url}"', "normal")
config.bind("<Space>r", "config-source", "normal")  # reload config

# pass bindings
pass_userscript = "qute-pass --dmenu-invocation 'rofi -dmenu' " + \
                  "--username-target secret --username-pattern 'login: (.*)'"
config.bind("<Space>pp",
            f"spawn --userscript {pass_userscript}", "normal")
config.bind("<Space>ps",
            f"spawn --userscript {pass_userscript} --password-only", "normal")
config.bind("<Space>pu",
            f"spawn --userscript {pass_userscript} --username-only", "normal")
config.bind("<Space>po",
            f"spawn --userscript {pass_userscript} --otp-only", "normal")

# theme: catppuccin mocha
c.colors.webpage.darkmode.enabled = False
c.colors.webpage.preferred_color_scheme = "dark"
if not os.path.exists(config.configdir / "theme.py"):
    theme = "https://raw.githubusercontent.com/catppuccin/qutebrowser/main/setup.py"
    with urlopen(theme) as themehtml:
        with open(config.configdir / "theme.py", "a") as file:
            file.writelines(themehtml.read().decode("utf-8"))
if os.path.exists(config.configdir / "theme.py"):
    import theme
    theme.setup(c, 'mocha', True)

    palette = {
        "rosewater": "#f5e0dc",
        "flamingo": "#f2cdcd",
        "pink": "#f5c2e7",
        "mauve": "#cba6f7",
        "red": "#f38ba8",
        "maroon": "#eba0ac",
        "peach": "#fab387",
        "yellow": "#f9e2af",
        "green": "#a6e3a1",
        "teal": "#94e2d5",
        "sky": "#89dceb",
        "sapphire": "#74c7ec",
        "blue": "#89b4fa",
        "lavender": "#b4befe",
        "text": "#cdd6f4",
        "subtext1": "#bac2de",
        "subtext0": "#a6adc8",
        "overlay2": "#9399b2",
        "overlay1": "#7f849c",
        "overlay0": "#6c7086",
        "surface2": "#585b70",
        "surface1": "#45475a",
        "surface0": "#313244",
        "base": "#1e1e2e",
        "mantle": "#181825",
        "crust": "#11111b",
    }

    # overrides
    c.colors.webpage.bg = "#ffffff"
    c.colors.tabs.even.bg = palette["base"]
    c.colors.tabs.odd.bg = palette["base"]
    c.colors.tabs.selected.even.bg = palette["surface1"]
    c.colors.tabs.selected.odd.bg = palette["surface1"]
    c.colors.statusbar.private.bg = palette["surface1"]
