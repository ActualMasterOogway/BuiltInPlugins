local l_Parent_0 = script.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Packages.Rodux);
local l_Closed_0 = require(l_Parent_0.Src.Util.CurrentStatus).Closed;
return v1.createReducer(l_Closed_0, {
    ResetStore = function(_, _) --[[ Line: 14 ]] --[[ Name: ResetStore ]]
        -- upvalues: l_Closed_0 (copy)
        return l_Closed_0;
    end, 
    SetCurrentStatus = function(_, v6) --[[ Line: 18 ]] --[[ Name: SetCurrentStatus ]]
        return v6.currentStatus;
    end
});