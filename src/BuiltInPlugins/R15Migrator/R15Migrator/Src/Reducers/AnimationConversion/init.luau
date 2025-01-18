local l_script_FirstAncestor_0 = script:FindFirstAncestor("R15Migrator");
local v1 = require(l_script_FirstAncestor_0.Packages.Rodux);
local v2 = require(l_script_FirstAncestor_0.Packages.Cryo);
local l_AnimationConversion_0 = l_script_FirstAncestor_0.Src.Util.AnimationConversion;
local v4 = require(l_AnimationConversion_0.constants);
local function v5() --[[ Line: 7 ]] --[[ Name: getInitialState ]]
    -- upvalues: v2 (copy), v4 (copy)
    return {
        selection = {}, 
        previewSelection = v2.None, 
        previewSpeed = 1, 
        animations = {}, 
        status = v4.Status.NotStarted
    };
end;
return v1.createReducer(v5(), {
    SetSelection = function(v6, v7) --[[ Line: 18 ]] --[[ Name: SetSelection ]]
        -- upvalues: v2 (copy)
        return v2.Dictionary.join(v6, {
            selection = v7.selection
        });
    end, 
    SetPreviewSelection = function(v8, v9) --[[ Line: 23 ]] --[[ Name: SetPreviewSelection ]]
        -- upvalues: v2 (copy)
        return v2.Dictionary.join(v8, {
            previewSelection = if v9.previewSelection then v9.previewSelection else v2.None
        });
    end, 
    SetPreviewSpeed = function(v10, v11) --[[ Line: 28 ]] --[[ Name: SetPreviewSpeed ]]
        -- upvalues: v2 (copy)
        return v2.Dictionary.join(v10, {
            previewSpeed = v11.previewSpeed
        });
    end, 
    SetAnimation = function(v12, v13) --[[ Line: 33 ]] --[[ Name: SetAnimation ]]
        -- upvalues: v2 (copy)
        return v2.Dictionary.join(v12, {
            animations = v2.Dictionary.join(v12.animations, {
                [v13.id] = v13.animation
            })
        });
    end, 
    SetAnimations = function(v14, v15) --[[ Line: 40 ]] --[[ Name: SetAnimations ]]
        -- upvalues: v2 (copy)
        return v2.Dictionary.join(v14, {
            animations = v15.animations
        });
    end, 
    SetStatus = function(v16, v17) --[[ Line: 45 ]] --[[ Name: SetStatus ]]
        -- upvalues: v2 (copy)
        return v2.Dictionary.join(v16, {
            status = v17.status
        });
    end, 
    ResetAllAnimationConversion = function(v18) --[[ Line: 50 ]] --[[ Name: ResetAllAnimationConversion ]]
        -- upvalues: v2 (copy), v5 (copy)
        return v2.Dictionary.join(v18, (v5()));
    end
});