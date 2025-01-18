local l_script_FirstAncestor_0 = script:FindFirstAncestor("AvatarCompatibilityPreviewer");
local v1 = require(l_script_FirstAncestor_0.Packages.Framework);
local v2 = require(l_script_FirstAncestor_0.Packages.React);
local v3 = require(l_script_FirstAncestor_0.Packages.ViewportToolingFramework);
local v4 = require(l_script_FirstAncestor_0.Src.Util.Constants);
local _ = require(l_script_FirstAncestor_0.Src.Resources.Theme);
local _ = require(l_script_FirstAncestor_0.Src.Types);
local v7 = require(l_script_FirstAncestor_0.Src.Util.exhaustiveMatch);
local v8 = require(l_script_FirstAncestor_0.Src.Hooks.useEventConnection);
local v9 = require(l_script_FirstAncestor_0.Src.Hooks.useKeyedState);
local v10 = require(l_script_FirstAncestor_0.Src.Hooks.useSerializedState);
local v11 = require(script.AttachmentTool);
local v12 = require(script.CageEditingTool);
local v13 = require(script.RepresentEditorStateOnWorldModel);
local v14 = require(script.useBindFocusOnPVInstance);
local v15 = require(l_script_FirstAncestor_0.Src.Flags.getFFlagAvatarPreviewerEditingTools);
local v16 = require(l_script_FirstAncestor_0.Src.Flags.getFFlagAvatarPreviewerCageEditingTools);
local l_ContextServices_0 = v1.ContextServices;
local l_Localization_0 = l_ContextServices_0.Localization;
local l_Plugin_0 = l_ContextServices_0.Plugin;
local l_Stylizer_0 = l_ContextServices_0.Stylizer;
local function v23(v21) --[[ Line: 35 ]] --[[ Name: getDefaultIncludeAccessories ]]
    local v22 = true;
    if v21 ~= "attachments" then
        v22 = v21 == "none";
    end;
    return v22;
end;
local function v25(v24) --[[ Line: 39 ]] --[[ Name: BindFocusOnPVInstance ]]
    -- upvalues: v14 (copy)
    v14(v24.dummy);
end;
return function(v26) --[[ Line: 45 ]] --[[ Name: EditingTools ]]
    -- upvalues: v15 (copy), l_Localization_0 (copy), l_Stylizer_0 (copy), v2 (copy), l_Plugin_0 (copy), v8 (copy), v9 (copy), v23 (copy), v10 (copy), v4 (copy), v3 (copy), v11 (copy), v16 (copy), v12 (copy), v7 (copy), v13 (copy), v25 (copy)
    assert(v15(), "AvatarPreviewerEditingTools_Dev is not enabled");
    local v27 = l_Localization_0:use();
    local v28 = l_Stylizer_0:use("EditingTools");
    local v29, v30 = v2.useState("none");
    local v31 = l_Plugin_0:use():get();
    v2.useEffect(function() --[[ Line: 54 ]]
        -- upvalues: v29 (copy), v31 (copy)
        if v29 == "none" then
            return;
        else
            v31:Activate(true);
            return function() --[[ Line: 62 ]]
                -- upvalues: v31 (ref)
                v31:Deactivate();
            end;
        end;
    end, {
        v29 == "none"
    });
    v8(v31.Deactivation, function() --[[ Line: 67 ]]
        -- upvalues: v30 (copy)
        v30("none");
    end, {});
    local v32, v33 = v9(v23, v29);
    local v35 = {
        {
            Type = "Button", 
            Tooltip = v27:getText("EditingTools", "ShowAccessories"), 
            Icon = v28.ShowClothingImage, 
            Selected = v32, 
            OnClick = function() --[[ Line: 83 ]] --[[ Name: OnClick ]]
                -- upvalues: v33 (copy)
                v33(function(v34) --[[ Line: 84 ]]
                    return not v34;
                end);
            end
        }
    };
    local function v40(v36, v37, v38) --[[ Line: 91 ]] --[[ Name: toolButton ]]
        -- upvalues: v29 (copy), v30 (copy)
        return {
            Type = "Button", 
            Tooltip = v38, 
            Icon = v37, 
            Selected = v29 == v36, 
            OnClick = function() --[[ Line: 97 ]] --[[ Name: OnClick ]]
                -- upvalues: v30 (ref), v36 (copy)
                v30(function(v39) --[[ Line: 98 ]]
                    -- upvalues: v36 (ref)
                    if v39 == v36 then
                        return "none";
                    else
                        return v36;
                    end;
                end);
            end, 
            Enabled = nil, 
            TooltipDescription = nil
        };
    end;
    local v41, v42 = v10(v26.worldModel, "InitialCageMeshesData", nil);
    local v43, v44 = v10(v26.worldModel, "CageChangeHistory", nil);
    local l_createElement_0 = v2.createElement;
    local l_Fragment_0 = v2.Fragment;
    local v47 = {};
    local v48 = {
        [v4.EDITING_TOOLS_GUI_NAMES.EditingToolbar] = v2.createElement(v3.Toolbar, {
            InitialPosition = "Top", 
            VerticalItems = {
                v40("attachments", v28.AttachmentToolImage, v27:getText("EditingTools", "AttachmentsTool")), 
                (v40("cage", v28.CageEditingToolImage, v27:getText("EditingTools", "CageTool")))
            }
        })
    };
    local v49 = false;
    if v29 ~= "none" then
        v49 = if v29 == "attachments" then v2.createElement(v11, {
            worldModel = v26.worldModel, 
            additionalToolbarItems = v35
        }) else if v16() and v29 == "cage" then v2.createElement(v12, {
            mannequin = v26.worldModel, 
            additionalToolbarItems = v35, 
            initialMeshesData = v41, 
            setInitialMeshesData = v42, 
            changeHistory = v43, 
            setChangeHistory = v44
        }) else v7(v29);
    end;
    v48.Tool = v49;
    v49 = false;
    if v29 ~= "none" then
        v49 = v2.createElement(v13, {
            worldModel = v26.worldModel, 
            includeAccessories = v32
        });
    end;
    v48.RepresentEditorStateOnWorldModel = v49;
    v49 = false;
    if v29 ~= "none" then
        v49 = v2.createElement(v25, {
            dummy = v26.worldModel
        });
    end;
    v48.BindFocusOnPVInstance = v49;
    return l_createElement_0(l_Fragment_0, v47, v48);
end;