import catppuccin
from typing import Any, TYPE_CHECKING

if TYPE_CHECKING:
    c: Any = None
    config: Any = None

# Documentation:
#   qute://help/configuring.html
#   qute://help/settings.html

config.load_autoconfig()

# Color scheme
# catppuccin.setup(c, 'mocha', True)

# Dark mode
config.set("colors.webpage.darkmode.enabled", True)

# Cookies
config.set('content.cookies.accept', 'all', 'devtools://*')
config.set('content.headers.accept_language',
           '', 'https://matchmaker.krunker.io/*')
config.set('content.cookies.accept', 'all', 'chrome-devtools://*')

# Headers
config.set('content.headers.user_agent',
           'Mozilla/5.0 ({os_info}) AppleWebKit/{webkit_version} (KHTML, like Gecko) {upstream_browser_key}/{upstream_browser_version} Safari/{webkit_version}')
config.set('content.headers.user_agent',
           'Mozilla/5.0 ({os_info}; rv:90.0) Gecko/20100101 Firefox/90.0', 'https://accounts.google.com/*')
# Static Chrome user-agent for YouTube
config.set('content.headers.user_agent',
           'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/114.0.0.0 Safari/537.36',
           'https://www.youtube.com/*')

# Static Chrome user-agent for Twitter
config.set('content.headers.user_agent', 
           'Mozilla/5.0 (Macintosh; Intel Mac OS X 13_0_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/115.0.0.0 Safari/537.36', 
           'https://twitter.com/*')

# Static Chrome user-agent for Reddit
config.set('content.headers.user_agent',
           'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/114.0.0.0 Safari/537.36',
           'https://www.reddit.com/*')

# Images
config.set('content.images', True, 'chrome-devtools://*')
config.set('content.images', True, 'devtools://*')

# JavaScript
config.set('content.javascript.enabled', True, 'chrome-devtools://*')
config.set('content.javascript.enabled', True, 'devtools://*')
config.set('content.javascript.enabled', True, 'chrome://*/*')
config.set('content.javascript.enabled', True, 'qute://*/*')
config.set('content.javascript.enabled', True)

config.set("content.blocking.enabled", False)

# Local Content Access
config.set('content.local_content_can_access_remote_urls', True,
           'file:///Users/Nadavushka/Library/Application%20Support/qutebrowser/userscripts/*')
config.set('content.local_content_can_access_file_urls', False,
           'file:///Users/Nadavushka/Library/Application%20Support/qutebrowser/userscripts/*')

# Defaults
# c.url.start_pages = ["https://www.google.com/"]
c.url.start_pages = ["https://www.reddit.com/?feed=home"]
c.url.searchengines = {
    "DEFAULT": "https://www.duckduckgo.com/search?q={}",
    "yt": "https://www.youtube.com/search?q={}"
}
c.tabs.show = "multiple"

# Always restore open sites when qutebrowser is reopened
# c.auto_save.interval = 15000
# c.auto_save.session = True
c.session.lazy_restore = False


config.set("content.autoplay", False)

# Colors
c.colors.tabs.even.fg = "white"
c.colors.tabs.selected.even.fg = "white"
c.colors.tabs.odd.fg = "white"
c.colors.tabs.selected.odd.fg = "white"
c.colors.tabs.selected.even.bg = "darkblue"
c.colors.tabs.selected.odd.bg = "darkblue"

# Keybindings
# Define the leader key variable

# Set the leader key using the variable
config.bind('<space>1', "tab-select 1")
config.bind('<space>2', "tab-select 2")
config.bind('<space>3', "tab-select 3")
config.bind('<space>4', "tab-select 4")
config.bind('<space>5', "tab-select 5")
config.bind('<space>6', "tab-select 6")
config.bind("<Cmd+Ctrl+F>", "fullscreen")
config.bind("<f12>", "devtools")
config.bind("<Ctrl-e>", "fake-key <Alt-Right>", "insert")
config.bind("<Ctrl-b>", "fake-key <Alt-Left>", "insert")
config.bind("<Ctrl-w>", "fake-key <Alt-Right><Alt-Left>", "insert")
config.bind("<Ctrl-l>", "fake-key <Right>", "insert")
config.bind("<Ctrl-k>", "fake-key <Up>", "insert")
config.bind("<Ctrl-j>", "fake-key <Down>", "insert")
config.bind("<Ctrl-h>", "fake-key <Left>", "insert")
config.bind("<Ctrl-d>", "fake-key <Backspace>", "insert")
config.bind("<Ctrl-x>", "fake-key <Delete>", "insert")
config.bind("<Ctrl-u>", "fake-key <Home><Shift-End><Delete>", "insert")
config.bind("xx", "config-cycle tabs.show always switching")

config.unbind("+")
config.unbind("-")
config.unbind("=")
config.bind("z+", "zoom-in")
config.bind("z-", "zoom-out")
config.bind("zz", "zoom")

# Open current page in mpv
config.bind(',m', 'spawn mpv {url}')

# Use hints to select links to open in mpv
config.bind(',M', 'hint links spawn mpv {hint-url}')

# Rapid hints for multiple links
config.bind(';M', 'hint --rapid links spawn mpv {hint-url}')
