local l_script_FirstAncestor_0 = script:FindFirstAncestor("Foundation");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.React);
local v3 = require(l_script_FirstAncestor_0.Utility.Logger);
local _ = require(l_script_FirstAncestor_0.Enums.CursorType);
return (v2.createContext({
    refCache = {}, 
    setMountedCursors = function(_) --[[ Line: 11 ]] --[[ Name: setMountedCursors ]]
        -- upvalues: v3 (copy)
        v3:warning("No Cursor Provider found");
    end
}));