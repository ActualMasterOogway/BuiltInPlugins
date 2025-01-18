local l_Parent_0 = script:FindFirstAncestor("UI").Parent;
local v1 = require(l_Parent_0.Parent.React);
local v2 = require(l_Parent_0.UI.Components.IconButton);
local function v3() --[[ Line: 5 ]]
    print("IconButton clicked");
end;
return {
    stories = {
        {
            name = "Default Button", 
            story = v1.createElement(v2, {
                Cursor = "PointingHand", 
                OnClick = v3, 
                Text = "Default Button", 
                [v1.Tag] = "X-Fit"
            })
        }, 
        {
            name = "Primary Brand Button", 
            story = v1.createElement(v2, {
                Cursor = "PointingHand", 
                OnClick = v3, 
                Text = "PrimaryBrand Button", 
                [v1.Tag] = "PrimaryBrand X-Fit"
            })
        }, 
        {
            name = "Primary Button", 
            story = v1.createElement(v2, {
                Cursor = "PointingHand", 
                OnClick = v3, 
                Text = "Primary Button", 
                [v1.Tag] = "Primary X-Fit"
            })
        }, 
        {
            name = "Secondary Button", 
            story = v1.createElement(v2, {
                Cursor = "PointingHand", 
                OnClick = v3, 
                Text = "Secondary Button", 
                [v1.Tag] = "Secondary X-Fit"
            })
        }, 
        {
            name = "Custom Color", 
            story = v1.createElement(v2, {
                BackgroundColor3 = Color3.fromRGB(200, 100, 100), 
                Cursor = "PointingHand", 
                OnClick = v3, 
                Text = "Custom Button", 
                [v1.Tag] = "X-Fit"
            })
        }, 
        {
            name = "Button with Tooltip", 
            story = v1.createElement(v2, {
                LeftIcon = "rbxasset://textures/ui/common/robux_color@2x.png", 
                Cursor = "PointingHand", 
                OnClick = v3, 
                Text = "Hover over me", 
                TooltipText = "This is a button tooltip", 
                [v1.Tag] = "X-Fit"
            })
        }, 
        {
            name = "Disabled", 
            story = v1.createElement(v2, {
                Text = "Disabled", 
                [v1.Tag] = "X-Fit Disabled"
            })
        }, 
        {
            name = "IconOnly", 
            story = v1.createElement(v2, {
                LeftIcon = "rbxasset://textures/ui/common/robux_color@2x.png", 
                Cursor = "PointingHand", 
                OnClick = v3, 
                [v1.Tag] = "X-Fit"
            })
        }, 
        {
            name = "NoOnClick", 
            story = v1.createElement(v2, {
                TextXAlignment = Enum.TextXAlignment.Center, 
                Text = "No OnClick Passed", 
                [v1.Tag] = "X-Fit"
            })
        }, 
        {
            name = "RightIcon", 
            story = v1.createElement(v2, {
                OnClick = v3, 
                RightIcon = "rbxasset://textures/ui/common/robux_color@2x.png", 
                Text = "Text", 
                [v1.Tag] = "X-Fit"
            })
        }, 
        {
            name = "Link", 
            story = v1.createElement(v2, {
                Cursor = "PointingHand", 
                LeftIcon = "rbxasset://textures/ui/common/robux_color@2x.png", 
                OnClick = v3, 
                Text = "Link style", 
                [v1.Tag] = "X-Fit Link"
            })
        }
    }
};