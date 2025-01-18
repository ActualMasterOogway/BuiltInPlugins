local l_Parent_0 = script.Parent;
local l_script_FirstAncestor_0 = script:FindFirstAncestor("Foundation");
local l_Parent_1 = l_script_FirstAncestor_0.Parent;
local v3 = require(l_script_FirstAncestor_0.Utility.Flags);
local v4 = require(l_script_FirstAncestor_0.Utility.getFormattedTags);
local v5 = require(l_Parent_0.TagsContext);
local v6 = require(l_Parent_1.React);
local _ = require(l_script_FirstAncestor_0.Components.Types);
return function(v8) --[[ Line: 13 ]] --[[ Name: useStyleTags ]]
    -- upvalues: v4 (copy), v3 (copy), v6 (copy), v5 (copy)
    local v9 = v4(v8);
    if v3.FoundationStylingPolyfill then
        return v9;
    else
        local v10 = v6.useContext(v5);
        v6.useLayoutEffect(function() --[[ Line: 21 ]]
            -- upvalues: v9 (copy), v10 (copy)
            if v9 ~= nil then
                v10(v9);
            end;
        end, {
            v9
        });
        return v9;
    end;
end;