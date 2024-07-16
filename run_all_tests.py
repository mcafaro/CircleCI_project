import unittest
import xmlrunner

# Import your test modules
import test_example
import test_math_operations
import test_string_operations
import test_list_operations
import test_dictionary_operations

# Create a test suite combining all test cases
loader = unittest.TestLoader()
suite = unittest.TestSuite()

suite.addTests(loader.loadTestsFromModule(test_example))
suite.addTests(loader.loadTestsFromModule(test_math_operations))
suite.addTests(loader.loadTestsFromModule(test_string_operations))
suite.addTests(loader.loadTestsFromModule(test_list_operations))
suite.addTests(loader.loadTestsFromModule(test_dictionary_operations))

# Run the test suite and generate an XML report
with open('test-results/all_tests_results.xml', 'wb') as output:
    runner = xmlrunner.XMLTestRunner(output=output)
    runner.run(suite)
