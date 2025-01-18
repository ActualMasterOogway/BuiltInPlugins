local l_Parent_0 = script.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Packages.Rodux);
local v2 = require(l_Parent_0.Packages.Cryo);
local v3 = require(l_Parent_0.Src.Util.Constants);
return v1.createReducer({
    toolMode = v3.TOOL_MODE.None, 
    draggerType = Enum.RibbonTool.Select
}, {
    SetToolMode = function(v4, v5) --[[ Line: 11 ]] --[[ Name: SetToolMode ]]
        -- upvalues: v2 (copy)
        return v2.Dictionary.join(v4, {
            toolMode = v5.toolMode
        });
    end, 
    SetDraggerType = function(v6, v7) --[[ Line: 16 ]] --[[ Name: SetDraggerType ]]
        -- upvalues: v2 (copy)
        return v2.Dictionary.join(v6, {
            draggerType = v7.draggerType
        });
    end
});