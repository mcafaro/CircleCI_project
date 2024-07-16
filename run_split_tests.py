import unittest
import xmlrunner
import sys
import os

def run_tests(test_files):
    loader = unittest.TestLoader()
    suite = unittest.TestSuite()

    for test_file in test_files:
        module_name = test_file.replace('/', '.').rstrip('.py')
        module = __import__(module_name, fromlist=[''])
        suite.addTests(loader.loadTestsFromModule(module))

    # Ensure the test-results directory exists
    os.makedirs('test-results', exist_ok=True)

    with open('test-results/split_tests_results.xml', 'wb') as output:
        runner = xmlrunner.XMLTestRunner(output=output)
        runner.run(suite)

if __name__ == "__main__":
    test_files = sys.argv[1:]
    run_tests(test_files)
