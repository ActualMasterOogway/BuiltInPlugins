local l_script_FirstAncestor_0 = script:FindFirstAncestor("AvatarCompatibilityPreviewer");
local v1 = require(l_script_FirstAncestor_0.Packages.React);
local v2 = require(l_script_FirstAncestor_0.Packages.Dev.ReactTestingLibrary);
return function(v3) --[[ Line: 7 ]] --[[ Name: renderTestHook ]]
    -- upvalues: v1 (copy), v2 (copy)
    local v4 = v1.createRef();
    v2.render(v1.createElement(function() --[[ Line: 10 ]] --[[ Name: TestComponent ]]
        -- upvalues: v4 (copy), v3 (copy)
        v4.current = table.pack(v3());
    end));
    return function() --[[ Line: 16 ]]
        -- upvalues: v4 (copy)
        return table.unpack(v4.current);
    end;
end;