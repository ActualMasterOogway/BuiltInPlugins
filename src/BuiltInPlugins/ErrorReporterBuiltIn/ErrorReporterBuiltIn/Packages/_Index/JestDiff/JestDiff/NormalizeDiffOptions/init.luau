local l_Parent_0 = script.Parent;
local l_Parent_1 = l_Parent_0.Parent;
local l_Number_0 = require(l_Parent_1.LuauPolyfill).Number;
local v3 = require(l_Parent_1.ChalkLua);
local _ = require(l_Parent_0.types);
local function v6(v5) --[[ Line: 20 ]] --[[ Name: noColor ]]
    return v5;
end;
local v7 = {
    aAnnotation = "Expected", 
    aColor = v3.green, 
    aIndicator = "-", 
    bAnnotation = "Received", 
    bColor = v3.red, 
    bIndicator = "+", 
    changeColor = v3.inverse, 
    changeLineTrailingSpaceColor = v6, 
    commonColor = v3.dim, 
    commonIndicator = " ", 
    commonLineTrailingSpaceColor = v6, 
    contextLines = 5, 
    emptyFirstOrLastLinePlaceholder = "", 
    expand = true, 
    includeChangeCounts = false, 
    omitAnnotationLines = false, 
    patchColor = v3.yellow
};
local function _(v8) --[[ Line: 48 ]] --[[ Name: getContextLines ]]
    -- upvalues: l_Number_0 (copy)
    if typeof(v8) == "number" and l_Number_0.isSafeInteger(v8) and v8 >= 0 then
        return v8;
    else
        return 5;
    end;
end;
return {
    noColor = v6, 
    normalizeDiffOptions = function(v10) --[[ Line: 59 ]] --[[ Name: normalizeDiffOptions ]]
        -- upvalues: v7 (copy), l_Number_0 (copy)
        local v11 = {};
        for v12, v13 in pairs(v7) do
            v11[v12] = v13;
        end;
        if typeof(v10) == "table" then
            for v14, v15 in pairs(v10) do
                v11[v14] = v15;
            end;
            local l_contextLines_0 = v10.contextLines;
            v11.contextLines = if typeof(l_contextLines_0) == "number" and l_Number_0.isSafeInteger(l_contextLines_0) and l_contextLines_0 >= 0 then l_contextLines_0 else 5;
        end;
        return v11;
    end
};