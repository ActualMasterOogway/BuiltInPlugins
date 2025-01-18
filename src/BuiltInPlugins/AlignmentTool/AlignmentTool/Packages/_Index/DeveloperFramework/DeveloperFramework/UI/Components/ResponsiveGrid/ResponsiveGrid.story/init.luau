local l_Parent_0 = script:FindFirstAncestor("UI").Parent;
local v1 = require(l_Parent_0.Parent.Roact);
local v2 = require(l_Parent_0.UI.Components.ResponsiveGrid);
return {
    stories = {
        {
            name = "Default", 
            summary = "A flexible grid. Change the storybook plugin width to see changing columns.", 
            story = v1.createElement(v2, {
                AutomaticSize = Enum.AutomaticSize.Y, 
                CutOffs = {
                    {
                        MinWidth = 0, 
                        ColumnCount = 1
                    }, 
                    {
                        MinWidth = 200, 
                        ColumnCount = 2
                    }, 
                    {
                        MinWidth = 400, 
                        ColumnCount = 3
                    }, 
                    {
                        MinWidth = 1000, 
                        ColumnCount = 5
                    }
                }, 
                ItemHeight = UDim.new(0, 100)
            }, {
                item1 = v1.createElement("TextLabel", {
                    Text = "item 1", 
                    LayoutOrder = 1
                }), 
                item2 = v1.createElement("TextLabel", {
                    Text = "item 2", 
                    LayoutOrder = 2
                }), 
                item3 = v1.createElement("TextLabel", {
                    Text = "item 3", 
                    LayoutOrder = 3
                }), 
                item4 = v1.createElement("TextLabel", {
                    Text = "item 4", 
                    LayoutOrder = 4
                }), 
                item5 = v1.createElement("TextLabel", {
                    Text = "item 5", 
                    LayoutOrder = 5
                })
            })
        }
    }
};