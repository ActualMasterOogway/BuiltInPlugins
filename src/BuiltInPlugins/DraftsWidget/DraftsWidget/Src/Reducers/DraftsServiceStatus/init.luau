local l_Parent_0 = script.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Packages.Rodux);
local v2 = require(l_Parent_0.Packages.Cryo);
return (v1.createReducer({
    Enabled = nil, 
    Error = nil
}, {
    DraftsServiceLoaded = function(v3, v4) --[[ Line: 13 ]] --[[ Name: DraftsServiceLoaded ]]
        -- upvalues: v2 (copy)
        local l_isEnabled_0 = v4.isEnabled;
        local l_errorMessage_0 = v4.errorMessage;
        return v2.Dictionary.join(v3, {
            Enabled = l_isEnabled_0, 
            Error = l_errorMessage_0
        });
    end
}));