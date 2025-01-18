local l_Parent_0 = script.Parent.Parent;
local v1 = require(l_Parent_0.LuauPolyfill);
local l_Array_0 = v1.Array;
local l_Boolean_0 = v1.Boolean;
local l_Object_0 = v1.Object;
local l_console_0 = v1.console;
local v6 = require(l_Parent_0.LuauRegExp);
local l_getNodeTestId_0 = require(script.Parent["get-node-test-id"]).getNodeTestId;
local _ = require(script.Parent.types.suggestions);
local v9 = {};
local l_getDefaultNormalizer_0 = require(script.Parent.matches).getDefaultNormalizer;
local l_getNodeText_0 = require(script.Parent["get-node-text"]).getNodeText;
local l_getConfig_0 = require(script.Parent.config).getConfig;
local v13 = l_getDefaultNormalizer_0();
local function _(v14) --[[ Line: 33 ]] --[[ Name: escapeRegExp ]]
    return (v14:gsub("([\\%.%*%+\\%-%?%^%${}%(%)|%[%]])", "\\%1"));
end;
local function _(v16) --[[ Line: 38 ]] --[[ Name: getRegExpMatcher ]]
    -- upvalues: v6 (copy)
    return v6((v16:lower():gsub("([\\%.%*%+\\%-%?%^%${}%(%)|%[%]])", "\\%1")));
end;
local function v32(v18, _, v20, v21) --[[ Line: 42 ]] --[[ Name: makeSuggestion ]]
    -- upvalues: l_Array_0 (copy), v6 (copy), l_Boolean_0 (copy), l_Object_0 (copy), l_console_0 (copy)
    local l_variant_0 = v21.variant;
    local l_name_0 = v21.name;
    local v24 = {};
    local v25 = {
        if l_Array_0.includes({
            "Role", 
            "TestId"
        }, v18) then v20 else v6((v20:lower():gsub("([\\%.%*%+\\%-%?%^%${}%(%)|%[%]])", "\\%1")))
    };
    if l_Boolean_0.toJSBoolean(l_name_0) then
        v24.name = v6((l_name_0:lower():gsub("([\\%.%*%+\\%-%?%^%${}%(%)|%[%]])", "\\%1")));
    end;
    if #l_Object_0.keys(v24) > 0 then
        table.insert(v25, v24);
    end;
    local v26 = ("%sBy%s"):format(l_variant_0, v18);
    return {
        queryName = v18, 
        queryMethod = v26, 
        queryArgs = v25, 
        variant = l_variant_0, 
        warning = "", 
        toString = function() --[[ Line: 77 ]] --[[ Name: toString ]]
            -- upvalues: l_Boolean_0 (ref), l_console_0 (ref), v25 (copy), l_Array_0 (ref), l_Object_0 (ref), v26 (copy)
            if l_Boolean_0.toJSBoolean("") then
                l_console_0.warn("");
            end;
            local v27, v28 = table.unpack(v25, 1, 2);
            if typeof(v27) == "string" then
                v27 = ("'%s'"):format(v27);
            end;
            v28 = if v28 ~= nil then (", { %s }"):format(l_Array_0.join(l_Array_0.map(l_Object_0.entries(v28), function(v29) --[[ Line: 85 ]]
                local v30, v31 = table.unpack(v29, 1, 2);
                return ("%s: %s"):format(tostring(v30), (tostring(v31)));
            end), ", ")) else "";
            return ("%s(%s%s)"):format(v26, tostring(v27), (tostring(v28)));
        end
    };
end;
local function _(v33, v34, v35) --[[ Line: 97 ]] --[[ Name: canSuggest ]]
    -- upvalues: l_Boolean_0 (copy)
    local v36;
    if l_Boolean_0.toJSBoolean(v35) then
        v36 = not l_Boolean_0.toJSBoolean(v34);
        if not v36 then
            return v34:lower() == v33:lower();
        end;
    else
        v36 = false;
    end;
    return v36;
end;
v9.getSuggestedQuery = function(v38, v39, v40) --[[ Line: 103 ]] --[[ Name: getSuggestedQuery ]]
    -- upvalues: l_Array_0 (copy), l_getConfig_0 (copy), l_Boolean_0 (copy), v32 (copy), v13 (copy), l_getNodeText_0 (copy), l_getNodeTestId_0 (copy)
    local v41 = v39 == nil and "get" or v39;
    if l_Array_0.includes(l_getConfig_0().defaultIgnore, v38.ClassName) then
        return nil;
    else
        local l_status_0, l_result_0 = pcall(function() --[[ Line: 137 ]]
            -- upvalues: v38 (copy)
            return v38.PlaceholderText;
        end);
        if l_status_0 and if l_Boolean_0.toJSBoolean(l_result_0) then not l_Boolean_0.toJSBoolean(v40) or v40:lower() == ("PlaceholderText"):lower() else false then
            return (v32("PlaceholderText", v38, l_result_0, {
                variant = v41
            }));
        else
            local v44 = v13(l_getNodeText_0(v38));
            if if l_Boolean_0.toJSBoolean(v44) then not l_Boolean_0.toJSBoolean(v40) or v40:lower() == ("Text"):lower() else false then
                return (v32("Text", v38, v44, {
                    variant = v41
                }));
            else
                local l_status_1, l_result_1 = pcall(function() --[[ Line: 147 ]]
                    -- upvalues: v38 (copy)
                    return v38.Text;
                end);
                if l_status_1 and if l_Boolean_0.toJSBoolean(l_result_1) then not l_Boolean_0.toJSBoolean(v40) or v40:lower() == ("DisplayValue"):lower() else false then
                    return (v32("DisplayValue", v38, v13(l_result_1), {
                        variant = v41
                    }));
                else
                    local v47 = l_getNodeTestId_0(v38);
                    if v47 and if l_Boolean_0.toJSBoolean(v47) then not l_Boolean_0.toJSBoolean(v40) or v40:lower() == ("TestId"):lower() else false then
                        return (v32("TestId", v38, v47, {
                            variant = v41
                        }));
                    else
                        return nil;
                    end;
                end;
            end;
        end;
    end;
end;
return v9;