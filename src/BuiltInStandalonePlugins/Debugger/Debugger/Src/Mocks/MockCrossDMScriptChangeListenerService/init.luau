local l_Parent_0 = script.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Packages.Framework);
local v2 = require(l_Parent_0.Packages.Cryo);
local l_Signal_0 = v1.Util.Signal;
local v4 = {};
v4.__index = v4;
v4.new = function() --[[ Line: 9 ]] --[[ Name: new ]]
    -- upvalues: l_Signal_0 (copy), v4 (copy)
    local v5 = {
        GuidNameChanged = l_Signal_0.new(), 
        GuidLineContentsChanged = l_Signal_0.new()
    };
    setmetatable(v5, v4);
    v5.watchingScripts = {};
    return v5;
end;
v4.StartWatchingScriptLine = function(v6, v7, _, v9) --[[ Line: 18 ]] --[[ Name: StartWatchingScriptLine ]]
    -- upvalues: v2 (copy)
    v6.watchingScripts[v7] = v2.Dictionary.join(v6.watchingScripts[v7] or {}, {
        [v9] = true
    });
end;
v4.IsWatchingScriptLine = function(v10, v11, v12) --[[ Line: 28 ]] --[[ Name: IsWatchingScriptLine ]]
    return v10.watchingScripts[v11] and v10.watchingScripts[v11][v12];
end;
return v4;