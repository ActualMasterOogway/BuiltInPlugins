local l_Parent_0 = script.Parent.Parent.Parent.Parent;
local v1 = require(l_Parent_0.LuauPolyfill);
local l_Array_0 = v1.Array;
local l_Boolean_0 = v1.Boolean;
local v4 = {};
local _ = nil;
local _ = nil;
local v7 = nil;
local _ = nil;
local _ = nil;
local _ = nil;
local _ = require(script.Parent.Parent.Parent.Types);
local l_default_0 = require(script.Parent.escapeHTML).default;
local v13 = {
    comment = {
        close = "", 
        open = ""
    }, 
    content = {
        close = "", 
        open = ""
    }, 
    prop = {
        close = "", 
        open = ""
    }, 
    tag = {
        close = "", 
        open = ""
    }, 
    value = {
        close = "", 
        open = ""
    }
};
v4.printProps = function(v14, v15, v16, v17, v18, v19, v20) --[[ Line: 47 ]] --[[ Name: printProps ]]
    -- upvalues: v13 (copy), l_Array_0 (copy)
    local v21 = v17 .. v16.indent;
    local v22 = v16.colors or v13;
    return l_Array_0.join(l_Array_0.map(v14, function(v23) --[[ Line: 61 ]]
        -- upvalues: v15 (copy), v20 (copy), v16 (copy), v21 (copy), v18 (copy), v19 (copy), v17 (copy), v22 (copy)
        local v24 = v15[v23];
        local v25 = v20(v24, v16, v21, v18, v19);
        if typeof(v24) ~= "string" then
            if string.find(v25, "\n") ~= nil then
                v25 = v16.spacingOuter .. v21 .. v25 .. v16.spacingOuter .. v17;
            end;
            v25 = "{" .. v25 .. "}";
        end;
        local v26 = if typeof(v23) == "table" then if v23.name then v23.name else v20(v23, v16, v21, v18, v19) else v23;
        return v16.spacingInner .. v17 .. v22.prop.open .. v22.prop.open .. v26 .. v22.prop.close .. "=" .. v22.value.open .. v25 .. v22.value.close .. v22.value.close;
    end), "");
end;
v4.printChildren = function(v27, v28, v29, v30, v31, v32) --[[ Line: 95 ]] --[[ Name: printChildren ]]
    -- upvalues: l_Array_0 (copy), v7 (ref)
    return l_Array_0.join(l_Array_0.map(v27, function(v33) --[[ Line: 104 ]]
        -- upvalues: v28 (copy), v29 (copy), v7 (ref), v32 (copy), v30 (copy), v31 (copy)
        return v28.spacingOuter .. v29 .. if typeof(v33) == "string" then v7(v33, v28) else v32(v33, v28, v29, v30, v31);
    end), "");
end;
v7 = function(v34, v35) --[[ Line: 116 ]] --[[ Name: printText ]]
    -- upvalues: v13 (copy), l_default_0 (copy)
    local l_content_0 = (v35.colors or v13).content;
    return l_content_0.open .. l_default_0(v34) .. l_content_0.close;
end;
v4.printText = v7;
v4.printComment = function(v37, v38) --[[ Line: 125 ]] --[[ Name: printComment ]]
    -- upvalues: v13 (copy), l_default_0 (copy)
    local l_comment_0 = (v38.colors or v13).comment;
    return l_comment_0.open .. "<!--" .. l_default_0(v37) .. "-->" .. l_comment_0.close;
end;
v4.printElement = function(v40, v41, v42, v43, v44) --[[ Line: 138 ]] --[[ Name: printElement ]]
    -- upvalues: v13 (copy), l_Boolean_0 (copy)
    local l_tag_0 = (v43.colors or v13).tag;
    return l_tag_0.open .. "<" .. v40 .. (if l_Boolean_0.toJSBoolean(v41) then l_tag_0.close .. v41 .. v43.spacingOuter .. v44 .. l_tag_0.open else v41) .. (if l_Boolean_0.toJSBoolean(v42) then ">" .. l_tag_0.close .. v42 .. v43.spacingOuter .. v44 .. l_tag_0.open .. "</" .. v40 else ((not l_Boolean_0.toJSBoolean(v41) or l_Boolean_0.toJSBoolean(v43.min)) and " " or "") .. "/") .. ">" .. l_tag_0.close;
end;
v4.printElementAsLeaf = function(v46, v47) --[[ Line: 171 ]] --[[ Name: printElementAsLeaf ]]
    -- upvalues: v13 (copy)
    local l_tag_1 = (v47.colors or v13).tag;
    return l_tag_1.open .. "<" .. v46 .. l_tag_1.close .. " \226\128\166" .. l_tag_1.open .. " />" .. l_tag_1.close;
end;
return v4;