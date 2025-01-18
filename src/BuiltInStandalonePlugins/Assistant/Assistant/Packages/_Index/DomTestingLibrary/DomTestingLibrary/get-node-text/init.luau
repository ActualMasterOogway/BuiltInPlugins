local v0 = {};
local function v2(v1) --[[ Line: 5 ]] --[[ Name: hasText ]]
    return v1.Text;
end;
local function _(v3) --[[ Line: 10 ]] --[[ Name: getText ]]
    -- upvalues: v2 (copy)
    if pcall(v2, v3) and not v3:IsA("TextBox") then
        return v3.Text;
    else
        return "";
    end;
end;
v0.getNodeText = function(v5) --[[ Line: 15 ]] --[[ Name: getNodeText ]]
    -- upvalues: v2 (copy)
    if pcall(v2, v5) and not v5:IsA("TextBox") then
        return v5.Text;
    else
        return "";
    end;
end;
return v0;