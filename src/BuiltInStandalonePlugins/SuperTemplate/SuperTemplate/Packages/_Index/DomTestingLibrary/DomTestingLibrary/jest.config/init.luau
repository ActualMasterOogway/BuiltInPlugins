local l_TestsSetup_0 = script.Parent.Parent:FindFirstChild("TestsSetup");
assert(l_TestsSetup_0, "TestsSetup folder not found. Please make sure the folder exists in the root of the package.");
local l_l_TestsSetup_0_FirstChild_0 = l_TestsSetup_0:FindFirstChild("setup-env");
assert(l_l_TestsSetup_0_FirstChild_0, "setup-env file not found. Please make sure the file exists in the TestsSetup folder.");
return {
    displayName = "Jest", 
    setupFilesAfterEnv = {
        l_l_TestsSetup_0_FirstChild_0
    }, 
    testMatch = {
        "**/__tests__/**/*.spec"
    }
};