local l_Parent_0 = script.Parent.Parent;
local l_Parent_1 = l_Parent_0.Parent;
local v2 = require(l_Parent_1.Dash);
local v3 = require(l_Parent_1.React);
local v4 = require(l_Parent_1.Framework);
local l_Localization_0 = v4.ContextServices.Localization;
local l_Stylizer_0 = v4.Style.Stylizer;
local l_UI_0 = v4.UI;
local _ = l_UI_0.Pane;
local l_SelectInput_0 = l_UI_0.SelectInput;
local l_StyleModifier_0 = v4.Util.StyleModifier;
local v11 = require(script.ViewTypeButton);
local v12 = require(l_Parent_0.Enums.ViewType);
local l_LOCALIZATION_PROJECT_NAME_0 = require(l_Parent_0.Resources).LOCALIZATION_PROJECT_NAME;
local function v19(v14) --[[ Line: 67 ]] --[[ Name: createListItems ]]
    -- upvalues: v12 (copy), v2 (copy), l_LOCALIZATION_PROJECT_NAME_0 (copy)
    local v15 = v12.allValues();
    table.sort(v15, function(v16, v17) --[[ Line: 69 ]]
        return v16.rawValue() < v17.rawValue();
    end);
    return v2.map(v15, function(v18) --[[ Line: 72 ]]
        -- upvalues: v14 (copy), l_LOCALIZATION_PROJECT_NAME_0 (ref)
        return {
            Id = v18, 
            Label = v14:getProjectText(l_LOCALIZATION_PROJECT_NAME_0, "ViewTypeSelector", v18.rawValue())
        };
    end);
end;
ViewTypeSelector = function(v20) --[[ Line: 80 ]] --[[ Name: ViewTypeSelector ]]
    -- upvalues: l_StyleModifier_0 (copy), l_Stylizer_0 (copy), v12 (copy), v3 (copy), v11 (copy), l_Localization_0 (copy), v19 (copy), l_SelectInput_0 (copy)
    local v21 = if v20.Disabled then l_StyleModifier_0.Disabled else nil;
    local v22 = l_Stylizer_0:use("ViewTypeSelector", v20, v21);
    local l_ViewType_0 = v20.ViewType;
    assert(v12.isEnumValue(l_ViewType_0), "Invalid ViewType");
    local function v27(v24, v25, v26) --[[ Line: 87 ]] --[[ Name: renderItem ]]
        -- upvalues: v3 (ref), v11 (ref), v20 (copy), v22 (copy)
        return v3.createElement(v11, {
            GridSize = v20.GridSize, 
            LayoutOrder = v25, 
            OnClick = v26, 
            OnGridSizeChanged = v20.OnGridSizeChanged, 
            Style = v22, 
            Text = v24.Label, 
            ViewType = v24.Id
        });
    end;
    local v28 = l_Localization_0:use();
    local v29 = v19(v28);
    return v3.createElement(l_SelectInput_0, {
        Enabled = not v20.Disabled, 
        Icons = {
            v22.GridIcon, 
            v22.ListIcon
        }, 
        Items = v29, 
        HideText = true, 
        LayoutOrder = v20.LayoutOrder, 
        OnItemActivated = function(v30) --[[ Line: 111 ]] --[[ Name: OnItemActivated ]]
            -- upvalues: v20 (copy)
            v20.OnViewTypeSelected(v30.Id);
        end, 
        OnRenderItem = v27, 
        SelectedId = l_ViewType_0, 
        Size = v22.Size, 
        StyleModifier = v21
    });
end;
return ViewTypeSelector;