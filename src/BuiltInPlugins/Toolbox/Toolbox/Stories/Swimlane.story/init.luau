local l_select_0 = select;
local function v6(v1, v2, ...)
    local v3, v4 = {
        ...
    }, l_select_0("#", ...);
    for v5 = v2, v2 + v4 - 1 do
        v1[v5] = v3[v5 - v2 + 1];
    end;
end;
local l_Parent_0 = script.Parent.Parent;
local v8 = require(l_Parent_0.Packages.Roact);
local v9 = require(l_Parent_0.Core.Components.Categorization.Swimlane);
local v10 = require(l_Parent_0.Stories.ToolboxStoryWrapper);
local v11 = require(l_Parent_0.Core.Components.Categorization.IconTile);
local function _(v12) --[[ Line: 9 ]] --[[ Name: createSwimlaneWrapper ]]
    -- upvalues: v8 (copy), v10 (copy), v9 (copy)
    return function() --[[ Line: 10 ]]
        -- upvalues: v8 (ref), v10 (ref), v9 (ref), v12 (copy)
        return v8.createElement(v10, {}, {
            Example = v8.createElement(v9, v12)
        });
    end;
end;
local function v16(v14, v15) --[[ Line: 17 ]] --[[ Name: createIconTileData ]]
    return {
        BackgroundColor = Color3.fromRGB(math.random(255), math.random(255), math.random(255)), 
        Image = "rbxassetid://6002241241", 
        Key = v14, 
        Title = v15
    };
end;
local v17 = {
    summary = "A section with a title, horizontal list, and optional 'see all' button"
};
local v18 = {};
local v19 = {
    name = "Simple example", 
    summary = "a general example with data"
};
local v22 = {
    Data = {
        "This", 
        "is", 
        "a", 
        "test"
    }, 
    Total = 123, 
    Title = "Just a bunch of Frames", 
    OnClickSeeAll = function() --[[ Line: 41 ]] --[[ Name: OnClickSeeAll ]]
        print("See All");
    end, 
    OnRenderItem = function(v20, v21) --[[ Line: 44 ]] --[[ Name: OnRenderItem ]]
        -- upvalues: v8 (copy)
        return v8.createElement("TextLabel", {
            LayoutOrder = v20, 
            Size = UDim2.new(0, 100, 0, 100), 
            Text = v21
        });
    end
};
v19.story = function() --[[ Line: 10 ]]
    -- upvalues: v8 (copy), v10 (copy), v9 (copy), v22 (copy)
    return v8.createElement(v10, {}, {
        Example = v8.createElement(v9, v22)
    });
end;
local v23 = {
    name = "Icon Tiles", 
    summary = "Tiles that represent products to buy"
};
local v27 = {
    Data = {
        v16("1", "Blonde Hair"), 
        v16("2", "Cool Blonde Hair"), 
        v16("3", "Original Blonde"), 
        v16("4", "Blonde"), 
        v16("5", "Blondie"), 
        v16("6", "Bulond"), 
        v16("7", "Blund"), 
        v16("8", "Real Blonde"), 
        v16("9", "Blond"), 
        (v16("10", "Blonde"))
    }, 
    Title = "Check Out This Hair!", 
    Total = 12341115, 
    OnClickSeeAll = function() --[[ Line: 71 ]] --[[ Name: OnClickSeeAll ]]
        print("See All");
    end, 
    OnRenderItem = function(v24, v25) --[[ Line: 74 ]] --[[ Name: OnRenderItem ]]
        -- upvalues: v8 (copy), v11 (copy)
        return v8.createElement(v11, {
            LayoutOrder = v24, 
            BackgroundColor = v25.BackgroundColor, 
            Image = v25.Image, 
            Key = v25.Key, 
            Title = v25.Title, 
            Size = UDim2.new(0, 90, 0, 105), 
            OnClick = function(v26) --[[ Line: 82 ]] --[[ Name: OnClick ]]
                -- upvalues: v24 (copy)
                print(v24, v26);
            end
        });
    end
};
v23.story = function() --[[ Line: 10 ]]
    -- upvalues: v8 (copy), v10 (copy), v9 (copy), v27 (copy)
    return v8.createElement(v10, {}, {
        Example = v8.createElement(v9, v27)
    });
end;
v6(v18, 1, v19, v23);
v17.stories = v18;
return v17;