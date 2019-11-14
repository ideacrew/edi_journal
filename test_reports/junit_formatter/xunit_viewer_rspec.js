const XunitViewer = require('xunit-viewer/cli')
const result = XunitViewer({
    results: 'rspec_results/rspec.xml',
    suites: [],
    xml: '',
    ignore: [],
    output: "./rspec_results/index.html",
    title: "RSpec Results",
    port: false,
    watch: false,
    color: true,
    filter: {},
    format: 'html'
})
