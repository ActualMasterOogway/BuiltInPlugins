local l_Parent_0 = script.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Packages.Roact);
local v2 = require(l_Parent_0.Packages.Framework);
local l_ContextServices_0 = v2.ContextServices;
local l_TestHelpers_0 = v2.TestHelpers;
local l_MockToastNotificationService_0 = l_TestHelpers_0.Instances.MockToastNotificationService;
local l_provideMockContext_0 = l_TestHelpers_0.provideMockContext;
local v7 = require(l_Parent_0.Src.Utility.TestHelper);
local v8 = require(l_Parent_0.Src.Utility.ToastNotification);
local v9 = {};
local function v11(v10) --[[ Line: 16 ]] --[[ Name: createContextItems ]]
    -- upvalues: v7 (copy), l_ContextServices_0 (copy), v8 (copy), l_MockToastNotificationService_0 (copy)
    v10 = v10 or v7.createTestStore();
    return {
        l_ContextServices_0.Store.new(v10), 
        v8.new(l_MockToastNotificationService_0.new())
    }, v10;
end;
v9.runComponentTest = function(v12, v13, v14) --[[ Line: 24 ]] --[[ Name: runComponentTest ]]
    -- upvalues: v7 (copy), v11 (copy), l_provideMockContext_0 (copy), v1 (copy)
    local v15 = v7.getTempScreenGui();
    local v16, v17 = v11(v14);
    local v18 = l_provideMockContext_0(v16, {
        test = v12
    });
    local v19 = nil;
    v1.act(function() --[[ Line: 31 ]]
        -- upvalues: v19 (ref), v1 (ref), v18 (copy), v15 (copy)
        v19 = v1.mount(v18, v15);
    end);
    local l_status_0, l_result_0 = pcall(function() --[[ Line: 35 ]]
        -- upvalues: v13 (copy), v15 (copy), v17 (copy)
        if v13 then
            v13(v15, v17);
        end;
    end);
    v1.unmount(v19);
    if not v14 then
        v17:destruct();
    end;
    for _, v23 in ipairs(v16) do
        v23:destroy();
    end;
    if not l_status_0 then
        error(l_result_0);
    end;
end;
return v9;