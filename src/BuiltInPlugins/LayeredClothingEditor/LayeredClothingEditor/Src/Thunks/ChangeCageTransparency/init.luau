local l_Parent_0 = script.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Src.Actions.SetCagesTransparency);
local l_deepCopy_0 = require(l_Parent_0.Packages.Framework).Util.deepCopy;
return function(v3, v4) --[[ Line: 6 ]]
    -- upvalues: l_deepCopy_0 (copy), v1 (copy)
    return function(v5) --[[ Line: 7 ]]
        -- upvalues: l_deepCopy_0 (ref), v3 (copy), v4 (copy), v1 (ref)
        local v6 = v5:getState();
        local v7 = l_deepCopy_0(v6.selectItem.cagesTransparency);
        v7[v3] = v4;
        v5:dispatch(v1(v7));
    end;
end;