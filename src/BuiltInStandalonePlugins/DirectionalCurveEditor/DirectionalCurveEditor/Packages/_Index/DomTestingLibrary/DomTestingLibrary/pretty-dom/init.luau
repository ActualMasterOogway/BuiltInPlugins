local l_Parent_0 = script.Parent.Parent;
local v1 = require(l_Parent_0.LuauPolyfill);
local l_Array_0 = v1.Array;
local l_Boolean_0 = v1.Boolean;
local l_Object_0 = v1.Object;
local l_console_0 = v1.console;
local v6 = require(script.Parent.jsHelpers.typeError);
local v7 = {};
local v8 = require(l_Parent_0.PrettyFormat);
local l_default_0 = require(script.Parent.DOMElementFilter).default;
local v10 = require(script.Parent["get-user-code-frame"]);
local l_getDocument_0 = require(script.Parent.helpers).getDocument;
local v12 = require(script.Parent["config-default-ignore"]);
local function _() --[[ Line: 22 ]] --[[ Name: inNode ]]
    return true;
end;
local function v16(v14) --[[ Line: 36 ]] --[[ Name: filterCommentsAndDefaultIgnoreTagsTags ]]
    -- upvalues: v12 (copy), l_Array_0 (copy)
    local v15 = v12.getIgnore();
    return not l_Array_0.includes(v15, v14.ClassName);
end;
local function v26(v17, v18, v19) --[[ Line: 44 ]] --[[ Name: prettyDOM ]]
    -- upvalues: l_getDocument_0 (copy), l_Boolean_0 (copy), v6 (copy), v16 (copy), l_Object_0 (copy), v8 (copy), l_default_0 (copy)
    local v20 = if v19 == nil then {} else v19;
    if not v17 then
        v17 = l_getDocument_0();
    end;
    if typeof(v18) ~= "number" then
        local l_DEBUG_PRINT_LIMIT_0 = _G.DEBUG_PRINT_LIMIT;
        v18 = l_Boolean_0.toJSBoolean(l_DEBUG_PRINT_LIMIT_0) and l_DEBUG_PRINT_LIMIT_0 or 7000;
    end;
    if v18 == 0 then
        return "";
    else
        local v22 = typeof(v17);
        if v22 ~= "Instance" then
            error(v6.new(("Expected an Instance but got %s"):format(v22)));
        end;
        local v23 = if v20.filterNode == nil then v16 else v20.filterNode;
        local v24 = l_Object_0.assign({}, v20, {
            filterNode = l_Object_0.None
        });
        local v25 = v8.format(v17, l_Object_0.assign({}, {
            plugins = {
                l_default_0(v23)
            }, 
            printFunctionName = false, 
            highlight = true
        }, v24));
        if v18 ~= nil and v18 < #v25 then
            return (("%s..."):format((string.sub(v25, 1, v18))));
        else
            return v25;
        end;
    end;
end;
local function v28(...) --[[ Line: 107 ]] --[[ Name: logDOM ]]
    -- upvalues: v10 (copy), l_Boolean_0 (copy), l_console_0 (copy), v26 (copy)
    local v27 = v10.getUserCodeFrame();
    if l_Boolean_0.toJSBoolean(v27) then
        l_console_0.log(("%s\n\n%s"):format(v26(...), v27));
        return;
    else
        l_console_0.log((v26(...)));
        return;
    end;
end;
v7.prettyDOM = v26;
v7.logDOM = v28;
v7.prettyFormat = v8;
return v7;