import unittest
import xmlrunner

class TestStringOperations(unittest.TestCase):

    def test_concatenation(self):
        self.assertEqual("Hello " + "World", "Hello World")

    def test_uppercase(self):
        self.assertEqual("hello".upper(), "HELLO")

    def test_lowercase(self):
        self.assertEqual("HELLO".lower(), "hello")

    def test_split(self):
        self.assertEqual("Hello World".split(), ["Hello", "World"])

if __name__ == "__main__":
    with open('results_string_operations.xml', 'wb') as output:
        unittest.main(testRunner=xmlrunner.XMLTestRunner(output=output), failfast=False, buffer=False, catchbreak=False)
