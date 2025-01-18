local l_TextService_0 = game:GetService("TextService");
local v1 = Vector2.new(5000, 5000);
return {
    calculateTextSize = function(v2, v3, v4) --[[ Line: 11 ]] --[[ Name: calculateTextSize ]]
        -- upvalues: l_TextService_0 (copy), v1 (copy)
        return l_TextService_0:GetTextSize(v2, v3, v4, v1);
    end
};