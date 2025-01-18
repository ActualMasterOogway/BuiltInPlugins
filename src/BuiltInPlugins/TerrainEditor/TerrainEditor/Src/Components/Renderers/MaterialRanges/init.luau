local l_script_FirstAncestor_0 = script:FindFirstAncestor("TerrainEditor");
local v1 = require(l_script_FirstAncestor_0.Packages.Framework);
local v2 = require(l_script_FirstAncestor_0.Packages.React);
local v3 = require(l_script_FirstAncestor_0.Packages.ReactRoblox);
local l_Localization_0 = v1.ContextServices.Localization;
local l_Stylizer_0 = v1.ContextServices.Stylizer;
local l_deepCopy_0 = v1.Util.deepCopy;
local l_useCallback_0 = v2.useCallback;
local l_useEffect_0 = v2.useEffect;
local l_useMemo_0 = v2.useMemo;
local l_useRef_0 = v2.useRef;
local l_useState_0 = v2.useState;
local l_Form_0 = v1.UI.Form;
local l_IconButton_0 = v1.UI.IconButton;
local l_Pane_0 = v1.UI.Pane;
local v15 = require(l_script_FirstAncestor_0.Src.Components.Renderers.Material);
local v16 = require(script.Elevation);
local v17 = require(script.Slope);
local v18 = require(l_script_FirstAncestor_0.Src.Controllers.PluginController);
local v19 = require(l_script_FirstAncestor_0.Src.Util.MaterialPresetSettingsHelper);
local l_Category_0 = require(l_script_FirstAncestor_0.Src.Types).Category;
local _ = require(l_script_FirstAncestor_0.Src.Resources.Theme);
local v22 = {
    MaterialIndex = "MaterialIndex", 
    Multiple = "Multiple", 
    None = "None"
};
return function(v23) --[[ Line: 54 ]] --[[ Name: MaterialRangesRenderer ]]
    -- upvalues: l_useState_0 (copy), l_useEffect_0 (copy), l_deepCopy_0 (copy), v18 (copy), l_Localization_0 (copy), l_Stylizer_0 (copy), l_useCallback_0 (copy), v22 (copy), l_useMemo_0 (copy), v19 (copy), l_useRef_0 (copy), v2 (copy), l_Pane_0 (copy), l_IconButton_0 (copy), l_Category_0 (copy), v3 (copy), l_Form_0 (copy), v16 (copy), v15 (copy), v17 (copy)
    local v24, v25 = l_useState_0(v23.Value);
    l_useEffect_0(function() --[[ Line: 56 ]]
        -- upvalues: l_deepCopy_0 (ref), v23 (copy), v24 (copy), v25 (copy)
        local v26 = l_deepCopy_0(v23.Value);
        if v26.MaterialIndex ~= v24.MaterialIndex then
            v26.MaterialIndex = v24.MaterialIndex;
        end;
        table.sort(v26.MaterialList, function(v27, v28) --[[ Line: 63 ]]
            return v27.Priority < v28.Priority;
        end);
        v25(v26);
    end, {
        v23.Value
    });
    local l_Schema_0 = v23.Schema;
    local l_Height_0 = l_Schema_0.Height;
    local v31 = v18:use():getRoot();
    local v32, v33 = l_useState_0(false);
    local v34 = l_Localization_0:use();
    local v35 = l_Stylizer_0:use("MaterialRangesRenderer");
    local v36 = l_Stylizer_0:use("MaterialRenderer");
    local v50 = l_useCallback_0(function(v37, v38) --[[ Line: 82 ]]
        -- upvalues: v22 (ref)
        local function v39(v40, v41) --[[ Line: 83 ]] --[[ Name: addedDiff ]]
            -- upvalues: v39 (copy)
            local v42 = {};
            for v43, v44 in v41 do
                if not v40[v43] or typeof(v40[v43]) ~= typeof(v44) then
                    v42[v43] = v44;
                elseif typeof(v44) == "table" then
                    v42[v43] = v39(v40[v43], v44);
                elseif v44 ~= v40[v43] then
                    v42[v43] = v44;
                end;
            end;
            for v45, _ in v40 do
                if not v41[v45] then
                    v42[v45] = false;
                end;
            end;
            if next(v42) == nil then
                return nil;
            else
                return v42;
            end;
        end;
        local v47 = v39(v37, v38);
        if not v47 then
            return v22.None;
        else
            for v48, _ in v47 do
                if v48 ~= "MaterialIndex" then
                    return v22.Multiple;
                end;
            end;
            if next(v47) ~= nil then
                return v22.MaterialIndex;
            else
                return v22.None;
            end;
        end;
    end);
    local v51 = l_useMemo_0(function() --[[ Line: 130 ]]
        -- upvalues: v19 (ref), v24 (copy), v34 (copy), v36 (copy)
        return v19.Get(v24, v34, v36);
    end, {
        v24
    });
    local v52, v53 = l_useState_0(false);
    local v54 = l_useRef_0();
    local v55 = l_useCallback_0(function() --[[ Line: 138 ]]
        -- upvalues: v54 (copy), v35 (copy), v53 (copy)
        if v54.current then
            if v54.current.AbsoluteSize.Y < v35.MinHeight then
                v53(true);
                return;
            else
                v53(false);
            end;
        end;
    end, {});
    local v56, v57 = l_useState_0({});
    return v2.createElement(l_Pane_0, {
        Size = UDim2.new(1, 0, 0, 32)
    }, {
        Button = v2.createElement(l_IconButton_0, {
            Disabled = v23.Disabled, 
            OnClick = function() --[[ Line: 157 ]] --[[ Name: OnClick ]]
                -- upvalues: v33 (copy)
                v33(true);
            end, 
            Size = UDim2.fromScale(1, 1), 
            Text = v34:getText(l_Category_0.ElevationSettings, "Edit"), 
            TextXAlignment = Enum.TextXAlignment.Center
        }), 
        Portal = if v32 and v31 then v3.createPortal({
            Dismiss = v2.createElement("TextButton", {
                AutoButtonColor = false, 
                BackgroundColor = v35.BackgroundColor, 
                BackgroundTransparency = 0.2, 
                Position = UDim2.fromOffset(0, 0), 
                ref = v54, 
                Size = UDim2.fromScale(1, 1), 
                [v2.Event.Activated] = function() --[[ Line: 173 ]]
                    -- upvalues: v33 (copy), v50 (copy), v24 (copy), v23 (copy), v22 (ref)
                    v33(false);
                    local _, v59 = v50(v24, v23.Value);
                    if v59 ~= v22.None then
                        v23.OnChanged(v24);
                    end;
                end, 
                [v2.Change.AbsoluteSize] = v55
            }), 
            Image = v2.createElement("ImageLabel", v35.CloseButton), 
            Edit = v2.createElement("TextButton", {
                AutomaticSize = if v52 then nil else Enum.AutomaticSize.Y, 
                AutoButtonColor = false, 
                AnchorPoint = v35.Dialog.AnchorPoint, 
                Position = v35.Dialog.Position, 
                Size = if v52 then v35.Dialog.FillSize else v35.Dialog.Size, 
                [v2.Change.AbsoluteSize] = v55
            }, {
                Contents = v2.createElement(l_Pane_0, {
                    AutomaticSize = if v52 then nil else Enum.AutomaticSize.Y, 
                    BackgroundColor = v35.Dialog.BackgroundColor, 
                    HorizontalAlignment = Enum.HorizontalAlignment.Left, 
                    Layout = Enum.FillDirection.Vertical, 
                    Padding = v35.Padding, 
                    Size = if v52 then UDim2.fromScale(1, 1) else UDim2.fromScale(1, 0), 
                    Spacing = v35.Padding
                }, {
                    Form = v2.createElement(l_Form_0, {
                        Expansion = v56, 
                        ExpandByDefault = true, 
                        Items = v51, 
                        LabelHeight = 20, 
                        LayoutOrder = 1, 
                        OnChange = function(v60) --[[ Line: 208 ]] --[[ Name: OnChange ]]
                            -- upvalues: v19 (ref), v24 (copy), l_Height_0 (copy), v25 (copy), v50 (copy), v22 (ref), v23 (copy)
                            local v61 = v19.Set(v60, v24, l_Height_0);
                            table.sort(v61.MaterialList, function(v62, v63) --[[ Line: 211 ]]
                                return v62.Priority < v63.Priority;
                            end);
                            v25(v61);
                            if v50(v24, v61) == v22.Multiple then
                                v23.OnChanged(v61);
                            end;
                        end, 
                        OnExpansionChange = v57, 
                        Renderers = {
                            Elevation = v16, 
                            Material = v15, 
                            Slope = v17
                        }, 
                        Size = if v52 then UDim2.new(1, 0, 1, -v35.Reset.Size.Y.Offset) else UDim2.fromScale(1, 0), 
                        UseScrollingFrame = v52
                    }), 
                    Button = v2.createElement(l_IconButton_0, {
                        LayoutOrder = 2, 
                        LeftIcon = v35.Reset.Icon, 
                        OnClick = l_Schema_0.OnReset, 
                        Size = v35.Reset.Size, 
                        Text = "Reset"
                    })
                })
            })
        }, v31) else nil
    });
end;