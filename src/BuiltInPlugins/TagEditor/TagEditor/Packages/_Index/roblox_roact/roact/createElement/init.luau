local v0 = require(script.Parent.PropMarkers.Children);
local v1 = require(script.Parent.ElementKind);
local v2 = require(script.Parent.Logging);
local v3 = require(script.Parent.Type);
local v4 = require(script.Parent.GlobalConfig).get();
return function(v5, v6, v7) --[[ Line: 37 ]] --[[ Name: createElement ]]
    -- upvalues: v4 (copy), v0 (copy), v2 (copy), v1 (copy), v3 (copy)
    if v4.typeChecks then
        assert(v5 ~= nil, "`component` is required");
        local v8 = true;
        if typeof(v6) ~= "table" then
            v8 = v6 == nil;
        end;
        assert(v8, "`props` must be a table or nil");
        v8 = true;
        if typeof(v7) ~= "table" then
            v8 = v7 == nil;
        end;
        assert(v8, "`children` must be a table or nil");
    end;
    if v6 == nil then
        v6 = {};
    end;
    if v7 ~= nil then
        if v6[v0] ~= nil then
            v2.warnOnce("The prop `Roact.Children` was defined but was overriden by the third parameter to createElement!\nThis can happen when a component passes props through to a child element but also uses the `children` argument:\n\n\tRoact.createElement(\"Frame\", passedProps, {\n\t\tchild = ...\n\t})\n\nInstead, consider using a utility function to merge tables of children together:\n\n\tlocal children = mergeTables(passedProps[Roact.Children], {\n\t\tchild = ...\n\t})\n\n\tlocal fullProps = mergeTables(passedProps, {\n\t\t[Roact.Children] = children\n\t})\n\n\tRoact.createElement(\"Frame\", fullProps)");
        end;
        v6[v0] = v7;
    end;
    local v9 = v1.fromComponent(v5);
    local v10 = {
        [v3] = v3.Element, 
        [v1] = v9, 
        component = v5, 
        props = v6
    };
    if v4.elementTracing then
        v10.source = debug.traceback("", 2):sub(2);
    end;
    return v10;
end;