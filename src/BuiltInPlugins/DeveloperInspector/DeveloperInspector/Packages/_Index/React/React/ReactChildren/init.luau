local l_Parent_0 = script.Parent.Parent;
local l_invariant_0 = require(l_Parent_0.Shared).invariant;
local l_isValidElement_0 = require(script.Parent.ReactElement).isValidElement;
return {
    only = function(v3) --[[ Line: 316 ]] --[[ Name: onlyChild ]]
        -- upvalues: l_invariant_0 (copy), l_isValidElement_0 (copy)
        l_invariant_0(l_isValidElement_0(v3), "React.Children.only expected to receive a single React element child.");
        return v3;
    end
};