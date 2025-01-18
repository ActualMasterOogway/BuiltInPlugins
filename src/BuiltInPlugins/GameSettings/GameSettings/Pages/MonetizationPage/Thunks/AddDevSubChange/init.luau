local l_Parent_0 = script.Parent.Parent.Parent.Parent;
local l_deepJoin_0 = require(l_Parent_0.Packages.Framework).Util.deepJoin;
local v2 = require(l_Parent_0.Src.Actions.AddChange);
return function(v3, v4) --[[ Line: 7 ]]
    -- upvalues: l_deepJoin_0 (copy), v2 (copy)
    return function(v5, _) --[[ Line: 8 ]]
        -- upvalues: l_deepJoin_0 (ref), v3 (copy), v4 (copy), v2 (ref)
        local v7 = v5:getState();
        local v8 = v7.Settings.Changed.DeveloperSubscriptions or v7.Settings.Current.DeveloperSubscriptions;
        local v9 = l_deepJoin_0(v8, {
            [v3] = v4
        });
        v5:dispatch(v2("DeveloperSubscriptions", v9));
    end;
end;