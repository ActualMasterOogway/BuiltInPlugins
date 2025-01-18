local l_Parent_0 = script.Parent.Parent.Parent.Parent;
local l_Object_0 = require(l_Parent_0.LuauPolyfill).Object;
local l_afterEach_0 = require(l_Parent_0.JestGlobals).afterEach;
local v3 = require(script.Parent.Parent.Parent.jsHelpers.document);
local v4 = {};
local l_getQueriesForElement_0 = require(script.Parent.Parent.Parent["get-queries-for-element"]).getQueriesForElement;
local function v6(v7, v8) --[[ Line: 16 ]] --[[ Name: render ]]
    -- upvalues: v3 (copy), l_getQueriesForElement_0 (copy), v6 (copy), l_Object_0 (copy)
    local v9 = if v8 == nil then {} else v8;
    local v10 = nil;
    if v9.container == nil then
        v10 = Instance.new("Frame");
        v10.Parent = v3;
    else
        v10 = v9.container;
    end;
    v10:ClearAllChildren();
    for v11 = 1, #v7 do
        v7[v11].Parent = v10;
    end;
    local v12 = l_getQueriesForElement_0(v10);
    local function v14(v13) --[[ Line: 34 ]] --[[ Name: rerender ]]
        -- upvalues: v6 (ref), v10 (ref)
        return v6(v13, {
            container = v10
        });
    end;
    return l_Object_0.assign({}, {
        container = v10, 
        rerender = v14
    }, v12);
end;
local function v16(v15) --[[ Line: 40 ]] --[[ Name: renderIntoDocument ]]
    -- upvalues: v6 (copy), v3 (copy)
    return v6(v15, {
        container = v3
    });
end;
local function v17() --[[ Line: 46 ]] --[[ Name: cleanup ]]
    -- upvalues: v3 (copy)
    v3:ClearAllChildren();
end;
l_afterEach_0(v17);
v4.render = v6;
v4.renderIntoDocument = v16;
v4.cleanup = v17;
return v4;