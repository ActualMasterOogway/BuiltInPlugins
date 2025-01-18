local l_Parent_0 = script:FindFirstAncestor("UI").Parent;
local v1 = require(l_Parent_0.Parent.Roact);
local v2 = require(l_Parent_0.UI.Components.DEPRECATED_Button);
local v3 = require(l_Parent_0.UI.Components.InfiniteScrollingGrid);
local v4 = v1.PureComponent:extend("InfiniteDataProvider");
v4.init = function(v5) --[[ Line: 12 ]] --[[ Name: init ]]
    v5.createItem = function(v6) --[[ Line: 13 ]]
        return {
            id = v6, 
            text = "Item " .. tostring(v6)
        };
    end;
    local v7 = {};
    for v8 = 1, 40 do
        v7[v8] = v5.createItem(v8);
    end;
    v5.state = {
        absoluteMax = 40, 
        items = v7
    };
end;
v4.render = function(v9) --[[ Line: 33 ]] --[[ Name: render ]]
    -- upvalues: v1 (copy), v3 (copy), v2 (copy)
    local l_state_0 = v9.state;
    return v1.createElement(v3, {
        AbsoluteMax = l_state_0.absoluteMax, 
        CellPadding = UDim2.new(0, 10, 0, 10), 
        CellSize = UDim2.new(0, 100, 0, 100), 
        BufferedRows = 2, 
        GetItemKey = function(v11) --[[ Line: 41 ]] --[[ Name: GetItemKey ]]
            return v11.id;
        end, 
        Items = l_state_0.items, 
        LoadRange = function(v12, v13) --[[ Line: 45 ]] --[[ Name: LoadRange ]]
            -- upvalues: v9 (copy)
            v9:setState({
                loading = true
            });
            local l_items_0 = v9.state.items;
            for v15 = math.max(v12, 1), math.min(v12 + v13, 300) do
                if not l_items_0[v15] then
                    l_items_0[v15] = v9.createItem(v15);
                end;
            end;
            v9:setState({
                items = l_items_0, 
                absoluteMax = math.min(v12 + v13, 300), 
                loading = false
            });
        end, 
        Loading = l_state_0.loading, 
        RenderItem = function(v16, v17) --[[ Line: 65 ]] --[[ Name: RenderItem ]]
            -- upvalues: v1 (ref), v2 (ref)
            return v1.createElement(v2, {
                Style = "Round", 
                LayoutOrder = v16, 
                Text = v17.text, 
                Size = UDim2.new(0, 100, 0, 20), 
                OnClick = function() --[[ Line: 71 ]] --[[ Name: OnClick ]]
                    -- upvalues: v17 (copy)
                    print(v17.text);
                end
            });
        end, 
        Size = UDim2.new(1, 0, 0, 500)
    });
end;
return {
    stories = {
        {
            name = "Deferred loading", 
            summary = "In this story, the scroller starts at element 1, and scrolling down loads more elements.", 
            story = v4
        }
    }
};