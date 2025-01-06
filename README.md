# Robot Framework Monkey Testing

This project demonstrates how to perform Monkey Testing using Robot Framework and SeleniumLibrary.

## Program Description

* **Functionality:** Performs monkey testing on a website.
* **Programmer:** Suman Gangopadhyay
* **Email ID:** linuxgurusuman@gmail.com
* **Date:** 6-Jan-2025
* **Version:** 1.0
* **Code Library:** Selenium
* **Prerequisites:** Python, Selenium, ChromeDriver
* **Caveats:** None

## Prerequisites

- Python 3.x
- Robot Framework
- SeleniumLibrary
- Browser drivers (e.g., ChromeDriver for Chrome)

## Installation

1. Install Robot Framework and SeleniumLibrary:
    ```sh
    pip install robotframework
    pip install robotframework-seleniumlibrary
    ```

2. Download and place the appropriate browser driver (e.g., ChromeDriver) in your system PATH.



## Running the Tests

To execute the test suite, run the following command in your terminal:

```sh
robot -d Results TestCases/MonkeyTesting.robot
```

This command will run the test suite and generate the results in the `Results` directory.

## License

This project is licensed under the MIT License.
