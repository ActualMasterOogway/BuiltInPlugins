local l_Parent_0 = script.Parent.Parent;
local v1 = require(l_Parent_0.Util.strict);
local v2 = require(l_Parent_0.Parent.Dash);
local l_collect_0 = v2.collect;
local l_join_0 = v2.join;
local l_map_0 = v2.map;
local v6 = {
    Left = 0, 
    Top = 0, 
    Right = 0, 
    Bottom = 0
};
local function v10(v7) --[[ Line: 20 ]] --[[ Name: expandPadding ]]
    -- upvalues: l_map_0 (copy), v6 (copy), l_join_0 (copy), l_collect_0 (copy)
    if type(v7) == "number" then
        return l_map_0(v6, function() --[[ Line: 22 ]]
            -- upvalues: v7 (copy)
            return v7;
        end);
    elseif type(v7) == "table" then
        return l_join_0(v6, l_collect_0(v7, function(v8, v9) --[[ Line: 28 ]]
            -- upvalues: v6 (ref)
            if v6[v8] == nil then
                return nil;
            else
                return v8, v9;
            end;
        end));
    elseif v7 == nil then
        return l_join_0(v6, {});
    else
        return nil;
    end;
end;
return function(v11) --[[ Line: 43 ]]
    -- upvalues: v10 (copy), v1 (copy), l_join_0 (copy)
    local v12 = true;
    if v11 ~= nil then
        v12 = true;
        if type(v11) ~= "number" then
            v12 = type(v11) == "table";
        end;
    end;
    assert(v12, "Padding must be nil, a number or a table");
    local v13 = v10(v11);
    return v1(l_join_0(v13, {
        Horizontal = v13.Left + v13.Right, 
        Vertical = v13.Top + v13.Bottom
    }));
end;