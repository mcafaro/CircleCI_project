import unittest

class TestExample(unittest.TestCase):

    @classmethod
    def setUpClass(cls):
        print("Running tests from folder B")

    def test_addition(self):
        self.assertEqual(1 + 1, 2)

    def test_subtraction(self):
        self.assertEqual(5 - 3, 2)

    def test_multiplication(self):
        self.assertEqual(2 * 3, 6)

    def test_division(self):
        self.assertEqual(8 / 4, 2)

if __name__ == "__main__":
    unittest.main()
