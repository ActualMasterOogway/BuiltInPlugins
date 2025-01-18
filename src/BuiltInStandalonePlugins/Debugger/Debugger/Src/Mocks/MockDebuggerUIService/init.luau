local l_Parent_0 = script.Parent.Parent.Parent;
local l_Signal_0 = require(l_Parent_0.Packages.Framework).Util.Signal;
local v2 = {};
v2.__index = v2;
v2.new = function() --[[ Line: 8 ]] --[[ Name: new ]]
    -- upvalues: l_Signal_0 (copy), v2 (copy)
    local v3 = {
        ExpressionsCleared = l_Signal_0.new()
    };
    setmetatable(v3, v2);
    v3.openScripts = {};
    v3.showingArrow = false;
    v3.currentThreadId = -1;
    return v3;
end;
v2.OpenScriptAtLine = function(v4, v5, _, _, _) --[[ Line: 18 ]] --[[ Name: OpenScriptAtLine ]]
    v4.openScripts[v5] = true;
end;
v2.SetScriptLineMarker = function(v9, _, _, _, v13) --[[ Line: 27 ]] --[[ Name: SetScriptLineMarker ]]
    if v13 then
        v9.showingArrow = true;
    end;
end;
v2.RemoveScriptLineMarkers = function(v14, _, v16) --[[ Line: 38 ]] --[[ Name: RemoveScriptLineMarkers ]]
    if v16 then
        v14.showingArrow = false;
    end;
end;
v2.SetCurrentThreadId = function(v17, v18) --[[ Line: 44 ]] --[[ Name: SetCurrentThreadId ]]
    v17.currentThreadId = v18;
end;
return v2;