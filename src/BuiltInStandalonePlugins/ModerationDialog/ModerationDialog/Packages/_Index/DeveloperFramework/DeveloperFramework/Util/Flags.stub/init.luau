local l_Parent_0 = script.Parent.Parent;
local l_join_0 = require(l_Parent_0.Parent.Dash).join;
local v2 = require(script.Parent.Flags_stubbed);
local l_new_0 = v2.new;
v2.new = function(v4, v5) --[[ Line: 10 ]] --[[ Name: new ]]
    -- upvalues: l_new_0 (copy), l_join_0 (copy)
    return l_new_0(v4, l_join_0(v5, {
        shouldFetchLiveValues = false
    }));
end;
return v2;