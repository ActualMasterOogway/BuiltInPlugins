local l_TextService_0 = game:GetService("TextService");
local l_script_FirstAncestor_0 = script:FindFirstAncestor("TerrainEditor");
local v2 = require(l_script_FirstAncestor_0.Src.Util.getMaterials);
return function(v3, v4, v5, v6) --[[ Line: 7 ]]
    -- upvalues: v2 (copy), l_TextService_0 (copy)
    local v7 = v2(v5, v6);
    local v8 = 0;
    for _, v10 in v7 do
        local l_l_TextService_0_TextSize_0 = l_TextService_0:GetTextSize(v3:getText("Materials", v10.Name), v4.FontSize, v4.Font, Vector2.new(1e999, 1e999));
        if v8 < l_l_TextService_0_TextSize_0.X then
            v8 = l_l_TextService_0_TextSize_0.X;
        end;
    end;
    return v8 + v4.PreviewSize + v4.Spacing + v4.SelectInputArrowSize + v4.DropdownPadding * 2;
end;