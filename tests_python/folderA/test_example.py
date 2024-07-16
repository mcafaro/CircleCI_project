import unittest
import xmlrunner

class TestExample(unittest.TestCase):

    @classmethod
    def setUpClass(cls):
        print("Running tests from folder A")

    def test_addition(self):
        print("Running test_addition from folder A")
        self.assertEqual(1 + 1, 2)

    def test_subtraction(self):
        print("Running test_subtraction from folder A")
        self.assertEqual(5 - 3, 2)

    def test_multiplication(self):
        print("Running test_multiplication from folder A")
        self.assertEqual(2 * 3, 6)

    def test_division(self):
        print("Running test_division from folder A")
        self.assertEqual(8 / 4, 2)

if __name__ == "__main__":
    with open('test-results/results_example.xml', 'wb') as output:
        unittest.main(testRunner=xmlrunner.XMLTestRunner(output=output), failfast=False, buffer=False, catchbreak=False)
