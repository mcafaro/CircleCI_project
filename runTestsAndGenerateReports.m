import matlab.unittest.TestRunner;
import matlab.unittest.plugins.XMLPlugin;

suite = testsuite(pwd, 'IncludeSubfolders', true);

[~,~] = mkdir('test-results/matlab');

runner = TestRunner.withTextOutput();
runner.addPlugin(XMLPlugin.producingJUnitFormat('test-results/matlab/results.xml'));

results = runner.run(suite);
display(results);
