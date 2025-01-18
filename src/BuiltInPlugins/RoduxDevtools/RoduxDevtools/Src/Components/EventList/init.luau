local l_Parent_0 = script.Parent.Parent.Parent;
local _ = require(l_Parent_0.Src.Types);
local v2 = require(l_Parent_0.Packages.React);
local v3 = require(l_Parent_0.Packages.RoactRodux);
local v4 = require(l_Parent_0.Packages.Framework);
local l_ContextServices_0 = v4.ContextServices;
local l_withContext_0 = l_ContextServices_0.withContext;
local l_Analytics_0 = l_ContextServices_0.Analytics;
local l_Localization_0 = l_ContextServices_0.Localization;
local l_Stylizer_0 = v4.Style.Stylizer;
local l_StyleKey_0 = v4.Style.StyleKey;
local l_UI_0 = v4.UI;
local l_List_0 = l_UI_0.List;
local l_TextLabel_0 = l_UI_0.TextLabel;
local v14 = v2.PureComponent:extend("EventList");
v14.init = function(v15) --[[ Line: 44 ]] --[[ Name: init ]]
    v15.rightAlignSizes = {};
end;
v14.render = function(v16) --[[ Line: 48 ]] --[[ Name: render ]]
    -- upvalues: v2 (copy), l_List_0 (copy), l_StyleKey_0 (copy), l_TextLabel_0 (copy)
    local l_props_0 = v16.props;
    local l_Stylizer_1 = l_props_0.Stylizer;
    local l_SelectedIndex_0 = l_props_0.SelectedIndex;
    local v20 = string.lower(l_props_0.SearchTerm);
    local l_Events_0 = l_props_0.Events;
    return v2.createElement(l_List_0, {
        Rows = l_Events_0, 
        RowComponent = "TextButton", 
        GetRowProps = function(v22, v23, v24, v25) --[[ Line: 59 ]] --[[ Name: GetRowProps ]]
            -- upvalues: l_SelectedIndex_0 (copy), v20 (copy), l_Stylizer_1 (copy), l_StyleKey_0 (ref), v16 (copy), v2 (ref), l_props_0 (copy), l_TextLabel_0 (ref)
            local l_props_1 = v22.props;
            local l_name_0 = l_props_1.name;
            local l_elapsedMs_0 = l_props_1.elapsedMs;
            local v29 = v23 == l_SelectedIndex_0;
            local v30 = v20 ~= "" and string.find(string.lower(l_name_0), v20, 1, true) ~= nil;
            local v31 = v22.eventType == "Flush" and 6 or 1;
            local v32 = v31 * 0.75;
            local v33 = nil;
            if v32 <= l_elapsedMs_0 then
                v33 = l_Stylizer_1[l_StyleKey_0.ErrorText]:Lerp(l_Stylizer_1[l_StyleKey_0.WarningText], (math.clamp((v31 - l_elapsedMs_0) / (v31 - v32), 0, 1)));
            end;
            if v16.rightAlignSizes[v23] == nil then
                v16.rightAlignSizes[v23] = {
                    v2.createBinding(Vector2.zero)
                };
            end;
            return {
                LayoutOrder = v23, 
                Position = v24, 
                Size = v25, 
                BackgroundColor3 = if v29 then l_Stylizer_1[l_StyleKey_0.MenuEntryHighlight] else l_Stylizer_1[l_StyleKey_0.SecondaryMain], 
                BackgroundTransparency = (not not v29 or v30) and 0 or 1, 
                AutoButtonColor = false, 
                Text = "", 
                [v2.Event.Activated] = function() --[[ Line: 93 ]]
                    -- upvalues: l_props_0 (ref), v23 (copy)
                    l_props_0.OnSelected(v23);
                end, 
                children = {
                    Padding = v2.createElement("UIPadding", {
                        PaddingLeft = UDim.new(0, 5), 
                        PaddingRight = UDim.new(0, 12)
                    }), 
                    Corner = v2.createElement("UICorner", {
                        CornerRadius = UDim.new(0, 3)
                    }), 
                    Title = v2.createElement("Frame", {
                        BackgroundTransparency = 1, 
                        Size = v16.rightAlignSizes[v23][1]:map(function(v34) --[[ Line: 107 ]]
                            return UDim2.new(1, -v34.X - 5, 1, 0);
                        end)
                    }, {
                        Label = v2.createElement(l_TextLabel_0, {
                            Size = UDim2.fromScale(1, 1), 
                            Text = l_name_0, 
                            TextColor = if v22.altered and v22.altered.skipped then l_Stylizer_1[l_StyleKey_0.SubText] else nil, 
                            TextXAlignment = Enum.TextXAlignment.Left, 
                            TextTruncate = Enum.TextTruncate.AtEnd
                        }, {
                            Strikethrough = v2.createElement("Frame", {
                                Visible = if v22.altered then v22.altered.skipped else false, 
                                BackgroundColor3 = l_Stylizer_1[l_StyleKey_0.SubText], 
                                BorderSizePixel = 0, 
                                Size = UDim2.new(1, 0, 0, 1), 
                                Position = UDim2.fromScale(0.5, 0.5), 
                                AnchorPoint = Vector2.new(0.5, 0.5)
                            })
                        })
                    }), 
                    RightAligned = v2.createElement("Frame", {
                        BackgroundTransparency = 1, 
                        Size = UDim2.fromScale(0.5, 1), 
                        Position = UDim2.fromScale(0.5, 0)
                    }, {
                        Layout = v2.createElement("UIListLayout", {
                            FillDirection = Enum.FillDirection.Horizontal, 
                            HorizontalAlignment = Enum.HorizontalAlignment.Right, 
                            VerticalAlignment = Enum.VerticalAlignment.Center, 
                            SortOrder = Enum.SortOrder.LayoutOrder, 
                            Padding = UDim.new(0, 5), 
                            [v2.Change.AbsoluteContentSize] = function(v35) --[[ Line: 142 ]]
                                -- upvalues: v16 (ref), v23 (copy)
                                v16.rightAlignSizes[v23][2](v35.AbsoluteContentSize);
                            end
                        }), 
                        ElapsedMs = v2.createElement(l_TextLabel_0, {
                            Style = "SubText", 
                            Text = string.format("%.1f ms", l_elapsedMs_0), 
                            TextXAlignment = Enum.TextXAlignment.Right, 
                            TextColor = v33, 
                            Size = UDim2.fromScale(0, 1), 
                            AutomaticSize = Enum.AutomaticSize.X
                        })
                    })
                }
            };
        end
    });
end;
v14 = l_withContext_0({
    Analytics = l_Analytics_0, 
    Localization = l_Localization_0, 
    Stylizer = l_Stylizer_0
})(v14);
return v3.connect(function(v36, _) --[[ Line: 170 ]]
    return {
        SelectedIndex = v36.selectedIndex, 
        SearchTerm = v36.searchTerm, 
        Events = v36.events
    };
end)(v14);