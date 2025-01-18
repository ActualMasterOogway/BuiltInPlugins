local l_script_FirstAncestor_0 = script:FindFirstAncestor("StartPage");
local v1 = require(l_script_FirstAncestor_0.Src.SharedFlags.getFFlagLuaStartPageFixLastViewed)();
local v2 = require(l_script_FirstAncestor_0.Packages.React);
local v3 = require(l_script_FirstAncestor_0.Packages.Framework);
local l_Localization_0 = v3.ContextServices.Localization;
local l_counter_0 = v3.Util.counter;
local l_UI_0 = v3.UI;
local l_Pane_0 = l_UI_0.Pane;
local l_Image_0 = l_UI_0.Image;
local v9 = require(l_script_FirstAncestor_0.Src.Components.Shimmer);
local v10 = require(l_script_FirstAncestor_0.Src.Components.Pill);
local v11 = require(l_script_FirstAncestor_0.Src.Hooks.useCursor);
local v12 = require(l_script_FirstAncestor_0.Src.Util.formatISOTimestamp);
local _ = require(l_script_FirstAncestor_0.Src.Types);
local function v23(v14) --[[ Line: 45 ]] --[[ Name: ResultRow ]]
    -- upvalues: l_Localization_0 (copy), l_counter_0 (copy), v11 (copy), v12 (copy), v1 (copy), v2 (copy), l_Image_0 (copy), v9 (copy), v10 (copy)
    local v15 = l_Localization_0:use();
    local v16 = l_counter_0();
    local v17, v18 = v11("PointingHand");
    local l_Cell_0 = v14.Cell;
    assert(not l_Cell_0.IsPlaceholder, "Cell cannot be a placeholder here");
    local v20 = nil;
    if l_Cell_0.Updated then
        v20 = v12(l_Cell_0.Updated, if v1 then v15 else nil);
    end;
    local v21 = nil;
    if l_Cell_0.Created then
        v21 = v12(l_Cell_0.Created, if v1 then v15 else nil);
    end;
    local v22 = nil;
    v22 = if l_Cell_0.ImageUrl then v2.createElement("ImageLabel", {
        Image = l_Cell_0.ImageUrl, 
        Size = UDim2.new(0, 75, 0, 75), 
        LayoutOrder = v16(), 
        [v2.Tag] = "X-Corner X-Bottom X-Right"
    }) else if l_Cell_0.NoLoadableImage then v2.createElement("Frame", {
        Size = UDim2.new(0, 75, 0, 75), 
        BackgroundColor3 = Color3.fromHex("#000000"), 
        BackgroundTransparency = 0.84, 
        LayoutOrder = v16(), 
        [v2.Tag] = "X-Corner X-Center X-Middle"
    }, {
        v2.createElement(l_Image_0, {
            Style = {
                Image = "rbxasset://studio_svg_textures/Lua/StartPage/Light/SI-Standard/Placeholder.png"
            }, 
            Size = UDim2.new(0, 45, 0, 45), 
            [v2.Tag] = "X-Corner"
        })
    }) else v2.createElement(v9.Component, {
        Size = UDim2.new(0, 75, 0, 75)
    });
    return v2.createElement("ImageButton", {
        Position = v14.Position, 
        Size = v14.Size, 
        [v2.Event.Activated] = function() --[[ Line: 100 ]]
            -- upvalues: v14 (copy), l_Cell_0 (copy)
            v14.OnClick(l_Cell_0);
        end, 
        [v2.Event.MouseEnter] = v17, 
        [v2.Event.MouseLeave] = v18, 
        [v2.Tag] = "X-Left X-Row X-Corner X-Middle StartPage-PageBackground StartPage-SearchRowPadding StartPage-NoBorder"
    }, {
        PreviewImage = v22, 
        BlankSpace = v2.createElement("Frame", {
            LayoutOrder = v16(), 
            Size = UDim2.new(0, 20, 0, 74), 
            [v2.Tag] = "X-Transparent"
        }), 
        LeftTextbox = v2.createElement("Frame", {
            Size = UDim2.new(0, 235, 0, 74), 
            LayoutOrder = v16(), 
            [v2.Tag] = "StartPage-SearchResultRowColumn X-Transparent"
        }, {
            NameAndAgeRec = v2.createElement("Frame", {
                LayoutOrder = v16(), 
                [v2.Tag] = "X-Fit X-Transparent X-RowS"
            }, {
                Name = v2.createElement("TextLabel", {
                    LayoutOrder = v16(), 
                    Text = l_Cell_0.Name, 
                    [v2.Tag] = "X-Fit StartPage-TextSize StartPage-FontBold StartPage-TextColor X-Transparent"
                }), 
                AgeRecommendation = if l_Cell_0.AgeRecommendation and tonumber(l_Cell_0.AgeRecommendation) == 17 then v2.createElement(v10, {
                    LayoutOrder = v16(), 
                    Text = l_Cell_0.AgeRecommendation .. "+", 
                    [v2.Tag] = "X-Fit"
                }) else nil
            }), 
            UpdatedDate = if v20 then v2.createElement("TextLabel", {
                LayoutOrder = v16(), 
                Text = v15:getText("Plugin", "LastModified", {
                    lastModified = v20
                }), 
                [v2.Tag] = "X-Fit StartPage-TextSize StartPage-Font StartPage-TextColor X-Transparent"
            }) else nil, 
            Description = v2.createElement("TextLabel", {
                LayoutOrder = v16(), 
                Text = l_Cell_0.Description or "", 
                [v2.Tag] = "X-Fit StartPage-TextSize StartPage-Font StartPage-TextColor X-Transparent"
            })
        }), 
        RightTextbox = v2.createElement("Frame", {
            Size = UDim2.new(1, -340, 0, 74), 
            LayoutOrder = v16(), 
            [v2.Tag] = "StartPage-SearchResultRowColumn X-Right X-Transparent"
        }, {
            CreatedDate = if v21 then v2.createElement("TextLabel", {
                LayoutOrder = v16(), 
                Text = v15:getText("Plugin", "Created", {
                    created = v21
                }), 
                [v2.Tag] = "X-Fit StartPage-TextSize StartPage-Font StartPage-TextColor X-Transparent"
            }) else nil, 
            CreatorName = if l_Cell_0.CreatorName then v2.createElement("TextLabel", {
                LayoutOrder = v16(), 
                Text = ("@%*"):format(l_Cell_0.CreatorName), 
                [v2.Tag] = "X-Fit StartPage-TextSize StartPage-Font StartPage-TextColor X-Transparent"
            }) else nil
        })
    });
end;
local function v25(v24) --[[ Line: 180 ]] --[[ Name: LoadingTile ]]
    -- upvalues: v2 (copy), l_Pane_0 (copy), v9 (copy)
    return v2.createElement(l_Pane_0, {
        Position = v24.Position, 
        Size = v24.Size, 
        [v2.Tag] = "X-Left X-Middle X-Transparent"
    }, {
        v2.createElement(v9.Component, {
            Size = UDim2.new(1, 0, 0, 74)
        })
    });
end;
return function(v26) --[[ Line: 192 ]] --[[ Name: SearchResultRow ]]
    -- upvalues: v25 (copy), v23 (copy)
    if v26.Cell.IsPlaceholder then
        return v25(v26);
    else
        return v23(v26);
    end;
end;