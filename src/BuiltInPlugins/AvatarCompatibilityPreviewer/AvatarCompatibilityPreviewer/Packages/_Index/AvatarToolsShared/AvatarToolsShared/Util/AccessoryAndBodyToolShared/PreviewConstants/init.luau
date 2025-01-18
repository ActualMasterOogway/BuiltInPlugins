local _ = script.Parent.Parent.Parent;
local v1 = require(script.Parent.ItemCharacteristics);
local v2 = require(script.Parent.Constants);
local v3 = {
    Avatars = "TAB_KEY_Avatars", 
    Clothing = "TAB_KEY_Clothing", 
    Animations = "TAB_KEY_Animations", 
    None = "TAB_KEY_None"
};
local v7 = {
    [v3.Avatars] = {
        BundleIds = {
            109, 
            511, 
            800, 
            429, 
            982, 
            986, 
            988
        }, 
        CanAddNew = true, 
        PanelBlockerLocalizationKey = "PanelBlockerAddAvatar", 
        InvalidAddLocalizationKey = "AvatarInvalidAdd", 
        IsSelectedInstanceValid = function(v4) --[[ Line: 32 ]] --[[ Name: IsSelectedInstanceValid ]]
            -- upvalues: v1 (copy)
            return v1.isFullyCagedCharacter(v4);
        end, 
        IsMultiSelect = true, 
        LayoutOrder = 1, 
        LocalizationKey = v2.LOCALIZATION_KEYS.Avatars
    }, 
    [v3.Clothing] = {
        AssetIds = {
            7178735702, 
            7178744611, 
            7178740556, 
            6984769289, 
            7192543873, 
            7192532009, 
            6984765766, 
            7192690731, 
            7192695838, 
            6984740059, 
            7192668209, 
            7192683061, 
            7192686536, 
            7192843096, 
            7192846003, 
            7193168012, 
            7193169059, 
            7193442167, 
            7193450455, 
            7193397693
        }, 
        CanAddNew = true, 
        PanelBlockerLocalizationKey = "PanelBlockerAddClothing", 
        InvalidAddLocalizationKey = "ClothingInvalidAdd", 
        IsSelectedInstanceValid = function(v5) --[[ Line: 67 ]] --[[ Name: IsSelectedInstanceValid ]]
            -- upvalues: v1 (copy)
            return v1.isFullyCagedClothing(v5);
        end, 
        IsMultiSelect = true, 
        LayoutOrder = 2, 
        LocalizationKey = v2.LOCALIZATION_KEYS.Clothing
    }, 
    [v3.Animations] = {
        AssetIds = {
            11581814132, 
            2510235063, 
            2510242378, 
            2510238627, 
            4849499887, 
            3823158750, 
            3716636630, 
            3576717965, 
            4689362868
        }, 
        CanAddNew = true, 
        PanelBlockerLocalizationKey = "PanelBlockerAddAnimation", 
        InvalidAddLocalizationKey = "AnimationInvalidAdd", 
        IsSelectedInstanceValid = function(v6) --[[ Line: 91 ]] --[[ Name: IsSelectedInstanceValid ]]
            return v6:IsA("AnimationClip");
        end, 
        IsMultiSelect = false, 
        LayoutOrder = 3, 
        LocalizationKey = v2.LOCALIZATION_KEYS.Animations
    }
};
local v8 = {
    [11581814132] = 11581512087, 
    [2510235063] = 10921258489, 
    [2510242378] = 10921269718, 
    [2510238627] = 10921261968, 
    [4849499887] = 4841405708, 
    [3823158750] = 3337994105, 
    [3716636630] = 3333499508, 
    [3576717965] = 3337978742, 
    [4689362868] = 4686925579
};
local v9 = {
    Default = "Default", 
    Custom = "Custom"
};
return {
    TABS_INFO = v7, 
    TABS_KEYS = v3, 
    AnimationIdToSequenceId = v8, 
    PreviewAvatarName = "PreviewAvatar", 
    CategoryPrefixes = v9
};