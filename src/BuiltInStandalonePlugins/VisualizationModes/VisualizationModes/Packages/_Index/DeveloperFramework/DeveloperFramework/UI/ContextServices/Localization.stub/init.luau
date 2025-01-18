local l_Parent_0 = script:FindFirstAncestor("UI").Parent;
local v1 = require(script.Parent.Localization_stubbed);
local v2 = require(l_Parent_0.Util.Signal);
local l_join_0 = require(l_Parent_0.Parent.Dash).join;
local l_new_0 = v1.new;
v1.new = function(v5) --[[ Line: 13 ]] --[[ Name: new ]]
    -- upvalues: l_new_0 (copy), l_join_0 (copy), v2 (copy)
    return l_new_0(l_join_0(v5, {
        overrideLocaleChangedSignal = v2.new(), 
        overrideLocaleId = 1
    }));
end;
return v1;