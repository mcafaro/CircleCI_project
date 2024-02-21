% runTestsAndGenerateReports.m
function runTestsAndGenerateReports(testFiles)
    import matlab.unittest.TestSuite;
    import matlab.unittest.TestRunner;
    import matlab.unittest.plugins.XMLPlugin;
    
    % Ensure the 'testResults' directory exists
    resultsDir = 'testResults';
    if ~exist(resultsDir, 'dir')
        mkdir(resultsDir);
    end
    
    % Check if testFiles is a cell array of character vectors
    if ~iscellstr(testFiles) && ~iscell(testFiles)
        error('testFiles must be a cell array of character vectors.');
    end
    
    % Create a test suite for each specified test file
    suite = [];
    for i = 1:numel(testFiles)
        % Ensure each element of testFiles is a character vector
        if ischar(testFiles{i})
            % Append the TestSuite for the current test file
            suite = [suite, TestSuite.fromFile(testFiles{i})];
        else
            error('Each element of testFiles must be a character vector.');
        end
    end
    
    % Check if the suite is empty
    if isempty(suite)
        error('No valid test files were provided.');
    end
    
    % Run each test class and generate a JUnit XML report
    for i = 1:numel(suite)
        % Create a test runner with text output for each test
        runner = TestRunner.withTextOutput;
        
        % Get the name of the test class
        testName = suite(i).Name;
        
        % Sanitize the test name to create a valid filename
        sanitizedTestName = matlab.lang.makeValidName(testName);
        
        % Define the XML file name based on the sanitized test class name
        xmlFile = fullfile(resultsDir, strcat(sanitizedTestName, '.xml'));
        
        % Add the XML plugin for JUnit format
        runner.addPlugin(XMLPlugin.producingJUnitFormat(xmlFile));
        
        % Run the test suite
        runner.run(suite(i));
    end
end