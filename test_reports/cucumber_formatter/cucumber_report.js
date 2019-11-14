var reporter = require('cucumber-html-reporter');

var options = {
        theme: 'bootstrap',
        jsonFile: './cucumber_results/cucumber.json',
        output: './cucumber_results/cucumber.html',
        reportSuiteAsScenarios: true,
        scenarioTimestamp: true,
        launchReport: false,
        brandTitle: "Cucumber Report",
        name: "Cucumber Results",
        metadata: {
            "Browser": "Chrome",
            "Parallel": "Scenarios"
        }
    };

reporter.generate(options);
