local l_Parent_0 = script.Parent.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Core.Actions.GetFavorited);
local v2 = require(l_Parent_0.Core.Actions.NetworkError);
local function _(v3) --[[ Line: 6 ]] --[[ Name: getFavoritedFromResult ]]
    if v3.responseBody == "null" then
        return false;
    else
        return true;
    end;
end;
return function(v5, v6, v7) --[[ Line: 14 ]]
    -- upvalues: v1 (copy), v2 (copy)
    return function(v8) --[[ Line: 15 ]]
        -- upvalues: v5 (copy), v6 (copy), v7 (copy), v1 (ref), v2 (ref)
        return v5:getFavorited(v6, v7):andThen(function(v9) --[[ Line: 16 ]]
            -- upvalues: v8 (copy), v1 (ref), v7 (ref)
            v8:dispatch(v1(v7, v9.responseBody ~= "null"));
        end, function(v10) --[[ Line: 18 ]]
            -- upvalues: v8 (copy), v2 (ref)
            v8:dispatch(v2(v10));
        end);
    end;
end;