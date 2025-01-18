local l_Parent_0 = script.Parent.Parent;
local l_Tests_0 = l_Parent_0.Tests;
local l_DraggerFramework_0 = l_Parent_0.Packages.DraggerFramework;
local v3 = require(l_DraggerFramework_0.Utility.isFTF);
local v4 = require(l_DraggerFramework_0.Utility.isCli);
if v3() then
    local v5, v6 = require(l_Parent_0.Packages.Dev.Jest).runCLI(l_Tests_0, {}, {
        l_Tests_0.DraggerSchemaCore, 
        l_Tests_0.DraggerFramework
    }):awaitStatus();
    if v5 ~= "Resolved" or v6.results.numFailedTestSuites > 0 or v6.results.numFailedTests > 0 then
        if v5 == "Rejected" then
            print(v6);
        end;
        game:GetService("TestService"):Error("Jest 3 test run failed");
    end;
end;
if v4() then
    game:GetService("ProcessService"):ExitAsync(0);
end;