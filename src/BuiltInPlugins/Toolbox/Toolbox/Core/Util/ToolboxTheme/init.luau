local l_Parent_0 = script.Parent.Parent.Parent;
local l_Packages_0 = l_Parent_0.Packages;
local v2 = require(l_Packages_0.Cryo);
local l_Util_0 = l_Parent_0.Core.Util;
local v4 = require(l_Util_0.Colors);
local v5 = require(l_Util_0.createSignal);
local v6 = require(l_Util_0.wrapStrictTable);
local _ = require(l_Util_0.Images);
local _ = require(l_Util_0.Constants);
local v9 = require(l_Util_0.Test.TestHelpers);
local v10 = {};
v10.__index = v10;
v10.createDummyThemeManager = function() --[[ Line: 17 ]] --[[ Name: createDummyThemeManager ]]
    -- upvalues: v10 (copy), v9 (copy)
    return v10.new({
        getTheme = {
            GetColor = function() --[[ Line: 21 ]] --[[ Name: GetColor ]]
                return Color3.new(math.random(), math.random(), math.random());
            end
        }, 
        studioStyleGuideColor = v9.createMockStudioStyleGuideColor(), 
        studioStyleGuideModifier = v9.createMockStudioStyleGuideModifier()
    });
end;
v10.new = function(v11) --[[ Line: 36 ]] --[[ Name: new ]]
    -- upvalues: v5 (copy), v6 (copy), v10 (copy)
    local v12 = {
        _externalThemeGetter = v11.getTheme or nil, 
        _isDarkThemeGetter = v11.isDarkerTheme or false, 
        _externalThemeChangedSignal = v11.themeChanged or nil, 
        _studioStyleGuideColor = v11.studioStyleGuideColor or Enum.StudioStyleGuideColor, 
        _studioStyleGuideModifier = v11.studioStyleGuideModifier or Enum.StudioStyleGuideModifier, 
        _externalThemeChangedConnection = nil, 
        _values = {}, 
        _UILibraryTheme = {}, 
        _signal = v5()
    };
    v12.values = v6(v12._values, "theme");
    setmetatable(v12, v10);
    if v12._externalThemeChangedSignal then
        v12._externalThemeChangedConnection = v12._externalThemeChangedSignal:Connect(function() --[[ Line: 59 ]]
            -- upvalues: v12 (copy)
            v12:_recalculateTheme();
        end);
    end;
    v12:_recalculateTheme();
    return v12;
end;
v10.subscribe = function(v13, ...) --[[ Line: 68 ]] --[[ Name: subscribe ]]
    return v13._signal:subscribe(...);
end;
v10.destroy = function(v14) --[[ Line: 72 ]] --[[ Name: destroy ]]
    if v14._externalThemeChangedConnection then
        v14._externalThemeChangedConnection:Disconnect();
        v14._externalThemeChangedConnection = nil;
    end;
end;
v10._update = function(v15, v16) --[[ Line: 79 ]] --[[ Name: _update ]]
    -- upvalues: v2 (copy), v6 (copy)
    v15._values = v2.Dictionary.join(v15._values, v16);
    v15.values = v6(v15._values, "theme");
    v15._signal:fire(v15.values, v15._UILibraryTheme);
end;
v10._getExternalTheme = function(v17) --[[ Line: 85 ]] --[[ Name: _getExternalTheme ]]
    local l__externalThemeGetter_0 = v17._externalThemeGetter;
    if type(l__externalThemeGetter_0) == "function" then
        return l__externalThemeGetter_0();
    else
        return l__externalThemeGetter_0;
    end;
end;
v10._isDarkerTheme = function(v19) --[[ Line: 95 ]] --[[ Name: _isDarkerTheme ]]
    local l__isDarkThemeGetter_0 = v19._isDarkThemeGetter;
    if type(l__isDarkThemeGetter_0) == "function" then
        return l__isDarkThemeGetter_0(v19:_getExternalTheme());
    elseif l__isDarkThemeGetter_0 then
        return true;
    else
        return false;
    end;
end;
v10._recalculateTheme = function(v21) --[[ Line: 105 ]] --[[ Name: _recalculateTheme ]]
    -- upvalues: v4 (copy)
    local v22 = v21:_getExternalTheme();
    local v23 = v21:_isDarkerTheme();
    local l__studioStyleGuideColor_0 = v21._studioStyleGuideColor;
    local l__studioStyleGuideModifier_0 = v21._studioStyleGuideModifier;
    local function v26(...) --[[ Line: 113 ]] --[[ Name: color ]]
        -- upvalues: v22 (copy)
        return v22:GetColor(...);
    end;
    v21:_update({
        isDarkerTheme = v23, 
        linkButton = {
            textColor = Color3.fromRGB(0, 162, 255)
        }, 
        toolbox = {
            backgroundColor = v26(l__studioStyleGuideColor_0.MainBackground)
        }, 
        loading = {
            text = v26(l__studioStyleGuideColor_0.MainText), 
            backgroundBar = v26(l__studioStyleGuideColor_0.Midlight), 
            bar = v26(l__studioStyleGuideColor_0.CurrentMarker)
        }, 
        searchBar = {
            backgroundColor = v26(l__studioStyleGuideColor_0.Dropdown), 
            liveBackgroundColor = v26(l__studioStyleGuideColor_0.InputFieldBackground), 
            borderColor = v26(l__studioStyleGuideColor_0.Border), 
            borderHoveredColor = v26(l__studioStyleGuideColor_0.CurrentMarker), 
            borderSelectedColor = v4.BLUE_PRIMARY, 
            textColor = v26(l__studioStyleGuideColor_0.MainText), 
            placeholderTextColor = v26(l__studioStyleGuideColor_0.DimmedText), 
            divideLineColor = v26(l__studioStyleGuideColor_0.Border), 
            searchButton = {
                imageColor = Color3.fromRGB(184, 184, 184), 
                imageSelectedColor = Color3.fromRGB(0, 162, 255)
            }, 
            clearButton = {
                imageColor = Color3.fromRGB(184, 184, 184), 
                imageSelectedColor = Color3.fromRGB(0, 162, 255)
            }
        }, 
        asset = {
            icon = {
                borderColor = v26(l__studioStyleGuideColor_0.Item, l__studioStyleGuideModifier_0.Hover)
            }, 
            progressBarColor = v4.BLUE_PRIMARY
        }, 
        infoBanner = {
            backgroundColor = v26(l__studioStyleGuideColor_0.Titlebar), 
            textColor = v26(l__studioStyleGuideColor_0.SubText)
        }, 
        tooltip = {
            backgroundColor = v26(l__studioStyleGuideColor_0.MainBackground), 
            borderColor = v26(l__studioStyleGuideColor_0.Border), 
            textColor = v26(l__studioStyleGuideColor_0.MainText)
        }, 
        sortComponent = {
            labelTextColor = v26(l__studioStyleGuideColor_0.MainText)
        }, 
        radioButton = {
            textColor = v26(l__studioStyleGuideColor_0.MainText), 
            background = v26(l__studioStyleGuideColor_0.InputFieldBackground)
        }
    });
end;
return v10;