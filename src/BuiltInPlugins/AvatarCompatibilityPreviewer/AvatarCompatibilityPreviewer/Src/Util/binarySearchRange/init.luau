local l_script_FirstAncestor_0 = script:FindFirstAncestor("AvatarCompatibilityPreviewer");
local v1 = require(l_script_FirstAncestor_0.Src.Util.exhaustiveMatch);
local function v9(v2, v3, v4) --[[ Line: 9 ]] --[[ Name: binarySearch ]]
    -- upvalues: v1 (copy)
    local v5 = 1;
    local l_v2_0 = v2;
    while true do
        local v7 = (v5 + l_v2_0) // 2;
        local v8 = v3((v4(v7)));
        if v8 == "equal" then
            return v7;
        elseif l_v2_0 <= v5 then
            return nil;
        elseif v8 == "smaller" then
            v5 = v7 + 1;
        elseif v8 == "bigger" then
            l_v2_0 = v7 - 1;
        else
            v1(v8);
        end;
    end;
end;
return function(v10, v11, v12) --[[ Line: 37 ]] --[[ Name: binarySearchRange ]]
    -- upvalues: v9 (copy)
    local v13 = v9(v10, v11, v12);
    if v13 == nil then
        return {};
    else
        assert(v13 ~= nil, "Luau");
        local v14 = {
            v13
        };
        for v15 = v13 - 1, 1, -1 do
            if v11(v12(v15)) == "equal" then
                table.insert(v14, v15);
            else
                break;
            end;
        end;
        for v16 = v13 + 1, v10 do
            if v11(v12(v16)) == "equal" then
                table.insert(v14, v16);
            else
                break;
            end;
        end;
        return v14;
    end;
end;