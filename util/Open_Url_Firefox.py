import logging
from selenium import webdriver
from util.firefoxDriver import get_driver
import time

logger = logging.getLogger(__name__)
request_header = {
    "Content-Type": "text/json"
}
# Test step 1 - Open URL

driver = get_driver()

def test_open_url(url):
    """
       This tests verifies the VODISUI UI ui is launched from the system using firefox browser.
       Steps:
           1. Launch OpsHubMonitor ui url
       Expected results:
           1. Verify URL page is loaded
    """
    request_url = url
    driver.implicitly_wait(5)
    driver.get(request_url)
    time.sleep(5)

def destroy_browser():
    """
           To close the launched browser after the test completion.
        """
    driver.quit()