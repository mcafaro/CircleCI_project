classdef testSquareRoot_parameterized < matlab.unittest.TestCase
    
    properties (TestParameter)
        inputs = {4, 16, 81, 121, 49};
        expected_outputs = {2, 4, 9 , 11, 7};
    end
    
    methods (TestClassSetup)
        function addTestContentToPath(testCase)
        if ispc
            userHome = getenv('USERPROFILE');
        elseif isunix
            userHome = getenv('HOME');
        else
            error('Platform not supported');
        end
        sourceDir = fullfile(userHome, 'CircleCI_project', 'source');
        
        % Add the 'source' directory to the MATLAB search path
        addpath(sourceDir);
        end
    end       
    
    
    methods (Test,ParameterCombination='sequential')
        function test(testCase,inputs,expected_outputs)
            testCase.verifyEqual(squareRoot(inputs),expected_outputs);
        end
        
        function testError(testCase)
            testCase.verifyError(@()squareRoot(-1),'SQUAREROOT:INVALIDINPUT');
        end
  
    end
  
    
end
