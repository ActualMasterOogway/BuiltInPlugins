local l_script_FirstAncestor_0 = script:FindFirstAncestor("AvatarCompatibilityPreviewer");
local v1 = require(l_script_FirstAncestor_0.Packages.Framework);
local v2 = require(l_script_FirstAncestor_0.Packages.React);
local _ = require(l_script_FirstAncestor_0.Src.Types);
local v4 = require(l_script_FirstAncestor_0.Src.Components.SurveyDialog);
local _ = require(l_script_FirstAncestor_0.Src.Resources.Theme);
local v6 = require(l_script_FirstAncestor_0.Src.Hooks.useCreatedByAutoSetup);
local v7 = require(l_script_FirstAncestor_0.Src.Hooks.useSerializedState);
local v8 = require(l_script_FirstAncestor_0.Src.Hooks.useToggleState);
local v9 = require(l_script_FirstAncestor_0.Src.Util.Constants);
local v10 = require(l_script_FirstAncestor_0.Src.Util.findUnderlyingMeshAssetIds);
local l_Analytics_0 = v1.ContextServices.Analytics;
local l_Stylizer_0 = v1.ContextServices.Stylizer;
return function(v13) --[[ Line: 27 ]] --[[ Name: ContextualSurveyDialogButton ]]
    -- upvalues: l_Analytics_0 (copy), l_Stylizer_0 (copy), v6 (copy), v7 (copy), v9 (copy), v8 (copy), v2 (copy), v10 (copy), v4 (copy)
    local v14 = l_Analytics_0:use();
    local v15 = l_Stylizer_0:use("ContextualSurveyDialogButton");
    local v16 = v6(v13.Avatar.WorldModel);
    local v17, v18 = v7(v13.Avatar.WorldModel, "completedAutoSetupSurvey", false);
    local v19 = v7(v13.Avatar.WorldModel, v9.ATTRIBUTE_AUTO_SETUP_INPUT_ASSET, nil);
    local v20 = v8(false);
    local v22 = v2.useCallback(function(v21) --[[ Line: 40 ]]
        -- upvalues: v14 (copy), v10 (ref), v13 (copy), v19 (copy), v18 (copy)
        v14:report("sendAutoSetupSurvey", v21, v10(v13.Avatar.WorldModel), v19);
        v18(true);
    end, {});
    if not v16 then
        return nil;
    else
        return v2.createElement(v2.Fragment, {}, {
            SurveyDialog = v20.enabled and v2.createElement(v4, {
                close = v20.disable, 
                submitResults = v22
            }), 
            ContextualSurveyDialogButton = not v17 and v2.createElement("ImageButton", {
                AnchorPoint = Vector2.new(0, 1), 
                BackgroundTransparency = 1, 
                Image = v15.Image, 
                Position = v15.Position, 
                Size = v15.Size, 
                [v2.Event.Activated] = v20.enable
            })
        });
    end;
end;