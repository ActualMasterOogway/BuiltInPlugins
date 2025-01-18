local l_script_FirstAncestor_0 = script:FindFirstAncestor("Explorer");
local _ = require(l_script_FirstAncestor_0.RpcTypes);
local _ = require(l_script_FirstAncestor_0.Networking.createSession.createSessionTypes);
local v3 = require(l_script_FirstAncestor_0.Util.isExpanded);
local function _(v4) --[[ Line: 7 ]] --[[ Name: isLuaSourceContainer ]]
    local v5 = true;
    if v4 ~= "ModuleScript" then
        v5 = true;
        if v4 ~= "Script" then
            v5 = v4 == "LocalScript";
        end;
    end;
    return v5;
end;
return function(v7, v8, v9) --[[ Line: 11 ]] --[[ Name: doubleClick ]]
    -- upvalues: v3 (copy)
    local v10 = v7.getExplorerNodeById(v9);
    assert(v10 ~= nil, "Double clicking on unknown node");
    if v7.capabilities.canOpenScripts then
        local l_className_0 = v10.datum.className;
        local v12 = true;
        if l_className_0 ~= "ModuleScript" then
            v12 = true;
            if l_className_0 ~= "Script" then
                v12 = l_className_0 == "LocalScript";
            end;
        end;
        if v12 then
            v8.guestRpcInterface.openScript(v9);
            return;
        end;
    end;
    if not v10.datum.hasChildren then
        return;
    elseif v3(v10) then
        v7.unexpand(v9);
        return;
    else
        task.spawn(function() --[[ Line: 31 ]]
            -- upvalues: v7 (copy), v9 (copy)
            v7.expandAsync(v9);
        end);
        return;
    end;
end;