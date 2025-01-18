local v0 = script:FindFirstAncestor("Packages") or game:GetService("ReplicatedStorage").Packages;
local v1 = require(script.Parent);
local v2 = require(v0.Dash);
local function v8(v3) --[[ Line: 15 ]] --[[ Name: printStat ]]
    local v4 = {
        total = 0, 
        passed = 0, 
        failed = 0, 
        skipped = 0
    };
    for v5, v6 in v3 do
        local v7 = #v6.passed + #v6.failed + #v6.skipped;
        v4.total = v4.total + v7;
        v4.passed = v4.passed + #v6.passed;
        v4.failed = v4.failed + #v6.failed;
        v4.skipped = v4.skipped + #v6.skipped;
        print((("%*: %* total, %* passed, %* failed, %* skipped"):format(v5, v7, #v6.passed, #v6.failed, #v6.skipped)));
    end;
    print((("Total: %*, %* passed, %* failed, %* skipped"):format(v4.total, v4.passed, v4.failed, v4.skipped)));
end;
local v9 = v1();
v8(v9);
print("\nRaw data:");
print(v2.pretty(v9, {
    multiline = true, 
    depth = 3
}));