local _ = require(script.Types);
local v1 = require(script.Utility);
local v2 = require(script.Theme);
local v3 = {
    defaultLexer = require(script.Lexer)
};
v3.highlight = function(v4, v5) --[[ Line: 12 ]] --[[ Name: highlight ]]
    -- upvalues: v2 (copy), v1 (copy), v3 (copy)
    if v5 then
        v2.setColors(v5);
    end;
    v4 = v1.convertTabsToSpaces(v1.removeControlChars(v4));
    local l_defaultLexer_0 = v3.defaultLexer;
    local v7 = v2.getColor("iden");
    local v8 = "";
    for v9, v10 in l_defaultLexer_0.scan(v4) do
        local v11 = v2.getColor(v9) or v7;
        v8 = v8 .. v2.getColoredRichText(v11, v1.sanitizeRichText(v10));
    end;
    return v8;
end;
v3.getTokenColor = function(v12) --[[ Line: 31 ]] --[[ Name: getTokenColor ]]
    -- upvalues: v2 (copy)
    return v2.getColor(v12);
end;
return v3;