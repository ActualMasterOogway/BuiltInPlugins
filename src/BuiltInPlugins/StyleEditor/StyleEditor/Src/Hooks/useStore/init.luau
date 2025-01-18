local l_Parent_0 = script.Parent.Parent.Parent;
local _ = require(l_Parent_0.Packages.Rodux);
local v2 = require(l_Parent_0.Packages.RoactRodux);
local l_useContext_0 = require(l_Parent_0.Packages.React).useContext;
return function() --[[ Line: 13 ]] --[[ Name: useStore ]]
    -- upvalues: l_useContext_0 (copy), v2 (copy)
    return (l_useContext_0(v2.StoreContext.Consumer));
end;