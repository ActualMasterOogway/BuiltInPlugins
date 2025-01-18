local l_Parent_0 = script.Parent.Parent.Parent;
local l_Packages_0 = l_Parent_0.Packages;
local v2 = require(l_Packages_0.Cryo);
local l_Util_0 = l_Parent_0.Core.Util;
local v4 = require(l_Util_0.Colors);
local v5 = require(l_Util_0.createSignal);
local v6 = require(l_Util_0.wrapStrictTable);
local _ = require(l_Util_0.Images);
local v8 = require(l_Util_0.Test.TestHelpers);
local v9 = {};
v9.__index = v9;
v9.createDummyThemeManager = function() --[[ Line: 16 ]] --[[ Name: createDummyThemeManager ]]
    -- upvalues: v9 (copy), v8 (copy)
    return v9.new({
        getTheme = function() --[[ Line: 19 ]] --[[ Name: getTheme ]]
            return {
                GetColor = function() --[[ Line: 21 ]] --[[ Name: GetColor ]]
                    return Color3.fromRGB(0, 0, 0);
                end
            };
        end, 
        studioStyleGuideColor = v8.createMockStudioStyleGuideColor(), 
        studioStyleGuideModifier = v8.createMockStudioStyleGuideModifier()
    });
end;
v9.new = function(v10) --[[ Line: 37 ]] --[[ Name: new ]]
    -- upvalues: v5 (copy), v6 (copy), v9 (copy)
    local v11 = {
        _externalThemeGetter = v10.getTheme or nil, 
        _externalThemeChangedSignal = v10.themeChanged or nil, 
        _externalThemeChangedConnection = nil, 
        _studioStyleGuideColor = v10.studioStyleGuideColor or Enum.StudioStyleGuideColor, 
        _studioStyleGuideModifier = v10.studioStyleGuideModifier or Enum.StudioStyleGuideModifier, 
        _values = {}, 
        _UILibraryTheme = {}, 
        _signal = v5()
    };
    v11.values = v6(v11._values, "theme");
    setmetatable(v11, v9);
    if v11._externalThemeChangedSignal then
        v11._externalThemeChangedConnection = v11._externalThemeChangedSignal:Connect(function() --[[ Line: 59 ]]
            -- upvalues: v11 (copy)
            v11:_recalculateTheme();
        end);
    end;
    v11:_recalculateTheme();
    return v11;
end;
v9.subscribe = function(v12, ...) --[[ Line: 68 ]] --[[ Name: subscribe ]]
    return v12._signal:subscribe(...);
end;
v9.destroy = function(v13) --[[ Line: 72 ]] --[[ Name: destroy ]]
    if v13._externalThemeChangedConnection then
        v13._externalThemeChangedConnection:Disconnect();
        v13._externalThemeChangedConnection = nil;
    end;
end;
v9._update = function(v14, v15) --[[ Line: 79 ]] --[[ Name: _update ]]
    -- upvalues: v2 (copy), v6 (copy)
    v14._values = v2.Dictionary.join(v14._values, v15);
    v14.values = v6(v14._values, "theme");
    v14._signal:fire(v14.values, v14._UILibraryTheme);
end;
v9._getExternalTheme = function(v16) --[[ Line: 85 ]] --[[ Name: _getExternalTheme ]]
    local l__externalThemeGetter_0 = v16._externalThemeGetter;
    if type(l__externalThemeGetter_0) == "function" then
        return l__externalThemeGetter_0();
    else
        return l__externalThemeGetter_0;
    end;
end;
v9._isDarkerTheme = function(v18) --[[ Line: 95 ]] --[[ Name: _isDarkerTheme ]]
    local v19 = false;
    if v18._externalThemeGetter then
        v19 = v18._externalThemeGetter().Name == "Dark";
    end;
    return v19;
