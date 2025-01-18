local l_Parent_0 = script.Parent.Parent;
return {
    Instances = require(l_Parent_0.TestHelpers.Instances), 
    makeSettableValue = require(l_Parent_0.TestHelpers.makeSettableValue), 
    provideMockContext = require(l_Parent_0.TestHelpers.provideMockContext), 
    runFrameworkTests = require(l_Parent_0.TestHelpers.runFrameworkTests), 
    ServiceWrapper = require(l_Parent_0.TestHelpers.ServiceWrapper), 
    setEquals = require(l_Parent_0.TestHelpers.setEquals), 
    testImmutability = require(l_Parent_0.TestHelpers.testImmutability)
};