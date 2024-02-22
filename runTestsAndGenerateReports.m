function runTestsAndGenerateReports(testFiles)
    import matlab.unittest.TestRunner;
    import matlab.unittest.plugins.XMLPlugin;
    import matlab.unittest.TestSuite;

    % Initialize a cell array to hold the test suites
    suites = {};

    % Loop over each file and create a test suite
    for i = 1:length(testFiles)
        % Construct the full path to the test file
        testFilePath = fullfile('tests', testFiles{i});

        % Append the test suite for each file to the cell array of test suites
        suites{end+1} = TestSuite.fromFile(testFilePath);
    end

    % Concatenate all test suites into a single TestSuite array
    suite = [suites{:}];

    % Ensure the test-results folder exists
    [~,~] = mkdir('test-results');

    % Create a test runner with text output
    runner = TestRunner.withTextOutput();

    % Add an XML plugin to produce JUnit-style test results
    runner.addPlugin(XMLPlugin.producingJUnitFormat('test-results/results.xml'));

    % Run the test suite
    results = runner.run(suite);

    % Display the test results
    disp(results);
end