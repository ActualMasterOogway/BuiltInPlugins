local l_script_FirstAncestor_0 = script:FindFirstAncestor("StartPage");
local v1 = require(l_script_FirstAncestor_0.Packages.React);
local v2 = require(l_script_FirstAncestor_0.Packages.Framework);
local l_counter_0 = v2.Util.counter;
local l_Localization_0 = v2.ContextServices.Localization;
local l_Image_0 = v2.UI.Image;
local v6 = require(l_script_FirstAncestor_0.Src.SharedFlags.getFFlagLuaStartPageAddingRecentsPage)();
local l_Components_0 = l_script_FirstAncestor_0.Src.Components;
local v8 = require(l_Components_0.NewButton);
local v9 = require(l_script_FirstAncestor_0.Src.Hooks.useCursor);
local l_joinTags_0 = v2.Styling.joinTags;
local _ = require(l_script_FirstAncestor_0.Src.Types);
local v12 = UDim2.new(0, 259, 0, 48);
local function v18(v13) --[[ Line: 55 ]] --[[ Name: PageItem ]]
    -- upvalues: v6 (copy), v9 (copy), l_Localization_0 (copy), v1 (copy), v12 (copy), l_joinTags_0 (copy), l_Image_0 (copy)
    assert(v6, "You can only use PageItem with FFlagLuaStartPageAddingRecentsPage on");
    local v14, v15 = v9("PointingHand");
    local v16 = l_Localization_0:use();
    local v17 = v13.Selected and "StartPage-Selected" or "StartPage-MenuBackground";
    return v1.createElement("ImageButton", {
        LayoutOrder = v13.LayoutOrder, 
        Size = v12, 
        [v1.Event.Activated] = v13.OnActivated, 
        [v1.Event.MouseEnter] = v14, 
        [v1.Event.MouseLeave] = v15, 
        [v1.Tag] = l_joinTags_0("X-Row X-Left X-PadL StartPage-RoundedCorner8", v17)
    }, {
        Icon = v1.createElement("Frame", {
            [v1.Tag] = "X-FitX X-Left X-Middle X-Transparent"
        }, {
            v1.createElement(l_Image_0, {
                [v1.Tag] = v13.Page.Tag
            })
        }), 
        Label = v1.createElement("Frame", {
            [v1.Tag] = "X-FitX X-Left X-Middle X-Transparent"
        }, {
            v1.createElement("TextLabel", {
                Text = v16:getText("Plugin", v13.Page.TextKey), 
                TextXAlignment = Enum.TextXAlignment.Left, 
                [v1.Tag] = "X-Fit X-Pad StartPage-TextColor X-Transparent StartPage-FontBold StartPage-TextSize"
            })
        })
    });
end;
return function(v19) --[[ Line: 88 ]] --[[ Name: PageMenu ]]
    -- upvalues: l_Localization_0 (copy), l_counter_0 (copy), v9 (copy), v6 (copy), v1 (copy), v18 (copy), l_joinTags_0 (copy), l_Image_0 (copy), v8 (copy)
    local v20 = l_Localization_0:use();
    local v21 = l_counter_0();
    local v22, v23 = v9("PointingHand");
    local v24 = {};
    for v25, v26 in v19.Pages do
        if v6 then
            table.insert(v24, v1.createElement(v18, {
                LayoutOrder = v25, 
                Page = v26, 
                Selected = v19.SelectedPage == v26, 
                OnActivated = function() --[[ Line: 104 ]] --[[ Name: OnActivated ]]
                    -- upvalues: v19 (copy), v26 (copy)
                    v19.OnPageSwap(v26);
                end
            }));
        else
            local v27 = v26 == v19.SelectedPage and "StartPage-Selected" or "StartPage-MenuBackground";
            table.insert(v24, (v1.createElement("ImageButton", {
                LayoutOrder = v25, 
                Size = UDim2.new(0, 259, 0, 48), 
                [v1.Event.Activated] = function() --[[ Line: 118 ]]
                    -- upvalues: v19 (copy), v26 (copy)
                    v19.OnPageSwap(v26);
                end, 
                [v1.Event.MouseEnter] = v22, 
                [v1.Event.MouseLeave] = v23, 
                [v1.Tag] = l_joinTags_0("X-Row X-Left X-PadL StartPage-RoundedCorner8", v27)
            }, {
                Icon = v1.createElement("Frame", {
                    [v1.Tag] = "X-FitX X-Left X-Middle X-Transparent"
                }, {
                    v1.createElement(l_Image_0, {
                        [v1.Tag] = v26.Tag
                    })
                }), 
                Label = v1.createElement("Frame", {
                    [v1.Tag] = "X-FitX X-Left X-Middle X-Transparent"
                }, {
                    v1.createElement("TextLabel", {
                        Text = v20:getText("Plugin", v26.TextKey), 
                        TextXAlignment = Enum.TextXAlignment.Left, 
                        [v1.Tag] = "X-Fit X-Pad StartPage-TextColor X-Transparent StartPage-FontBold StartPage-TextSize"
                    })
                })
            })));
        end;
    end;
    return v1.createElement("Frame", {
        Position = v19.Position, 
        Size = v19.Size, 
        [v1.Tag] = "X-Pad X-Top X-Left X-Corner StartPage-MenuBackground"
    }, {
        v1.createElement("Frame", {
            Position = UDim2.new(0, 12, 0, 12), 
            Size = UDim2.new(1, -64, 1, -64), 
            [v1.Tag] = "X-Fit X-Column X-Transparent"
        }, {
            NewButton = v1.createElement("Frame", {
                Size = UDim2.new(1, 0, 0, 80), 
                LayoutOrder = v21(), 
                [v1.Tag] = "X-Transparent"
            }, {
                v1.createElement(v8, {
                    Size = UDim2.new(0, 259, 0, 48)
                })
            }), 
            Pages = v1.createElement("Frame", {
                LayoutOrder = v21(), 
                [v1.Tag] = "X-Fit X-Top X-Left X-ColumnS X-Transparent"
            }, v24)
        })
    });
end;