local l_script_FirstAncestor_0 = script:FindFirstAncestor("AvatarCompatibilityPreviewer");
local v1 = require(l_script_FirstAncestor_0.Packages.React);
local _ = require(l_script_FirstAncestor_0.Src.Components.Screens.AvatarScreen.Stages.StageType);
local v3 = require(l_script_FirstAncestor_0.Src.Components.TestingInterfaceContext);
local _ = require(l_script_FirstAncestor_0.Src.Types);
local v5 = require(l_script_FirstAncestor_0.Src.Util.createUnimplemented);
local v6 = require(l_script_FirstAncestor_0.Src.Util.skinToneAvailableAsync);
local v7 = require(l_script_FirstAncestor_0.Src.Hooks.useAsync);
local v8 = require(l_script_FirstAncestor_0.Src.Hooks.useIncrementedState);
local v9 = {
    openPalette = v5("openPalette"), 
    focusedAttachments = {}, 
    setFocusedAttachments = v5("setFocusedAttachments"), 
    dummyPreviewLocked = false, 
    incrementDummyPreviewLock = v5("incrementDummyPreviewLock"), 
    decrementDummyPreviewLock = v5("decrementDummyPreviewLock"), 
    resetCamera = function() --[[ Line: 40 ]] --[[ Name: resetCamera ]]

    end, 
    stage = {}, 
    isColorable = true
};
local v10 = v1.createContext(v9);
return {
    Context = v10, 
    Provider = function(v11) --[[ Line: 48 ]] --[[ Name: Provider ]]
        -- upvalues: v1 (copy), v3 (copy), v8 (copy), v7 (copy), v6 (copy), v10 (copy)
        local v12 = v1.useContext(v3.Context);
        local v13, v14 = v1.useState({});
        local v15 = v8();
        local v17 = v7(function() --[[ Line: 63 ]]
            -- upvalues: v6 (ref), v11 (copy), v12 (copy)
            local v16 = v6(v11.selectedAvatar);
            if v12.onIsColorableAcquired ~= nil then
                task.defer(function() --[[ Line: 67 ]]
                    -- upvalues: v12 (ref)
                    v12.onIsColorableAcquired:Fire();
                end);
            end;
            return v16;
        end, {
            v11.selectedAvatar, 
            v12.onIsColorableAcquired
        });
        local v18 = {
            openPalette = v11.openPalette, 
            focusedAttachments = v13, 
            setFocusedAttachments = v14, 
            dummyPreviewLocked = v15.amount > 0, 
            incrementDummyPreviewLock = v15.increment, 
            decrementDummyPreviewLock = v15.decrement, 
            resetCamera = v11.resetCamera, 
            stage = v11.stage, 
            isColorable = v17.state ~= "ok" or v17.value
        };
        return v1.createElement(v10.Provider, {
            value = v18
        }, v11.children);
    end
};