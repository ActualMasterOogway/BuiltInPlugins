local l_HttpService_0 = game:GetService("HttpService");
local l_ScriptEditorService_0 = game:GetService("ScriptEditorService");
local l_script_FirstAncestor_0 = script:FindFirstAncestor("R15Migrator");
local v3 = require(l_script_FirstAncestor_0.Packages.Framework).ContextServices.ContextItem:extend("ScriptConversionContext");
v3.new = function(v4) --[[ Line: 11 ]] --[[ Name: new ]]
    -- upvalues: v3 (copy)
    local v5 = {};
    setmetatable(v5, v3);
    v5._scripts = {};
    v5._scriptGUIDs = {};
    v5._connections = {};
    v5._scriptDestroyingCallback = v4;
    v5._revertedSources = {};
    return v5;
end;
v3.initConnections = function(v6, v7, v8) --[[ Line: 25 ]] --[[ Name: initConnections ]]
    v6._connections[v8] = v7.AncestryChanged:Connect(function(_, v10) --[[ Line: 26 ]]
        -- upvalues: v6 (copy), v7 (copy), v8 (copy)
        if v10 == nil then
            v6._scriptDestroyingCallback(v7);
            v6._connections[v8]:Disconnect();
            v6._connections[v8] = nil;
            v6._scripts[v7] = nil;
            v6._scriptGUIDs[v8] = nil;
        end;
    end);
end;
v3.findScriptGUID = function(v11, v12) --[[ Line: 37 ]] --[[ Name: findScriptGUID ]]
    return v11._scripts[v12];
end;
v3.addOrFindScript = function(v13, v14) --[[ Line: 41 ]] --[[ Name: addOrFindScript ]]
    -- upvalues: l_HttpService_0 (copy)
    local v15 = v13:findScriptGUID(v14);
    if not v13:findScriptGUID(v14) then
        v15 = l_HttpService_0:GenerateGUID(true);
        v13._scripts[v14] = v15;
        v13._scriptGUIDs[v15] = v14;
        v13:initConnections(v14, v15);
    end;
    return v15;
end;
v3.closeScriptIfOpen = function(v16, v17) --[[ Line: 52 ]] --[[ Name: closeScriptIfOpen ]]
    -- upvalues: l_ScriptEditorService_0 (copy)
    local v18 = v16:getScriptInstanceFromGUID(v17);
    if not v18 then
        return;
    else
        local l_l_ScriptEditorService_0_ScriptDocument_0 = l_ScriptEditorService_0:FindScriptDocument(v18);
        if l_l_ScriptEditorService_0_ScriptDocument_0 then
            l_l_ScriptEditorService_0_ScriptDocument_0:CloseAsync();
        end;
        return;
    end;
end;
v3.setRevertedScriptSource = function(v20, v21) --[[ Line: 64 ]] --[[ Name: setRevertedScriptSource ]]
    -- upvalues: l_ScriptEditorService_0 (copy)
    local v22 = v20:getScriptInstanceFromGUID(v21);
    v20._revertedSources[v21] = l_ScriptEditorService_0:GetEditorSource(v22);
end;
v3.getRevertedScriptSource = function(v23, v24) --[[ Line: 70 ]] --[[ Name: getRevertedScriptSource ]]
    return v23._revertedSources[v24];
end;
v3.getScriptInstanceFromGUID = function(v25, v26) --[[ Line: 74 ]] --[[ Name: getScriptInstanceFromGUID ]]
    return v25._scriptGUIDs[v26];
end;
return v3;