end;
v9._recalculateTheme = function(v20) --[[ Line: 105 ]] --[[ Name: _recalculateTheme ]]
    -- upvalues: v4 (copy)
    local v21 = v20:_getExternalTheme();
    local v22 = v20:_isDarkerTheme();
    local l__studioStyleGuideColor_0 = v20._studioStyleGuideColor;
    local l__studioStyleGuideModifier_0 = v20._studioStyleGuideModifier;
    local function v25(...) --[[ Line: 113 ]] --[[ Name: color ]]
        -- upvalues: v21 (copy)
        return v21:GetColor(...);
    end;
    v20:_update({
        isDarkerTheme = v22, 
        assetConfig = {
            backgroundColor = v25(l__studioStyleGuideColor_0.MainBackground), 
            textColor = v25(l__studioStyleGuideColor_0.MainText), 
            labelTextColor = v25(l__studioStyleGuideColor_0.DimmedText), 
            separatorColor = v25(l__studioStyleGuideColor_0.Border), 
            errorColor = v25(l__studioStyleGuideColor_0.ErrorText), 
            packagePermissions = {
                backgroundColor = v25(l__studioStyleGuideColor_0.MainBackground), 
                subTextColor = v25(l__studioStyleGuideColor_0.SubText), 
                collaboratorItem = {
                    collapseStateArrow = v22 and Color3.fromRGB(204, 204, 204) or Color3.fromRGB(25, 25, 25), 
                    deleteButton = v22 and Color3.fromRGB(136, 136, 136) or Color3.fromRGB(184, 184, 184)
                }, 
                searchBar = {
                    border = v25(l__studioStyleGuideColor_0.InputFieldBorder), 
                    borderHover = v22 and v25(l__studioStyleGuideColor_0.MainButton) or v25(l__studioStyleGuideColor_0.CurrentMarker), 
                    borderSelected = v22 and v25(l__studioStyleGuideColor_0.MainButton) or v25(l__studioStyleGuideColor_0.CurrentMarker), 
                    placeholderText = v25(l__studioStyleGuideColor_0.DimmedText), 
                    backgroundColor = v25(l__studioStyleGuideColor_0.InputFieldBackground), 
                    searchIcon = v25(l__studioStyleGuideColor_0.SubText), 
                    clearButton = {
                        image = v25(l__studioStyleGuideColor_0.SubText)
                    }, 
                    dropDown = {
                        backgroundColor = v25(l__studioStyleGuideColor_0.InputFieldBackground), 
                        itemText = v25(l__studioStyleGuideColor_0.MainText), 
                        headerText = v25(l__studioStyleGuideColor_0.SubText), 
                        hovered = {
                            backgroundColor = v25(l__studioStyleGuideColor_0.Item, l__studioStyleGuideModifier_0.Hover), 
                            itemText = v25(l__studioStyleGuideColor_0.ButtonText, l__studioStyleGuideModifier_0.Hover)
                        }, 
                        selected = {
                            backgroundColor = v25(l__studioStyleGuideColor_0.Button, l__studioStyleGuideModifier_0.Selected)
                        }
                    }
                }
            }
        }, 
        publishAsset = {
            backgroundColor = v22 and v25(l__studioStyleGuideColor_0.MainBackground) or Color3.fromRGB(46, 46, 46), 
            titleTextColor = v25(l__studioStyleGuideColor_0.SubText), 
            textColor = v25(l__studioStyleGuideColor_0.MainText), 
            tipsTextColor = v22 and Color3.fromRGB(102, 102, 102) or v4.GRAY_3
        }, 
        divider = {
            horizontalLineColor = v22 and Color3.fromRGB(34, 34, 34) or Color3.fromRGB(227, 227, 227)
        }, 
        dropdownMenu = {
            currentSelection = {
                backgroundColor = v25(l__studioStyleGuideColor_0.Dropdown), 
                backgroundSelectedColor = v25(l__studioStyleGuideColor_0.CurrentMarker), 
                borderColor = v25(l__studioStyleGuideColor_0.Border), 
                borderSelectedColor = v25(l__studioStyleGuideColor_0.CurrentMarker), 
                textColor = v25(l__studioStyleGuideColor_0.MainText), 
                textSelectedColor = v25(l__studioStyleGuideColor_0.MainText, l__studioStyleGuideModifier_0.Selected), 
                iconColor = v22 and Color3.fromRGB(242, 242, 242) or Color3.fromRGB(25, 25, 25), 
                iconSelectedColor = Color3.fromRGB(255, 255, 255)
            }, 
            item = {
                backgroundColor = v25(l__studioStyleGuideColor_0.Item), 
                backgroundSelectedColor = v22 and v25(l__studioStyleGuideColor_0.Item, l__studioStyleGuideModifier_0.Selected) or v25(l__studioStyleGuideColor_0.Tab), 
                selectedBarColor = v25(l__studioStyleGuideColor_0.CurrentMarker), 
                textColor = v25(l__studioStyleGuideColor_0.MainText), 
                labelTextColor = v25(l__studioStyleGuideColor_0.DimmedText)
            }, 
            dropdownFrame = {
                borderColor = v25(l__studioStyleGuideColor_0.Border)
            }
        }, 
        textField = {
            backgroundColor = v25(l__studioStyleGuideColor_0.MainBackground), 
            borderColor = v25(l__studioStyleGuideColor_0.Border), 
            borderHoveredColor = v25(l__studioStyleGuideColor_0.CurrentMarker), 
            borderSelectedColor = v4.BLUE_PRIMARY
        }, 
        footer = {
            backgroundColor = v25(l__studioStyleGuideColor_0.MainBackground), 
            borderColor = v25(l__studioStyleGuideColor_0.Border)
        }, 
        scrollingFrame = {
            scrollbarBackgroundColor = v22 and Color3.fromRGB(41, 41, 41) or Color3.fromRGB(245, 245, 245), 
            scrollbarImageColor = v22 and Color3.fromRGB(85, 85, 85) or Color3.fromRGB(245, 245, 245)
        }, 
        messageBox = {
            backgroundColor = v25(l__studioStyleGuideColor_0.MainBackground), 
            textColor = v25(l__studioStyleGuideColor_0.MainText), 
            informativeTextColor = v25(l__studioStyleGuideColor_0.SubText), 
            button = {
                textColor = v25(l__studioStyleGuideColor_0.MainText), 
                textSelectedColor = v25(l__studioStyleGuideColor_0.MainText, l__studioStyleGuideModifier_0.Selected), 
                backgroundColor = v25(l__studioStyleGuideColor_0.MainBackground), 
                backgroundSelectedColor = v25(l__studioStyleGuideColor_0.CurrentMarker), 
                borderColor = v25(l__studioStyleGuideColor_0.Border), 
                borderSelectedColor = v25(l__studioStyleGuideColor_0.CurrentMarker)
            }
        }, 
        cancelButton = {
            ButtonColor = v25(l__studioStyleGuideColor_0.Button), 
            ButtonColor_Hover = v25(l__studioStyleGuideColor_0.Button, l__studioStyleGuideModifier_0.Hover), 
            ButtonColor_Disabled = v25(l__studioStyleGuideColor_0.Button, l__studioStyleGuideModifier_0.Disabled), 
            TextColor = v25(l__studioStyleGuideColor_0.MainText), 
            TextColor_Disabled = v25(l__studioStyleGuideColor_0.DimmedText), 
            BorderColor = v25(l__studioStyleGuideColor_0.Border)
        }, 
        defaultButton = {
            ButtonColor = v22 and v25(l__studioStyleGuideColor_0.MainButton) or v25(l__studioStyleGuideColor_0.CurrentMarker), 
            ButtonColor_Hover = v25(l__studioStyleGuideColor_0.LinkText), 
            ButtonColor_Disabled = v22 and v25(l__studioStyleGuideColor_0.Button, l__studioStyleGuideModifier_0.Disabled) or v4.BLUE_DISABLED, 
            TextColor = Color3.new(1, 1, 1), 
            TextColor_Disabled = v22 and v25(l__studioStyleGuideColor_0.ButtonText, l__studioStyleGuideModifier_0.Disabled) or Color3.new(1, 1, 1), 
            BorderColor = v25(l__studioStyleGuideColor_0.Light)
        }, 
        loading = {
            text = v25(l__studioStyleGuideColor_0.MainText), 
            backgroundBar = v25(l__studioStyleGuideColor_0.Midlight), 
            bar = v25(l__studioStyleGuideColor_0.CurrentMarker)
        }, 
        uploadResult = {
            greenText = Color3.fromRGB(2, 183, 87), 
            redText = Color3.fromRGB(255, 68, 68), 
            text = v25(l__studioStyleGuideColor_0.MainText), 
            buttonColor = v22 and v25(l__studioStyleGuideColor_0.MainText) or v25(l__studioStyleGuideColor_0.DimmedText), 
            idText = v25(l__studioStyleGuideColor_0.DimmedText), 
            background = v25(l__studioStyleGuideColor_0.TableItem), 
            link = v25(l__studioStyleGuideColor_0.LinkText)
        }, 
        inputFields = {
            backgroundColor = v25(l__studioStyleGuideColor_0.InputFieldBackground), 
            backgroundColorDisabled = v25(l__studioStyleGuideColor_0.InputFieldBackground, l__studioStyleGuideModifier_0.Disabled), 
            borderColorActive = v25(l__studioStyleGuideColor_0.InputFieldBorder, l__studioStyleGuideModifier_0.Selected), 
            borderColorDisabled = v25(l__studioStyleGuideColor_0.InputFieldBorder, l__studioStyleGuideModifier_0.Disabled), 
            borderColor = v25(l__studioStyleGuideColor_0.InputFieldBorder), 
            toolTip = v25(l__studioStyleGuideColor_0.DimmedText), 
            error = v25(l__studioStyleGuideColor_0.ErrorText)
        }, 
        tags = {
            textColor = v25(l__studioStyleGuideColor_0.MainText), 
            backgroundColor = v25(l__studioStyleGuideColor_0.MainBackground), 
            borderColor = v25(l__studioStyleGuideColor_0.InputFieldBorder)
        }
    });
end;
return v9;