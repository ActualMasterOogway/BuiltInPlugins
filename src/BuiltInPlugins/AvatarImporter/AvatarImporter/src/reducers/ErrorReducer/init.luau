local l_Parent_0 = script.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Packages.Rodux);
local v2 = require(l_Parent_0.Packages.Cryo);
local l_actions_0 = l_Parent_0.src.actions;
local v4 = require(l_actions_0.SetError);
return v1.createReducer({}, {
    [v4.name] = function(v5, v6) --[[ Line: 11 ]]
        -- upvalues: v2 (copy)
        return v2.Dictionary.join(v5, {
            name = v6.name, 
            message = v6.message
        });
    end
});