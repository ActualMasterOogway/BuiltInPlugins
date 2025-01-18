local l_ChangeHistoryService_0 = game:GetService("ChangeHistoryService");
local l_Parent_0 = script.Parent.Parent.Parent;
local _ = require(l_Parent_0.Packages.Rodux);
local _ = require(l_Parent_0.Packages.React);
local v4 = require(l_Parent_0.Packages.Framework);
local l_Networking_0 = v4.Http.Networking;
local l_TestHelpers_0 = v4.TestHelpers;
local l_ContextServices_0 = v4.ContextServices;
local v8 = require(l_Parent_0.Src.Contexts.Telemetry.TelemetryContext);
local v9 = require(l_Parent_0.Src.Contexts.Telemetry.TelemetryProtocol);
local _ = require(l_Parent_0.Src.Contexts.Telemetry.Types);
local v11 = require(l_Parent_0.Src.Testing.createMockPluginGui);
local v12 = require(l_Parent_0.Src.Util.createStore);
local v13 = require(l_Parent_0.Src.Util.recordChange);
local v14 = require(l_Parent_0.Src.Resources.MakeTheme);
local _ = require(l_Parent_0.Src.Thunks.Types);
local _ = require(l_Parent_0.Src.Types);
local v17 = {};
v17.__index = v17;
v17.new = function() --[[ Line: 62 ]] --[[ Name: new ]]
    -- upvalues: l_TestHelpers_0 (copy), l_Networking_0 (copy), v9 (copy), l_ContextServices_0 (copy), v11 (copy), v13 (copy), l_ChangeHistoryService_0 (copy), v12 (copy), v17 (copy)
    local v18 = l_TestHelpers_0.Instances.MockPlugin.new("StyleEditor");
    local v19 = l_Networking_0.mock();
    local v20 = v9.new();
    local v21 = l_ContextServices_0.Localization.mock();
    local v22 = v11();
    local v23 = l_ContextServices_0.Focus.new(v22);
    local v24 = v13(l_ChangeHistoryService_0);
    local v25 = {
        Plugin = v18, 
        Localization = v21, 
        Networking = v19, 
        Telemetry = v20, 
        recordChange = v24
    };
    local v26 = v12(v25);
    return (setmetatable({
        _destroyed = false, 
        plugin = v18, 
        localization = v21, 
        networking = v19, 
        telemetry = v20, 
        focus = v23, 
        store = v26
    }, v17.__index));
end;
v17.provide = function(v27, v28) --[[ Line: 98 ]] --[[ Name: provide ]]
    -- upvalues: l_ContextServices_0 (copy), v8 (copy), v14 (copy), l_TestHelpers_0 (copy)
    assert(v27._destroyed == false, "cannot use MockContext after it is destroyed");
    assert(type(v28) == "table", "expected children to be a table");
    local v29 = {
        l_ContextServices_0.Plugin.new(v27.plugin), 
        l_ContextServices_0.Store.new(v27.store), 
        l_ContextServices_0.Mouse.new(v27.plugin:GetMouse()), 
        v8.new(v27.telemetry), 
        v27.localization, 
        v27.focus, 
        v14(true)
    };
    return l_TestHelpers_0.provideMockContext(v29, v28);
end;
v17.destroy = function(v30) --[[ Line: 115 ]] --[[ Name: destroy ]]
    assert(v30._destroyed == false, "cannot use MockContext after it is destroyed");
    v30._destroyed = true;
    v30.focus:get():Destroy();
    v30.plugin:Destroy();
    v30.localization:destroy();
    v30.focus:destroy();
    v30.store:destruct();
end;
return v17;