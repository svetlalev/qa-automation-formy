# qa-automation-formy
Automated tests for Formy web page

## Introduction

This is a small project testing part of the functionality for the Formy web app using Ruby with RSpec.

## Setup
In  order to set up the project locally, the following actions need to be taken:

* Clone the repository to your local machine

* Execute the following command:
```
bundle install
```
**Important note:** In order to run the tests you need to have chromedriver.

## Running the tests
Easiest way to run the tests is by executing in the project main directory:
```
bundle exec rspec
```
##Notes for the tests
Currently 2 tests are failing. This is due to bugs I found in the web app. These tests are:

* "Complete form Education level Select two education levels and fist one gets unchecked" - you can check multiple radio buttons (and cannot uncheck already checked one)

* "Modal Closing the modal Clicking OK closes the modal" - after modal is open, clicking on "OK" is not closing it
