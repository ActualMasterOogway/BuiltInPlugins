local l_Parent_0 = script.Parent;
local l_Parent_1 = script:FindFirstAncestor("Foundation").Parent;
local v2 = require(l_Parent_0.TokensContext);
local _ = require(l_Parent_0.Tokens);
local v4 = require(l_Parent_1.React);
return function() --[[ Line: 10 ]] --[[ Name: useTokens ]]
    -- upvalues: v4 (copy), v2 (copy)
    return (v4.useContext(v2));
end;