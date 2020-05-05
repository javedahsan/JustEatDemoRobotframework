import logging
from selenium import webdriver
import time

logger = logging.getLogger(__name__)
request_header = {
    "Content-Type": "text/json"
}
# Test step 1 - Open URL


def chrome_driver():
    """
       This tests verifies the OpsHubMonitor UI is launched from the system.
    """

    chrome_options = webdriver.ChromeOptions()
    chrome_options.add_argument("no-sandbox")
    # chrome_options.add_argument('headless')

    chrome_options.add_argument("disable-setuid-sandbox")
    chrome_options.add_argument('window-size=1200x600')
    # Optional argument, if not specified will search path.
    cdriver = webdriver.Chrome(chrome_options=chrome_options)
    cdriver.maximize_window()
    return cdriver

driver = chrome_driver()

def get_driver():
    return driver
