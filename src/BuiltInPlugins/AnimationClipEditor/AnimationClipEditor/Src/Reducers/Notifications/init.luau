local l_script_FirstAncestor_0 = script:FindFirstAncestor("AnimationClipEditor");
local v1 = require(l_script_FirstAncestor_0.Packages.Rodux);
local v2 = require(l_script_FirstAncestor_0.Packages.Cryo);
local v3 = {
    QuantizeWarning = false, 
    Saved = false, 
    Loaded = false, 
    ClippedWarning = false, 
    InvalidAnimation = false, 
    CannotPasteError = false
};
return v1.createReducer(v3, {
    SetNotification = function(v4, v5) --[[ Line: 20 ]] --[[ Name: SetNotification ]]
        -- upvalues: v2 (copy)
        assert(v4[v5.notification] ~= nil, "Notification " .. v5.notification .. " does not exist in Notifications.");
        local v6 = v2.Dictionary.join(v4, {
            [v5.notification] = v5.value
        });
        if v5.notification == "Loaded" and v5.value then
            v6.Saved = false;
        end;
        return v6;
    end
});