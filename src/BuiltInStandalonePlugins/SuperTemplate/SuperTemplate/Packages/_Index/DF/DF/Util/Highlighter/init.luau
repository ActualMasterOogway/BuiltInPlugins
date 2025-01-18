local _ = require(script.Types);
local v1 = require(script.Utility);
local v2 = require(script.Theme);
local v3 = {
    defaultLexer = require(script.Lexer)
};
v3.highlight = function(v4) --[[ Line: 12 ]] --[[ Name: highlight ]]
    -- upvalues: v1 (copy), v3 (copy), v2 (copy)
    v4 = v1.convertTabsToSpaces(v1.removeControlChars(v4));
    local l_defaultLexer_0 = v3.defaultLexer;
    local v6 = v2.getColor("iden");
    local v7 = "";
    for v8, v9 in l_defaultLexer_0.scan(v4) do
        local v10 = v2.getColor(v8) or v6;
        v7 = v7 .. v2.getColoredRichText(v10, v1.sanitizeRichText(v9));
    end;
    return v7;
end;
v3.getTokenColor = function(v11) --[[ Line: 28 ]] --[[ Name: getTokenColor ]]
    -- upvalues: v2 (copy)
    return v2.getColor(v11);
end;
return v3;