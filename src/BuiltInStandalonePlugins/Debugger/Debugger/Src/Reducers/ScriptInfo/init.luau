local l_Parent_0 = script.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Packages.Rodux);
local v2 = require(l_Parent_0.Packages.Cryo);
local l_Actions_0 = l_Parent_0.Src.Actions;
local v4 = require(l_Actions_0.Common.SetFilenameForGuid);
local v5 = require(l_Actions_0.Common.SetScriptSourceLine);
local v6 = {
    ScriptInfo = {}, 
    ScriptLineContents = {}
};
return v1.createReducer(v6, {
    [v4.name] = function(v7, v8) --[[ Line: 30 ]]
        -- upvalues: v2 (copy)
        if v8.fileName == "" and v7.ScriptInfo[v8.scriptRefGuid] ~= nil then
            return v7;
        else
            local v9 = v2.Dictionary.join(v7.ScriptInfo, {
                [v8.scriptRefGuid] = v8.fileName
            });
            return v2.Dictionary.join(v7, {
                ScriptInfo = v9
            });
        end;
    end, 
    [v5.name] = function(v10, v11) --[[ Line: 46 ]]
        -- upvalues: v2 (copy)
        local v12 = v2.Dictionary.join(v10.ScriptLineContents, {
            [v11.scriptRefGuid] = v2.Dictionary.join(v10.ScriptLineContents[v11.scriptRefGuid] or {}, {
                [v11.lineNumber] = v11.source
            })
        });
        return v2.Dictionary.join(v10, {
            ScriptLineContents = v12
        });
    end
});