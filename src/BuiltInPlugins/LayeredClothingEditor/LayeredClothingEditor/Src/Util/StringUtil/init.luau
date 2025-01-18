local l_TextService_0 = game:GetService("TextService");
local v1 = {};
local v2 = Vector2.new(1000000, 50);
v1.getTextWidth = function(v3, v4, v5) --[[ Line: 7 ]] --[[ Name: getTextWidth ]]
    -- upvalues: l_TextService_0 (copy), v2 (copy)
    return l_TextService_0:GetTextSize(v3, v4, v5, v2).X;
end;
return v1;