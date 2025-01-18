local l_Parent_0 = script.Parent;
local _ = require(l_Parent_0.Types);
local v2 = require(l_Parent_0.reduce);
local function v5(v3, v4) --[[ Line: 34 ]]
    return v3 < v4;
end;
return function(v6, v7, v8) --[[ Line: 39 ]] --[[ Name: min ]]
    -- upvalues: v5 (copy), v2 (copy)
    local v9 = v8 or v5;
    if v7 then
        return v2(v6, function(v10, v11, v12) --[[ Line: 43 ]]
            -- upvalues: v7 (copy), v9 (copy)
            local v13 = v7(v11, v12);
            if not v10 then
                return {
                    value = v13, 
                    original = v11
                };
            elseif v9(v13, v10.value) then
                return {
                    value = v13, 
                    original = v11
                };
            else
                return v10;
            end;
        end, nil).original;
    else
        return v2(v6, function(v14, v15) --[[ Line: 53 ]]
            -- upvalues: v9 (copy)
            if not v14 then
                return v15;
            elseif v9(v15, v14) then
                return v15;
            else
                return v14;
            end;
        end, nil);
    end;
end;