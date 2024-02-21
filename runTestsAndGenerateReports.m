% runTestsAndGenerateReports.m
function runTestsAndGenerateReports
    import matlab.unittest.TestSuite;
    import matlab.unittest.TestRunner;
    import matlab.unittest.plugins.XMLPlugin;
    
    % Ensure the 'testResults' directory exists
    resultsDir = 'testResults';
    if ~exist(resultsDir, 'dir')
        mkdir(resultsDir);
    end
    
    % Create a test suite for all test classes in the 'tests' folder
    suite = TestSuite.fromFolder('tests', 'IncludeSubfolders', true);
    
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