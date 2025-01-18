local l_script_FirstAncestor_0 = script:FindFirstAncestor("TextureGenerator");
local v1 = require(l_script_FirstAncestor_0.Packages.React);
local v2 = require(l_script_FirstAncestor_0.Packages.Framework);
local _ = require(l_script_FirstAncestor_0.Src.Types);
local l_Localization_0 = v2.ContextServices.Localization;
local l_Components_0 = l_script_FirstAncestor_0.Src.Components;
local v6 = require(l_Components_0.Options);
local v7 = require(l_Components_0.PreviewArea);
local v8 = require(l_Components_0.PromptEntry);
local v9 = require(l_Components_0.ViewSelector);
local l_Hooks_0 = l_script_FirstAncestor_0.Src.Hooks;
local v11 = require(l_Hooks_0.useSelectedMeshParts);
local l_UI_0 = v2.UI;
local l_Alert_0 = l_UI_0.Alert;
local l_Pane_0 = l_UI_0.Pane;
local l_TextLabel_0 = l_UI_0.TextLabel;
local l_Stylizer_0 = v2.Style.Stylizer;
local _ = v2.Util.StyleModifier;
local l_LayoutOrderIterator_0 = v2.Util.LayoutOrderIterator;
local v19 = require(l_script_FirstAncestor_0.Src.Util.Constants);
local v20 = require(l_script_FirstAncestor_0.Src.Util.createHashFromMeshParts);
local v21 = require(l_script_FirstAncestor_0.Src.Util.PreviewsContext);
local function v27(v22, v23) --[[ Line: 43 ]] --[[ Name: getPreviewForSelection ]]
    -- upvalues: v19 (copy)
    for v24, v25 in v22.previews do
        if v22.modelToPreview[v23] == v24 then
            local v26 = table.clone(v25);
            v26.uuid = v24;
            if v25.status == v19.STATUS.FAILED then
                return nil;
            else
                return v26;
            end;
        end;
    end;
    return nil;
end;
return function(v28) --[[ Line: 58 ]] --[[ Name: EntryArea ]]
    -- upvalues: v1 (copy), v21 (copy), l_Localization_0 (copy), l_Stylizer_0 (copy), l_LayoutOrderIterator_0 (copy), v11 (copy), v20 (copy), v27 (copy), l_TextLabel_0 (copy), v9 (copy), v8 (copy), v6 (copy), v7 (copy), l_Pane_0 (copy), l_Alert_0 (copy)
    local v29 = v1.useContext(v21);
    local v30 = l_Localization_0:use();
    local v31 = l_Stylizer_0:use("EntryArea");
    local v32 = l_LayoutOrderIterator_0.new();
    local v33 = v11();
    local v34 = v20(v33);
    local v35 = v27(v29, v34);
    local v36 = v29.getTopError(v34);
    local v37 = next(v33) ~= nil;
    local v38 = v35 ~= nil;
    local v39 = {};
    if not v37 and not v38 then
        v39.SelectText = v1.createElement(l_TextLabel_0, {
            AutomaticSize = Enum.AutomaticSize.XY, 
            AnchorPoint = Vector2.new(0.5, 0.5), 
            Size = UDim2.fromOffset(150, 100), 
            Position = UDim2.fromScale(0.5, 0.5), 
            RichText = true, 
            Text = v30:getText("EntryArea", "NoSelectionMessage"), 
            TextWrapped = true, 
            TextXAlignment = Enum.TextXAlignment.Center, 
            TextYAlignment = Enum.TextYAlignment.Center
        });
    elseif v37 and not v38 then
        v39.ViewSelector = v1.createElement(v9, {
            LayoutOrder = v32:getNextOrder(), 
            MeshParts = v33
        });
        v39.PromptEntry = v1.createElement(v8, {
            LayoutOrder = v32:getNextOrder()
        });
        v39.Options = v1.createElement(v6, {
            LayoutOrder = v32:getNextOrder()
        });
    elseif v37 and v38 then
        v39.PreviewArea = v1.createElement(v7, {
            LayoutOrder = v32:getNextOrder(), 
            PreviewData = v35
        });
    end;
    v1.useMemo(function() --[[ Line: 106 ]]
        -- upvalues: v34 (copy), v29 (copy), v30 (copy)
        if not v34 or #v34 <= 0 then
            return;
        elseif v29.total > 0 and v29.quota <= 0 then
            v29.addError(v34, "PreviewUsageAlert", v30:getText("PreviewUsageAlert", "Title"), v30:getText("PreviewUsageAlert", "Description", {
                total = v29.total
            }), "warning");
            return;
        else
            v29.removeErrorById(v34, "PreviewUsageAlert");
            return;
        end;
    end, {
        v34, 
        v29.quota, 
        v29.total
    });
    local function _(v40) --[[ Line: 126 ]] --[[ Name: getErrorType ]]
        if v40 == "warning" then
            return "Warning";
        elseif v40 == "error" then
            return "Error";
        elseif v40 == "info" then
            return "Info";
        elseif v40 == "success" then
            return "Success";
        else
            return "Error";
        end;
    end;
    local l_createElement_0 = v1.createElement;
    local l_l_Pane_0_0 = l_Pane_0;
    local v44 = {
        AutomaticSize = Enum.AutomaticSize.Y, 
        BackgroundColor = v31.BackgroundColor, 
        LayoutOrder = v28.LayoutOrder, 
        Size = UDim2.new(1, 0, 0, 200), 
        Style = "Box"
    };
    local v45 = {};
    local v46 = false;
    if v36 ~= nil then
        v46 = v1.createElement;
        local l_l_Alert_0_0 = l_Alert_0;
        local v48 = {
            Title = v36.title, 
            Description = v36.message
        };
        local l_errorType_0 = v36.errorType;
        v48.Style = l_errorType_0 == "warning" and "Warning" or l_errorType_0 == "error" and "Error" or l_errorType_0 == "info" and "Info" or l_errorType_0 == "success" and "Success" or "Error";
        v48.ZIndex = 2;
        v48.OnClose = function() --[[ Line: 152 ]] --[[ Name: OnClose ]]
            -- upvalues: v29 (copy), v34 (copy)
            v29.popError(v34);
        end;
        v46 = v46(l_l_Alert_0_0, v48);
    end;
    v45.Alert = v46;
    v45.List = v1.createElement(l_Pane_0, {
        HorizontalAlignment = Enum.HorizontalAlignment.Center, 
        Layout = Enum.FillDirection.Vertical, 
        VerticalAlignment = Enum.VerticalAlignment.Center
    }, v39);
    return l_createElement_0(l_l_Pane_0_0, v44, v45);
end;