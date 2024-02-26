function runTestsAndGenerateReports(testFiles)
    import matlab.unittest.TestRunner;
    import matlab.unittest.plugins.XMLPlugin;
    import matlab.unittest.TestSuite;

    % Initialize a cell array to hold the test suites
    suites = {};

    % Check if we are in the 'tests' directory
    if isfolder('tests')
        testFolder = 'tests'; % We are in the project root
    else
        testFolder = '.'; % We are in the 'tests' directory
    end

    % Loop over each file and create a test suite
    for i = 1:length(testFiles)
        % Construct the full path to the test file, adding the .m extension
        testFilePath = fullfile(testFolder, [testFiles{i}, '.m']);

        % Append the test suite for each file to the cell array of test suites
        suites{end+1} = TestSuite.fromFile(testFilePath);
    end

    % Concatenate all test suites into a single TestSuite array
    suite = [suites{:}];

    % Create a test runner with text output
    runner = TestRunner.withTextOutput();

    % Define the path for the results file
    resultsFile = 'results.xml';
    if isfolder('tests')
        resultsFile = fullfile('tests', resultsFile);
    end

    % Add an XML plugin to produce JUnit-style test results
    runner.addPlugin(XMLPlugin.producingJUnitFormat(resultsFile));

    % Run the test suite
    results = runner.run(suite);

    % Display the test results
    disp(results);
end
