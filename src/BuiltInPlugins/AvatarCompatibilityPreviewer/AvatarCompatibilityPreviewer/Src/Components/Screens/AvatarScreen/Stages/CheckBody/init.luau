local l_script_FirstAncestor_0 = script:FindFirstAncestor("AvatarCompatibilityPreviewer");
local v1 = require(l_script_FirstAncestor_0.Packages.React);
local v2 = require(l_script_FirstAncestor_0.Src.Components.AnimationController);
local v3 = require(l_script_FirstAncestor_0.Src.Components.EquippedItemsSidebar);
local _ = require(script.Parent.StageType);
local v5 = require(l_script_FirstAncestor_0.Src.Util.Constants);
local v6 = require(l_script_FirstAncestor_0.Src.Util.EquipmentStateContext);
local _ = require(l_script_FirstAncestor_0.Src.Types);
local v8 = require(l_script_FirstAncestor_0.Src.Hooks.useOnClothingLayerOrderChanged);
local v9 = require(l_script_FirstAncestor_0.Src.Flags.getFFlagAvatarPreviewerAdjustCameraScale);
return {
    tabs = {
        "animations", 
        "clothing", 
        "accessories", 
        "body"
    }, 
    render = function(v10) --[[ Line: 18 ]] --[[ Name: CheckBodyComponent ]]
        -- upvalues: v1 (copy), v6 (copy), v8 (copy), v5 (copy), v3 (copy), v2 (copy)
        local l_avatarAssets_0 = v1.useContext(v6).avatarAssets;
        local v12 = v8();
        if v10.Dummy == nil then
            return nil;
        else
            assert(v10.Dummy, v5.LUAU_ANALYZE_ERROR);
            return v1.createElement(v1.Fragment, {}, {
                EquippedItemsSidebar = v1.createElement(v3, {
                    OnClothingLayerOrderChanged = v12
                }), 
                AnimationController = l_avatarAssets_0.animation and v1.createElement(v2, {
                    Dummy = v10.Dummy, 
                    AnimationId = l_avatarAssets_0.animation
                })
            });
        end;
    end, 
    getPreviewCameraModifications = function(v13) --[[ Line: 55 ]] --[[ Name: getPreviewCameraModifications ]]
        -- upvalues: v9 (copy)
        return {
            focus = if v9() then v13.PrimaryPart.CFrame else nil, 
            fov = 50
        };
    end
};