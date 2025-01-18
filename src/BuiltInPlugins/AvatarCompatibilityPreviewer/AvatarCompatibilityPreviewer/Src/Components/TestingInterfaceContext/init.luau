local l_script_FirstAncestor_0 = script:FindFirstAncestor("AvatarCompatibilityPreviewer");
local v1 = require(l_script_FirstAncestor_0.Packages.React);
local _ = require(l_script_FirstAncestor_0.Src.Util.Signal);
local v3 = {
    onIsColorableAcquired = nil, 
    onRepresentEditorStateOnWorldModelDescriptionApplied = nil, 
    onRepresentEditorStateOnWorldModelUnmounted = nil
};
return {
    Context = v1.createContext(v3)
};