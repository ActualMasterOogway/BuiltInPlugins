local l_FirstAncestor_0 = script.Parent:FindFirstAncestor("AudioEqualizerEditor");
local v1 = require(l_FirstAncestor_0.Packages.React);
local l_useContext_0 = v1.useContext;
local v3 = require(l_FirstAncestor_0.Packages.Framework);
local l_ContextServices_0 = v3.ContextServices;
local l_Pane_0 = v3.UI.Pane;
local l_PropertyCell_0 = v3.UI.PropertyCell;
local l_Slider_0 = v3.UI.Slider;
local l_TextLabel_0 = v3.UI.TextLabel;
local _ = require(l_FirstAncestor_0.Src.Types);
local v10 = require(l_FirstAncestor_0.Src.Util.FilterTypeUtil);
local v11 = require(l_FirstAncestor_0.Src.Util.PlotUtil);
return function(v12) --[[ Line: 28 ]] --[[ Name: FilterControls ]]
    -- upvalues: l_useContext_0 (copy), l_ContextServices_0 (copy), v10 (copy), v11 (copy), v1 (copy), l_Pane_0 (copy), l_PropertyCell_0 (copy), l_TextLabel_0 (copy), l_Slider_0 (copy)
    local v13 = l_useContext_0(l_ContextServices_0.Context.Consumer)[l_ContextServices_0.Localization.Key];
    local v14 = v10.filterTypeToId(v12.FilterHook.filterType);
    local function v17(v15) --[[ Line: 33 ]]
        -- upvalues: v10 (ref), v12 (copy)
        local v16 = v10.idToFilterType(v15);
        v12.FilterHook.setFilterType(v16);
    end;
    local v18 = v10.hasQ(v12.FilterHook.filterType);
    local v19 = v11.log2(0.1);
    local v20 = v11.log2(10);
    local v21 = (v11.log2(v12.FilterHook.q) - v19) / (v20 - v19);
    local function v23(v22) --[[ Line: 43 ]]
        -- upvalues: v12 (copy), v20 (copy), v19 (copy)
        v12.FilterHook.setQ((math.pow(2, v22 * (v20 - v19) + v19)));
    end;
    local function v25(v24) --[[ Line: 47 ]]
        -- upvalues: v12 (copy)
        v12.FilterHook.setQ(v24);
    end;
    return v1.createElement(l_Pane_0, {
        Position = v12.Position, 
        Size = v12.Size, 
        LayoutOrder = 1, 
        [v1.Tag] = "X-RowM X-Middle"
    }, {
        FilterType = v1.createElement(l_Pane_0, {
            LayoutOrder = 1, 
            [v1.Tag] = "X-Fit X-RowM X-Middle"
        }, {
            FilterTypeDropdown = v1.createElement(l_PropertyCell_0, {
                AutomaticSize = Enum.AutomaticSize.Y, 
                Size = UDim2.fromOffset(150, 25), 
                Disabled = false, 
                OnChanged = v17, 
                Schema = {
                    Type = "Select", 
                    Items = v10.getDropdownItems(v13)
                }, 
                Tooltip = "FilterType", 
                Value = v14
            }), 
            FilterTypeLabel = v1.createElement(l_TextLabel_0, {
                Text = v13:getText("Label", "FilterType"), 
                LayoutOrder = 1, 
                [v1.Tag] = "X-Fit"
            })
        }), 
        Spacer = v1.createElement(l_Pane_0, {
            LayoutOrder = 2, 
            Size = UDim2.new(0, 25, 1, 0)
        }), 
        Q = v18 and v1.createElement(l_Pane_0, {
            LayoutOrder = 3, 
            [v1.Tag] = "X-Fit X-RowM X-Middle"
        }, {
            QSlider = v1.createElement(l_Slider_0, {
                Disabled = false, 
                Max = 1, 
                Min = 0, 
                OnValueChanged = v23, 
                Size = UDim2.fromOffset(100, 25), 
                ShowInput = false, 
                SnapIncrement = 0.01, 
                VerticalDragTolerance = 1000, 
                Value = v21
            }), 
            QTextInput = v1.createElement(l_PropertyCell_0, {
                AutomaticSize = Enum.AutomaticSize.Y, 
                Size = UDim2.fromOffset(50, 25), 
                Disabled = false, 
                OnChanged = v25, 
                Schema = {
                    Type = "Number"
                }, 
                Tooltip = "Q", 
                Value = v12.FilterHook.q
            }), 
            QLabel = v1.createElement(l_TextLabel_0, {
                Text = v13:getText("Label", "Q"), 
                LayoutOrder = 1, 
                [v1.Tag] = "X-Fit"
            })
        })
    });
end;