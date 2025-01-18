local v0 = {
    background = Color3.fromRGB(0, 0, 0), 
    iden = Color3.fromRGB(234, 234, 234), 
    keyword = Color3.fromRGB(215, 174, 255), 
    builtin = Color3.fromRGB(131, 206, 255), 
    string = Color3.fromRGB(196, 255, 193), 
    number = Color3.fromRGB(255, 125, 125), 
    comment = Color3.fromRGB(140, 140, 155), 
    operator = Color3.fromRGB(255, 239, 148), 
    custom = Color3.fromRGB(119, 122, 255)
};
local _ = require(script.Parent.Types);
local v2 = {
    tokenColors = {}, 
    defaultColors = v0
};
v2.setColors = function(v3) --[[ Line: 20 ]] --[[ Name: setColors ]]
    -- upvalues: v2 (copy)
    assert(type(v3) == "table", "Theme.updateColors expects a table");
    for v4, v5 in v3 do
        v2.tokenColors[v4] = v5;
    end;
end;
v2.getColoredRichText = function(v6, v7) --[[ Line: 28 ]] --[[ Name: getColoredRichText ]]
    return "<font color=\"#" .. v6:ToHex() .. "\">" .. v7 .. "</font>";
end;
v2.getColor = function(v8) --[[ Line: 32 ]] --[[ Name: getColor ]]
    -- upvalues: v2 (copy)
    return v2.tokenColors[v8];
end;
v2.setColors(v0);
return v2;