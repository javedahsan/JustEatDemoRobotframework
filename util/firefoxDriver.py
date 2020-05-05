import logging
from selenium import webdriver
import time


logger = logging.getLogger(__name__)
request_header = {
    "Content-Type": "text/json"
}


def firefox_driver():
    """
       This tests verifies the OpsHubMonitor UI is launched from the system using firefox browser.
    """

    firefox_options = webdriver.firefox.options.Options()
    browser = webdriver.Firefox(options=firefox_options)
    browser.maximize_window()
    return browser


driver = firefox_driver()

def get_driver():
    return driver
