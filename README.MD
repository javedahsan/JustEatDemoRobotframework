#Just Eat Demo
****

This Project demonstrates to develop behavior driven Automation Test Framework using Python, Selenium and Roboframework.

All test are setup to test the web application JustEat using url http://justeat.uk.com
 
### How To Start

To run the tests the following steps should be followed:

+   Make sure at least [Python 2.7](https://www.python.org/downloads/release/python) [see Python 2.7 release] is installed.

    '''
        $python -v
        e.g. : Python 2.7
    '''
+   Also make sure Python's [Pip](http://pypi.python.org/pypi/pip) is installed.

    '''
        pip -v
        e.g. pip 20.0.2 from /usr/lib/python2.7/lib/site-packages/pip 
    '''    
 +  Install required packages that are needed to run the Robot tests.
    go to project home directory e.g. ~/projectJustEatRobo and run the following command:
    '''
        pip install -r requirements.txt
    '''
 + If the installation of all required packages succeed you are good to go:
    '''
        $ python -m robot.run  --version
        e.g. : Robot Framework 3.2 (Python 2.7.16 on win32)
    '''    
 + Before we can run the Selenium test suites, we need to install Firefox (or you can install other drivers Chrome, Safari etc.)
 ### Run the tests
Running the tests is very easy:
```
    $ python -m robot.run testsuites
```    
`testsuites` is in this case the folder where the tests are located


To run a part of your test suite you can add a tag name to your command line:
```
    $ python -m robot.run --include behavior-driven testsuites
```    
With the above commands we the test suites , or test cases with the `behavior-driven` tag. To exclude tests you can use the `--exclude` parameter

See `$ python -m robot.run --help` for more information

+ List of all folders:
`FailedImages`  - location for All Failed testcases Images
`PageObject`    - location for locators, Keywords etc 
`util`          - location for all webdrivers and implement classes etc
`Project folder` - contains report, log and README etc

+ List of TestCases:
    - Verify Just Eat Content Titles
    - Verify Just Eat Search Attributes
    - Verify Just Eat Total Number of Resturants When Postal Code is valid
    - Verify Just Eat Total Number of Resturants When Postal Code is Unknown
    - Verify Just Eat No Resturants found When Post Code is invalid
    - Verify Just Eat Search Error Message When Postal Code is null "# JustEatDemoRobotframework" 
