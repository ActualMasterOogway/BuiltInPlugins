local l_Parent_0 = script.Parent.Parent.Parent.Parent;
local l_Actions_0 = l_Parent_0.Core.Actions;
local v2 = require(l_Actions_0.NetworkError);
local v3 = require(l_Actions_0.SetCachedCreatorInfo);
local l_Util_0 = l_Parent_0.Core.Util;
local v5 = require(l_Util_0.CreatorInfoHelper);
return function(v6, v7, v8) --[[ Line: 10 ]]
    -- upvalues: v5 (copy), v3 (copy), v2 (copy)
    return function(v9) --[[ Line: 11 ]]
        -- upvalues: v6 (copy), v7 (copy), v8 (copy), v5 (ref), v3 (ref), v2 (ref)
        return v6:getCreatorInfo(v7, v8):andThen(function(v10) --[[ Line: 12 ]]
            -- upvalues: v5 (ref), v8 (ref), v9 (copy), v3 (ref), v7 (ref)
            local v11 = v5.getNameFromResult(v10, v8);
            v9:dispatch(v3({
                Id = v7, 
                Name = v11, 
                Type = v8
            }));
        end, function(v12) --[[ Line: 20 ]]
            -- upvalues: v9 (copy), v2 (ref)
            v9:dispatch(v2(v12));
        end);
    end;
end;