local l_Parent_0 = script.Parent.Parent;
local l_Parent_1 = script.Parent.Parent.Parent.Parent;
local v2 = require(l_Parent_1.Packages.Roact);
local v3 = require(l_Parent_0.Util.StateModelTemplate);
local v4 = require(l_Parent_0.Components.AvatarUpdater);
local v5 = require(l_Parent_0.Components.MorpherTemplateContainer);
local v6 = v2.Component:extend("ComponentRootPanelExternal");
local v7 = nil;
v6.init = function(v8) --[[ Line: 14 ]] --[[ Name: init ]]
    -- upvalues: v2 (copy)
    local v9, v10 = v2.createBinding(0);
    v8.absoluteSizeChange = v9;
    v8.updateAbsoluteSizeChange = v10;
end;
v6.render = function(v11) --[[ Line: 18 ]] --[[ Name: render ]]
    -- upvalues: v3 (copy), v2 (copy), v5 (copy), v7 (ref), v4 (copy)
    local v12 = {
        templates = {
            v3.fromUniverseData(v11.props)
        }
    };
    local l_ThemeData_0 = v11.props.ThemeData;
    return v2.createElement("Frame", {
        Size = v11.absoluteSizeChange:map(function(v14) --[[ Line: 23 ]]
            return UDim2.new(1, 0, 0, v14);
        end), 
        BorderSizePixel = 0, 
        BackgroundTransparency = 1
    }, {
        v2.createElement("UIListLayout", {
            [v2.Change.AbsoluteContentSize] = function(v15) --[[ Line: 31 ]]
                -- upvalues: v11 (copy)
                v11.updateAbsoluteSizeChange(v15.AbsoluteContentSize.y);
            end
        }), 
        v2.createElement(v5, {
            ThemeData = {
                theme = l_ThemeData_0
            }, 
            StateTemplates = v12, 
            IsEnabled = v11.props.IsEnabled, 
            IsGameShutdownRequired = v11.props.IsGameShutdownRequired, 
            AssetOverrideErrors = v11.props.AssetOverrideErrors, 
            Mouse = v11.props.Mouse, 
            IsPlacePublished = v11.props.IsPlacePublished, 
            clobberTemplate = function(_, v17) --[[ Line: 46 ]] --[[ Name: clobberTemplate ]]
                -- upvalues: v7 (ref), v11 (copy)
                v7(v11, v17);
            end
        }), 
        if game:GetFastFlag("DisableGameSettingsAvatarPreview") then nil else v2.createElement(v4, {
            StateTemplates = v11.props.StateTemplates
        })
    });
end;
v7 = function(v18, v19) --[[ Line: 58 ]]
    -- upvalues: v3 (copy)
    if v19 and v18.props.IsEnabled then
        local v20 = v3.fromUniverseData(v18.props);
        if not v19:isAvatarTypeEqualTo(v20) then
            v18.props.OnAvatarTypeChanged(v19.RigTypeValue);
        end;
        if not v19:isAnimationEqualTo(v20) then
            v18.props.OnAvatarAnimationChanged(v19.AnimationValue);
        end;
        if not v19:isCollisionEqualTo(v20) then
            v18.props.OnAvatarCollisionChanged(v19.CollisionValue);
        end;
        if not v19:areAssetsEqualTo(v20) then
            v18.props.OnAvatarAssetOverridesChanged(v19:extractAssetOverridesForSaving());
        end;
        if not v19:areMinScalesEqualTo(v20) then
            v18.props.OnAvatarScalingMinChanged(v19:extractScalingMinForSaving());
        end;
        if not v19:areMaxScalesEqualTo(v20) then
            v18.props.OnAvatarScalingMaxChanged(v19:extractScalingMaxForSaving());
        end;
    end;
end;
return v6;