local l_Parent_0 = script.Parent.Parent.Parent;
local v1 = require(l_Parent_0.LuauPolyfill);
local l_Array_0 = v1.Array;
local l_Object_0 = v1.Object;
local l_Symbol_0 = v1.Symbol;
local v5 = {};
local _ = require(script.Parent.Parent.Types);
local v7 = require(script.Parent.lib.markup);
local l_printChildren_0 = v7.printChildren;
local l_printElement_0 = v7.printElement;
local l_printElementAsLeaf_0 = v7.printElementAsLeaf;
local l_printProps_0 = v7.printProps;
local v12 = l_Symbol_0.for_("react.test.json");
local function v16(v13) --[[ Line: 47 ]] --[[ Name: getPropKeys ]]
    -- upvalues: l_Array_0 (copy), l_Object_0 (copy)
    local l_props_0 = v13.props;
    if l_props_0 ~= nil then
        return (l_Array_0.sort(l_Array_0.filter(l_Object_0.keys(l_props_0), function(v15) --[[ Line: 51 ]]
            -- upvalues: l_props_0 (copy)
            return l_props_0[v15] ~= nil;
        end)));
    else
        return {};
    end;
end;
local function v23(v17, v18, v19, v20, v21, v22) --[[ Line: 58 ]] --[[ Name: serialize ]]
    -- upvalues: l_printElementAsLeaf_0 (copy), l_printElement_0 (copy), l_printProps_0 (copy), v16 (copy), l_printChildren_0 (copy)
    v20 = v20 + 1;
    if v18.maxDepth < v20 then
        return (l_printElementAsLeaf_0(v17.type, v18));
    else
        return (l_printElement_0(v17.type, if v17.props ~= nil then l_printProps_0(v16(v17), v17.props, v18, v19 .. v18.indent, v20, v21, v22) else "", if v17.children ~= nil then l_printChildren_0(v17.children, v18, v19 .. v18.indent, v20, v21, v22) else "", v18, v19));
    end;
end;
v5.serialize = v23;
local function v26(v24) --[[ Line: 92 ]] --[[ Name: test ]]
    -- upvalues: v12 (copy)
    local v25 = false;
    if typeof(v24) == "table" then
        v25 = v24["$$typeof"] == v12;
    end;
    return v25;
end;
v5.test = v26;
v5.default = {
    serialize = v23, 
    test = v26
};
return v5;