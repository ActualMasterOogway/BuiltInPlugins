local l_Parent_0 = script.Parent.Parent;
return {
    displayName = "Jest", 
    setupFilesAfterEnv = {
        l_Parent_0.TestsSetup["setup-env"]
    }, 
    testMatch = {
        "**/__tests__/**/*.spec"
    }
};