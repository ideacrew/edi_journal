#!/bin/bash

base="$( dirname "${BASH_SOURCE[0]}" )/../.."

cd $base
root=`pwd -P`

rm -Rf ./doc ./rubocop ./coverage report.zip \
  ./test_reports/junit_formatter/rspec_results/rspec.xml ./test_reports/junit_formatter/rspec_results/index.html \
  ./test_reports/cucumber_formatter/cucumber_results/cucumber.json \
  ./test_reports/cucumber_formatter/cucumber_results/cucumber.html \
  ./test_reports/cucumber_formatter/junit/*.xml

yarn install
COVERAGE=true bundle exec rspec
pushd test_reports/junit_formatter
npm install
npm run rspec-report
popd
bundle exec cucumber --format progress \
  --format json --out test_reports/cucumber_formatter/cucumber_results/cucumber.json \
  --format junit --out test_reports/cucumber_formatter/junit
pushd test_reports/cucumber_formatter
npm install
npm run cucumber-report
popd

bundle exec yardoc
bundle exec rubocop -f h -o rubocop/index.html

zip -r report.zip doc rubocop test_reports/junit_formatter/rspec_results test_reports/cucumber_formatter/cucumber_results coverage
