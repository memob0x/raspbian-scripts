import os
import xbmc
import xbmcgui
import xbmcaddon
import subprocess

__plugin__ = "emustation-launcher"
__author__ = "toast"
__url__ = "https://github.com/memob0x/osmc-emustation-addons/"
__git_url__ = "https://github.com/memob0x/osmc-emustation-addons/"
__credits__ = "toast"
__version__ = "0.0.1"

dialog = xbmcgui.Dialog()
addon = xbmcaddon.Addon(id='plugin.program.emustation-launcher')

subprocess.call(["sh", "/home/osmc/.kodi/addons/plugin.program.emustation-launcher/launcher.sh"])
