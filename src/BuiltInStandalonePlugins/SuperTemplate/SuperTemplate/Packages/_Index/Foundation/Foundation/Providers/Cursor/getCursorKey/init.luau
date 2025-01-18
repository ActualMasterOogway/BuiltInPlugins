local l_script_FirstAncestor_0 = script:FindFirstAncestor("Foundation");
local _ = require(l_script_FirstAncestor_0.Providers.Style.Tokens);
local function v5(v2, v3, v4) --[[ Line: 6 ]]
    return string.format("%.2f %.2f %.2f %.2f", v2.Scale, v2.Offset, v3, v4);
end;
return function(v6, v7, v8, v9) --[[ Line: 10 ]] --[[ Name: getCursorKey ]]
    -- upvalues: v5 (copy)
    local v10 = UDim.new(0, 0);
    if v7 ~= nil then
        v10 = v7;
    end;
    local l_Thick_0 = v6.Stroke.Thick;
    if v9 ~= nil then
        assert(v9 > 0, "Error! borderWidth should be larger than 0.");
        l_Thick_0 = v9;
    end;
    local v12 = 0;
    v12 = if v8 ~= nil then v8 - l_Thick_0 else v6.Size.Size_150 - l_Thick_0;
    return v5(v10, v12, l_Thick_0);
end;