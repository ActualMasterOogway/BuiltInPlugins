local l_TextService_0 = game:GetService("TextService");
local l_SourceSans_0 = Enum.Font.SourceSans;
local v2 = Vector2.new(1e999, 1e999);
return function(v3, v4, v5, v6) --[[ Line: 7 ]] --[[ Name: GetTextSize ]]
    -- upvalues: l_SourceSans_0 (copy), v2 (copy), l_TextService_0 (copy)
    v4 = v4 or 16;
    v5 = v5 or l_SourceSans_0;
    local v7 = v6 or v2;
    return l_TextService_0:GetTextSize(v3, v4, v5, v7);
end;