local l_script_FirstAncestor_0 = script:FindFirstAncestor("AvatarCompatibilityPreviewer");
local v1 = require(l_script_FirstAncestor_0.Packages.Framework);
local v2 = require(l_script_FirstAncestor_0.Packages.React);
local v3 = require(l_script_FirstAncestor_0.Src.Components.AnimationController);
local v4 = require(l_script_FirstAncestor_0.Src.Components.EquippedItemsSidebar);
local v5 = require(l_script_FirstAncestor_0.Src.Components.Notice);
local v6 = require(l_script_FirstAncestor_0.Src.Hooks.useOnClothingLayerOrderChanged);
local v7 = require(l_script_FirstAncestor_0.Src.Util.Constants);
local v8 = require(l_script_FirstAncestor_0.Src.Util.EquipmentStateContext);
local _ = require(script.Parent.StageType);
local l_Localization_0 = v1.ContextServices.Localization;
return {
    tabs = {
        "animations_face", 
        "accessories_face"
    }, 
    render = function(v11) --[[ Line: 26 ]] --[[ Name: render ]]
        -- upvalues: l_Localization_0 (copy), v2 (copy), v8 (copy), v6 (copy), v7 (copy), v5 (copy), v3 (copy), v4 (copy)
        local v12 = l_Localization_0:use();
        local v13 = v2.useContext(v8);
        local v14 = v6();
        if v11.Dummy == nil then
            return nil;
        else
            assert(v11.Dummy ~= nil, v7.LUAU_ANALYZE_ERROR);
            local v15 = if v11.Dummy.Head:FindFirstChildWhichIsA("FaceControls") == nil and v11.SelectedTab == "animations_face" then v2.createElement(v5, {
                key = "Notice", 
                Text = v12:getText("CheckFace", "DynamicHeadNotice")
            }) else if v13.avatarAssets.emotion ~= nil then v2.createElement(v3, {
                key = "AnimationController", 
                Dummy = v11.Dummy, 
                AnimationId = v13.avatarAssets.emotion
            }) else nil;
            return v2.createElement(v2.Fragment, {}, {
                EquippedItemsSidebar = v2.createElement(v4, {
                    OnClothingLayerOrderChanged = v14
                }); 
                v15
            });
        end;
    end, 
    getPreviewCameraModifications = function(v16) --[[ Line: 63 ]] --[[ Name: getPreviewCameraModifications ]]
        local l_Head_0 = v16.Head;
        return {
            focus = CFrame.new(l_Head_0.Position), 
            cframe = CFrame.lookAt(l_Head_0.Position + l_Head_0.Size.Magnitude * l_Head_0.CFrame.LookVector * 2 - l_Head_0.Size.Magnitude * l_Head_0.CFrame.RightVector * 1, l_Head_0.Position), 
            fov = 35
        };
    end
};