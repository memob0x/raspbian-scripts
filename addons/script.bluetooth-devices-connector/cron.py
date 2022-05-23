from os.path import dirname, exists

from time import sleep

from utils import exeCmd, log, logSeparator
from connect import connect

import xml.etree.ElementTree as ET

logSeparator()

cron_pids_str_output = exeCmd("pgrep -f \"script.bluetooth-devices-connector/cron.py\"")
cron_pids_list_raw = cron_pids_str_output.split("\n")
cron_pids_list_clean = filter(lambda x: x > len(x) > 0, cron_pids_list_raw)

if len(cron_pids_list_clean) > 2: # TODO: check why 2 and not 1
	log(__file__ + " already running, exit")

	exit()

log(__file__ + " not running, starting")

filexml = "/home/pi/.kodi/userdata/addon_data/script.bluetooth-devices-connector/settings.xml"

def poll():
	log(__file__ + " iteration start")

	cwd = dirname(__file__)

	devs_raw = ""

	if exists(filexml):
		tree = ET.ElementTree(file=filexml)
		root = tree.getroot()

		devs_raw = root.find("setting[@id='devs']").text

	connect(devs_raw.split(","))

	log(__file__ + " iteration end")

	sleep(2)

	poll()

poll()
