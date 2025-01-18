local l_script_FirstAncestor_0 = script:FindFirstAncestor("R15Migrator");
local v1 = require(l_script_FirstAncestor_0.Packages.Framework);
local v2 = require(l_script_FirstAncestor_0.Packages.Roact);
local v3 = require(l_script_FirstAncestor_0.Packages.RoactRodux);
local l_UI_0 = v1.UI;
local l_Pane_0 = l_UI_0.Pane;
local l_Button_0 = l_UI_0.Button;
local l_Util_0 = v1.Util;
local _ = l_Util_0.StyleModifier;
local l_LayoutOrderIterator_0 = l_Util_0.LayoutOrderIterator;
local l_ContextServices_0 = v1.ContextServices;
local v11 = require(l_script_FirstAncestor_0.Src.Contexts.ScriptConversionContext);
local l_AnimationConversion_0 = l_script_FirstAncestor_0.Src.Util.AnimationConversion;
local _ = require(l_AnimationConversion_0.AnimationConversionManager);
local _ = require(l_AnimationConversion_0.constants).AssetType;
local l_Thunks_0 = l_script_FirstAncestor_0.Src.Thunks;
local v16 = require(l_Thunks_0.ConvertAnimation);
local v17 = require(l_Thunks_0.UploadTestAnimations);
local v18 = require(l_Thunks_0.RevertAnimation);
local v19 = v2.PureComponent:extend("ReplaceRevertButtons");
v19.render = function(v20) --[[ Line: 28 ]] --[[ Name: render ]]
    -- upvalues: l_LayoutOrderIterator_0 (copy), v2 (copy), l_Pane_0 (copy), l_Button_0 (copy)
    local l_props_0 = v20.props;
    local _ = l_props_0.selection;
    local l_Stylizer_0 = l_props_0.Stylizer;
    local l_Localization_0 = l_props_0.Localization;
    local v25 = l_LayoutOrderIterator_0.new();
    return v2.createElement(l_Pane_0, {
        Layout = Enum.FillDirection.Horizontal, 
        HorizontalAlignment = Enum.HorizontalAlignment.Right, 
        VerticalAlignment = Enum.VerticalAlignment.Top, 
        Spacing = l_Stylizer_0.Spacing, 
        AutomaticSize = Enum.AutomaticSize.XY
    }, {
        Revert = v2.createElement(l_Button_0, {
            Style = "Round", 
            Text = l_Localization_0:getText("AnimationConversion", "Revert"), 
            Size = l_Stylizer_0.ButtonSize, 
            OnClick = function() --[[ Line: 47 ]] --[[ Name: OnClick ]]
                -- upvalues: v20 (copy), l_props_0 (copy)
                v20.props.revertAnimation(l_props_0.ScriptConversionContext);
            end, 
            LayoutOrder = v25:getNextOrder()
        }), 
        Replace = v2.createElement(l_Button_0, {
            Style = "RoundPrimary", 
            Text = l_Localization_0:getText("AnimationConversion", "Replace"), 
            Size = l_Stylizer_0.ButtonSize, 
            OnClick = function() --[[ Line: 56 ]] --[[ Name: OnClick ]]
                -- upvalues: v20 (copy), l_props_0 (copy)
                v20.props.convertAnimation(l_props_0.ScriptConversionContext, l_props_0.Analytics);
            end, 
            LayoutOrder = v25:getNextOrder()
        })
    });
end;
local function v31(v26) --[[ Line: 64 ]] --[[ Name: mapDispatchToProps ]]
    -- upvalues: v16 (copy), v18 (copy), v17 (copy)
    return {
        convertAnimation = function(v27, v28) --[[ Line: 66 ]] --[[ Name: convertAnimation ]]
            -- upvalues: v26 (copy), v16 (ref)
            v26(v16(v27, v28));
        end, 
        revertAnimation = function(v29) --[[ Line: 69 ]] --[[ Name: revertAnimation ]]
            -- upvalues: v26 (copy), v18 (ref)
            v26(v18(v29));
        end, 
        uploadTestAnimations = function(v30) --[[ Line: 72 ]] --[[ Name: uploadTestAnimations ]]
            -- upvalues: v26 (copy), v17 (ref)
            v26(v17(v30));
        end
    };
end;
local function v34(v32, _) --[[ Line: 78 ]] --[[ Name: mapStateToProps ]]
    return {
        selection = v32.AnimationConversion.selection
    };
end;
v19 = l_ContextServices_0.withContext({
    Analytics = l_ContextServices_0.Analytics, 
    Stylizer = l_ContextServices_0.Stylizer, 
    Localization = l_ContextServices_0.Localization, 
    ScriptConversionContext = v11
})(v19);
return v3.connect(v34, v31)(v19);