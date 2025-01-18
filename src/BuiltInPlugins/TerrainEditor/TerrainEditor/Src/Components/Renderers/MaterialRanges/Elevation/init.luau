local l_script_FirstAncestor_0 = script:FindFirstAncestor("TerrainEditor");
local v1 = require(l_script_FirstAncestor_0.Packages.Dash);
local v2 = require(l_script_FirstAncestor_0.Packages.Framework);
local v3 = require(l_script_FirstAncestor_0.Packages.React);
local l_useCallback_0 = v3.useCallback;
local l_useEffect_0 = v3.useEffect;
local l_useState_0 = v3.useState;
local l_Button_0 = v2.UI.Button;
local l_Image_0 = v2.UI.Image;
local l_Pane_0 = v2.UI.Pane;
local l_Separator_0 = v2.UI.Separator;
local l_Stylizer_0 = v2.ContextServices.Stylizer;
local l_LayoutOrderIterator_0 = v2.Util.LayoutOrderIterator;
local v13 = require(script.RangeInputs);
local v14 = require(script.MaterialSlider);
local v15 = require(l_script_FirstAncestor_0.Src.Resources.Constants);
local _ = require(l_script_FirstAncestor_0.Src.Resources.Theme);
local _ = require(l_script_FirstAncestor_0.Src.Types);
local v18 = require(l_script_FirstAncestor_0.Src.Util.CreateUniqueKey);
return function(v19) --[[ Line: 40 ]] --[[ Name: Elevation ]]
    -- upvalues: l_Stylizer_0 (copy), l_useState_0 (copy), l_LayoutOrderIterator_0 (copy), v18 (copy), l_useEffect_0 (copy), l_useCallback_0 (copy), v1 (copy), v3 (copy), v13 (copy), v14 (copy), v15 (copy), l_Pane_0 (copy), l_Button_0 (copy), l_Image_0 (copy), l_Separator_0 (copy)
    local v20 = l_Stylizer_0:use("ElevationRenderer");
    local v21, v22 = l_useState_0(v19.Value);
    local l_Min_0 = v21.Min;
    local l_Max_0 = v21.Max;
    local l_Unit_0 = v21.Unit;
    local l_MaterialIndex_0 = v21.MaterialIndex;
    local _ = v19.Schema;
    local v28 = l_LayoutOrderIterator_0.new();
    local v29 = v18();
    local v30 = {};
    local v31 = table.clone(v21.MaterialList);
    l_useEffect_0(function() --[[ Line: 58 ]]
        -- upvalues: v22 (copy), v19 (copy)
        v22(v19.Value);
    end, {
        v19.Value
    });
    local v32 = l_useCallback_0(function() --[[ Line: 62 ]]
        -- upvalues: v19 (copy), v21 (copy)
        v19.OnChanged(v21);
    end, {
        v21, 
        v19.OnChanged
    });
    local v35 = l_useCallback_0(function(v33) --[[ Line: 66 ]]
        -- upvalues: v21 (copy), v19 (copy)
        local v34 = table.clone(v21);
        v34.MaterialIndex = v33;
        v19.OnChanged(v34);
    end, {
        v21, 
        v31, 
        l_MaterialIndex_0
    });
    local v38 = l_useCallback_0(function(v36) --[[ Line: 74 ]]
        -- upvalues: v21 (copy), v31 (copy), l_MaterialIndex_0 (copy), v1 (ref), v22 (copy)
        local v37 = table.clone(v21);
        v37.MaterialList = table.clone(v31);
        v37.MaterialList[l_MaterialIndex_0] = v1.join(v31[l_MaterialIndex_0], v36);
        v22(v37);
    end, {
        v21, 
        v31, 
        l_MaterialIndex_0
    });
    local v42 = l_useCallback_0(function(v39, v40) --[[ Line: 83 ]]
        -- upvalues: v21 (copy), v19 (copy)
        local v41 = table.clone(v21);
        if v39 then
            v41.Min = v39;
        end;
        if v40 then
            v41.Max = v40;
        end;
        v19.OnChanged(v41);
    end, {
        v21, 
        v19.OnChanged
    });
    local v45 = l_useCallback_0(function() --[[ Line: 96 ]]
        -- upvalues: v21 (copy), v31 (copy), l_Min_0 (copy), l_Max_0 (copy), v19 (copy)
        local v43 = table.clone(v21);
        v43.MaterialList = table.clone(v31);
        local v44 = {
            Priority = #v43.MaterialList, 
            Material = v21.FallbackMaterial, 
            MinHeight = l_Min_0, 
            MaxHeight = l_Max_0, 
            MinSlope = 0, 
            MaxSlope = 90
        };
        table.insert(v43.MaterialList, v44);
        v43.MaterialIndex = #v43.MaterialList;
        v19.OnChanged(v43);
    end, {
        v21, 
        v31, 
        l_MaterialIndex_0, 
        v19.OnChanged, 
        l_Min_0, 
        l_Max_0
    });
    local v48 = l_useCallback_0(function() --[[ Line: 114 ]]
        -- upvalues: v21 (copy), v31 (copy), l_MaterialIndex_0 (copy), v19 (copy)
        local v46 = table.clone(v21);
        v46.MaterialList = table.clone(v31);
        table.remove(v46.MaterialList, l_MaterialIndex_0);
        for v47 = l_MaterialIndex_0, #v46.MaterialList do
            v46.MaterialList[v47].Priority = v47 - 1;
        end;
        v46.MaterialIndex = if l_MaterialIndex_0 == 1 then l_MaterialIndex_0 else l_MaterialIndex_0 - 1;
        v19.OnChanged(v46);
    end, {
        v21, 
        v31, 
        l_MaterialIndex_0, 
        v19.OnChanged
    });
    local v49 = v31[l_MaterialIndex_0];
    v30.RangeInputs = v3.createElement(v13, {
        LayoutOrder = v28:getNextOrder(), 
        Max = l_Max_0, 
        MaxHeight = if v49 then v49.MaxHeight else nil, 
        Min = l_Min_0, 
        MinHeight = if v49 then v49.MinHeight else nil, 
        OnChanged = function(v50) --[[ Line: 135 ]] --[[ Name: OnChanged ]]
            -- upvalues: v42 (copy), v38 (copy)
            if v50.Min or v50.Max then
                v42(v50.Min, v50.Max);
                return;
            else
                v38(v50);
                return;
            end;
        end, 
        Unit = l_Unit_0
    });
    for v51, v52 in v31 do
        v30[v29(v52.Material.Name)] = v3.createElement(v14, {
            CanDelete = #v31 > 1, 
            LayoutOrder = v28:getNextOrder(), 
            Material = v52.Material, 
            Max = l_Max_0, 
            MaxHeight = v52.MaxHeight, 
            Min = l_Min_0, 
            MinHeight = v52.MinHeight, 
            OnChanged = v38, 
            OnCommit = v32, 
            OnRemove = v48, 
            OnSelect = function() --[[ Line: 157 ]] --[[ Name: OnSelect ]]
                -- upvalues: v35 (copy), v51 (copy)
                v35(v51);
            end, 
            Selected = l_MaterialIndex_0 == v51
        });
    end;
    if #v31 < v15.MaxMaterialListSize then
        v30.AddMaterial = v3.createElement(l_Pane_0, {
            AutomaticSize = Enum.AutomaticSize.XY, 
            Layout = Enum.FillDirection.Vertical, 
            LayoutOrder = v28:getNextOrder(), 
            Spacing = v20.Spacing - 2, 
            Size = UDim2.fromScale(0, 0)
        }, {
            MaterialSliderPlaceHolder = v3.createElement(l_Pane_0, {
                LayoutOrder = v28:getNextOrder(), 
                Size = v20.SliderSize
            }), 
            Add = v3.createElement(l_Button_0, {
                OnClick = v45, 
                LayoutOrder = v28:getNextOrder(), 
                Size = v20.MaterialPreviewSize, 
                Style = "RoundSubtle"
            }, {
                v3.createElement(l_Image_0, {
                    AnchorPoint = Vector2.new(0.5, 0.5), 
                    Position = UDim2.fromScale(0.5, 0.5), 
                    Size = v20.ButtonSize, 
                    Style = v20.AddStyle
                })
            })
        });
    end;
    local v53 = 30 * math.clamp(#v31 + 1, 1, 5);
    return v3.createElement("Frame", {
        AutomaticSize = Enum.AutomaticSize.XY, 
        BackgroundTransparency = 1
    }, {
        XAxis = v3.createElement("Frame", {
            BackgroundTransparency = 1, 
            Size = UDim2.fromOffset(v53, 5), 
            Position = UDim2.fromOffset(50, 200)
        }, {
            Separator = v3.createElement(l_Separator_0, {
                DominantAxis = Enum.DominantAxis.Width, 
                Position = UDim2.fromOffset(v53 / 2, 0)
            })
        }), 
        YAxis = v3.createElement("Frame", {
            BackgroundTransparency = 1, 
            Size = UDim2.fromOffset(5, 200), 
            Position = UDim2.fromOffset(50, 0)
        }, {
            Separator = v3.createElement(l_Separator_0, {
                DominantAxis = Enum.DominantAxis.Height, 
                Position = UDim2.fromOffset(0, 100)
            })
        }), 
        Sliders = v3.createElement(l_Pane_0, {
            Layout = Enum.FillDirection.Horizontal, 
            VerticalAlignment = Enum.VerticalAlignment.Top, 
            HorizontalAlignment = Enum.HorizontalAlignment.Left, 
            Padding = {
                Top = v20.TextBoxSize.Y.Offset / 2, 
                Bottom = v20.TextBoxSize.Y.Offset / 2
            }, 
            Spacing = v20.Spacing
        }, v30)
    });
end;