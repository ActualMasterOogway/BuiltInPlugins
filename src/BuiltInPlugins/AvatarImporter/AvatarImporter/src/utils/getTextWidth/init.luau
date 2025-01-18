local l_TextService_0 = game:GetService("TextService");
local v1 = Vector2.new(1e999, 1e999);
return function(v2, v3, v4) --[[ Line: 5 ]] --[[ Name: getTextWidth ]]
    -- upvalues: l_TextService_0 (copy), v1 (copy)
    return l_TextService_0:GetTextSize(v2, v3, v4, v1).X;
end;