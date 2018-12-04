# coding=utf-8
import time
from selenium import webdriver
from selenium.webdriver.support.ui import WebDriverWait
from selenium.webdriver.support import expected_conditions as EC
from selenium.webdriver.common.by import By
from selenium.common.exceptions import NoSuchElementException

INFO_NAME = 'Juan';
INFO_SURNAME = 'Bensa';
INFO_MAIL = 'jbensadon@itba.edu.ar';
INFO_PASSWORD = '1029384756'

SITE_URL = 'http://localhost:80';

options = webdriver.ChromeOptions();
options.binary_location = '/Applications/Google Chrome Canary.app/Contents/MacOS/Google Chrome Canary';
options.add_argument('window-size=1280x720');
options.add_argument('headless');

webDriver = webdriver.Chrome(chrome_options=options);

webDriver.get(SITE_URL);

#Wait for elements to load and then fetch them
time.sleep(3);
webDriver.save_screenshot('homePage.png');
buttonLogin = webDriver.find_element_by_xpath('//a[contains(@class, \'btn-login\')]');
#WebDriverWait(webDriver, 100).until(EC.visibility_of(buttonLogin));

#Log accordingly and take action on the elements
print("Login button appeared. Clicking it...");
buttonLogin.click();

#Take a screenshot of login page and go to register page
time.sleep(3);
webDriver.save_screenshot('loginPage.png');
buttonRegister = webDriver.find_element_by_xpath('//a[@id=\'btn-reg\']');
#WebDriverWait(webDriver, 100).until(EC.visibility_of(buttonRegister));
print("Register button appeared. Clicking it...");
buttonRegister.click();

#Take a screenshot of register page and register the user
time.sleep(3);
webDriver.save_screenshot('registerPage.png');
textFieldName = webDriver.find_element_by_xpath('//input[@name=\'name\']');
textFieldSurname = webDriver.find_element_by_xpath('//input[@name=\'surname\']');
textFieldMail = webDriver.find_element_by_xpath('//input[@name=\'mail\']');
textFieldPassword = webDriver.find_element_by_xpath('//input[@name=\'password\']');
buttonRegisterSubmit = webDriver.find_element_by_xpath('//button[@id=\'btn_register\']');
#WebDriverWait(webDriver, 100).until(EC.visibility_of(buttonRegisterSubmit));
print("Register(submit) button appeared. Filling in user information and clicking it...");
textFieldName.send_keys(INFO_NAME);
textFieldSurname.send_keys(INFO_SURNAME);
textFieldMail.send_keys(INFO_MAIL);
textFieldPassword.send_keys(INFO_PASSWORD);
buttonRegisterSubmit.click();

#Wait for the "User registered" alert to show up and then close it
time.sleep(1);
webDriver.switch_to.alert.accept();

#Take a screenshot of home page (after registration and auto login) and open the user menu
time.sleep(3);
webDriver.save_screenshot('homePageAfterRegistration.png');
buttonUsername = webDriver.find_element_by_xpath('//strong[@id=\'user-name\']');
#WebDriverWait(webDriver, 100).until(EC.visibility_of(buttonUsername));
print("Username dropdown appeared. Clicking it...");
buttonUsername.click();

#Take a screenshot of home page (after user menu has been opened) and logout
time.sleep(3);
webDriver.save_screenshot('homePageAfterUserMenuAppeared.png');
buttonLogout = webDriver.find_element_by_xpath('//a[contains(@class, \'btn-logout\')]');
#WebDriverWait(webDriver, 100).until(EC.visibility_of(buttonRegisterSubmit));
print("Logout button appeared. Clicking it...");
buttonLogout.click();

#Take a screenshot of home page (after user has logged out) and click the login button
time.sleep(3);
webDriver.save_screenshot('homePageAfterLogout.png');
buttonLogin = webDriver.find_element_by_xpath('//a[contains(@class, \'btn-login\')]');
#WebDriverWait(webDriver, 100).until(EC.visibility_of(buttonLogin));
print("Login button appeared. Clicking it...");
buttonLogin.click();

#There's no reason to take a screenshot, but we fill in the user information and attempt to login
time.sleep(3);
textFieldMail = webDriver.find_element_by_xpath('//input[@name=\'mail\']');
textFieldPassword = webDriver.find_element_by_xpath('//input[@name=\'password\']');
buttonLoginSubmit = webDriver.find_element_by_xpath('//button[text()=\'Iniciar sesión\']');
#WebDriverWait(webDriver, 100).until(EC.visibility_of(buttonLoginSubmit));
textFieldMail.send_keys(INFO_MAIL);
textFieldPassword.send_keys(INFO_PASSWORD);
print("Login(submit) button appeared. Clicking it...");
buttonLoginSubmit.click();

#Take one last screenshot of home page (after login) and we're done
time.sleep(3);
webDriver.save_screenshot('homePageAfterLogin.png');
buttonUsername = webDriver.find_element_by_xpath('//strong[@id=\'user-name\']');
#WebDriverWait(webDriver, 100).until(EC.visibility_of(buttonUsername));
print("Username dropdown appeared. Success!");
webDriver.quit();