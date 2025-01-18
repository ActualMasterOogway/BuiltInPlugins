local l_Parent_0 = script:FindFirstAncestor("ReactTestingUtils").Parent;
local v1 = require(l_Parent_0.React);
local l_render_0 = require(l_Parent_0.ReactTestingLibrary).render;
return function(v3, v4) --[[ Line: 15 ]] --[[ Name: renderTestHook ]]
    -- upvalues: v1 (copy), l_render_0 (copy)
    local v5 = v1.createRef();
    l_render_0(v1.createElement(function() --[[ Line: 18 ]] --[[ Name: TestComponent ]]
        -- upvalues: v5 (copy), v3 (copy)
        v5.current = table.pack(v3());
    end), {
        wrapper = if v4 then v4.wrapper else nil
    });
    return function() --[[ Line: 26 ]]
        -- upvalues: v5 (copy)
        return table.unpack(v5.current);
    end;
end;