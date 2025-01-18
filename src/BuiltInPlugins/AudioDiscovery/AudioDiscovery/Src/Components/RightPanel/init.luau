local l_Parent_0 = script.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Packages.Roact);
local v2 = require(l_Parent_0.Packages.RoactRodux);
local v3 = require(l_Parent_0.Packages.Framework);
local l_Dash_0 = v3.Dash;
local l_map_0 = l_Dash_0.map;
local l_join_0 = l_Dash_0.join;
local l_ContextServices_0 = v3.ContextServices;
local l_withContext_0 = l_ContextServices_0.withContext;
local l_Localization_0 = l_ContextServices_0.Localization;
local v10 = require(l_Parent_0.Src.Actions.SortTable);
local l_Selection_0 = game:GetService("Selection");
local l_Stylizer_0 = v3.Style.Stylizer;
local l_UI_0 = v3.UI;
local l_Pane_0 = l_UI_0.Pane;
local l_TextLabel_0 = l_UI_0.TextLabel;
local v16 = require(l_Parent_0.Src.Components.AudioTable);
local v17 = require(script.RightCell);
local v18 = v1.PureComponent:extend("RightPanel");
v18.init = function(v19) --[[ Line: 30 ]] --[[ Name: init ]]
    v19.state = {
        sizes = {
            UDim.new(0.3333333333333333, 0), 
            UDim.new(0.6666666666666666, 0)
        }
    };
    v19.onSizesChange = function(v20) --[[ Line: 37 ]]
        -- upvalues: v19 (copy)
        v19:setState({
            sizes = v20
        });
    end;
end;
v18.render = function(v21) --[[ Line: 44 ]] --[[ Name: render ]]
    -- upvalues: l_map_0 (copy), l_join_0 (copy), v1 (copy), v16 (copy), v17 (copy), l_Selection_0 (copy), l_Pane_0 (copy), l_TextLabel_0 (copy)
    local l_props_0 = v21.props;
    local l_state_0 = v21.state;
    local l_Localization_1 = l_props_0.Localization;
    local v25 = {
        {
            Name = l_Localization_1:getText("Table", "Instance")
        }, 
        {
            Name = l_Localization_1:getText("Table", "Path")
        }
    };
    local v28 = l_map_0(v25, function(v26, v27) --[[ Line: 56 ]]
        -- upvalues: l_join_0 (ref), l_state_0 (copy)
        return l_join_0(v26, {
            Width = l_state_0.sizes[v27]
        });
    end);
    if l_props_0.Rows and #l_props_0.Rows > 0 then
        return v1.createElement(v16, {
            Scroll = true, 
            UseScale = true, 
            ClampSize = true, 
            OnColumnSizesChange = v21.onSizesChange, 
            SortIndex = l_props_0.SortIndex, 
            SortOrder = l_props_0.SortOrder, 
            OnSortChange = l_props_0.Sort, 
            Columns = v28, 
            Rows = l_props_0.Rows, 
            CellComponent = v17, 
            OnSelectRow = function(v29) --[[ Line: 73 ]] --[[ Name: OnSelectRow ]]
                -- upvalues: l_Selection_0 (ref)
                l_Selection_0:Set({
                    v29.Instance
                });
            end
        });
    else
        return v1.createElement(l_Pane_0, {
            Padding = 5
        }, {
            Child = v1.createElement(l_TextLabel_0, {
                TextXAlignment = Enum.TextXAlignment.Left, 
                TextYAlignment = Enum.TextYAlignment.Top, 
                TextWrapped = true, 
                Size = UDim2.fromScale(1, 1), 
                RichText = true, 
                Text = l_Localization_1:getText("Plugin", "Info")
            })
        });
    end;
end;
v18 = l_withContext_0({
    Localization = l_Localization_0, 
    Stylizer = l_Stylizer_0
})(v18);
return v2.connect(function(v30, _) --[[ Line: 100 ]]
    local v32 = if v30.Audio.SelectedRow then v30.Audio.Rows[v30.Audio.SelectedRow] else nil;
    return {
        Rows = if v32 then v30.Audio.Locations[v32.Id] else {}, 
        SortOrder = v30.Audio.Right.SortOrder, 
        SortIndex = v30.Audio.Right.SortIndex
    };
end, function(v33) --[[ Line: 107 ]]
    -- upvalues: v10 (copy)
    return {
        Sort = function(v34, v35) --[[ Line: 109 ]] --[[ Name: Sort ]]
            -- upvalues: v33 (copy), v10 (ref)
            v33(v10("Right", v34, v35));
        end
    };
end)(v18);