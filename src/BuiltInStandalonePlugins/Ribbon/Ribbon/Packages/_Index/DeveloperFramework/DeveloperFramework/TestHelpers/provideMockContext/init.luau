local l_Parent_0 = script.Parent.Parent;
local v1 = require(l_Parent_0.ContextServices);
local v2 = require(l_Parent_0.TestHelpers.Instances.MockPlugin);
local v3 = require(l_Parent_0.Parent.Rodux);
local v4 = require(l_Parent_0.Style.Themes.StudioTheme);
local v5 = require(l_Parent_0.Resources);
return function(v6, v7) --[[ Line: 36 ]]
    -- upvalues: v2 (copy), v1 (copy), v5 (copy), v3 (copy), v4 (copy)
    if v6 then
        assert(type(v6) == "table", "Expected contextItemsList to be a table.");
        local v8 = true;
        if type((next(v6))) ~= "number" then
            v8 = type((next(v6))) == "nil";
        end;
        assert(v8, "Expected contextItemsList to be an array.");
    end;
    assert(type(v7) == "table", "Expected children to be a table.");
    assert(type((next(v7))) == "string", "Expected children to be a map of components.");
    local v9 = v2.new();
    local v10 = {};
    local l_ScreenGui_0 = Instance.new("ScreenGui");
    table.insert(v10, (v1.Focus.new(l_ScreenGui_0)));
    table.insert(v10, (v1.Localization.mock({
        libraries = {
            [v5.LOCALIZATION_PROJECT_NAME] = {
                stringResourceTable = v5.SourceStrings, 
                translationResourceTable = v5.LocalizedStrings
            }
        }
    })));
    table.insert(v10, (v1.Mouse.new(v9:GetMouse())));
    table.insert(v10, (v1.Navigation.new({})));
    table.insert(v10, (v1.Analytics.mock()));
    table.insert(v10, (v1.Plugin.new(v9)));
    table.insert(v10, (v1.PluginActions.new(v9, {})));
    local v12 = v3.Store.new(function() --[[ Line: 91 ]]

    end);
    table.insert(v10, (v1.Store.new(v12)));
    table.insert(v10, (v4.mock()));
    table.insert(v10, (v1.Design.mock(Instance.new("StyleSheet"))));
    if v6 then
        for _, v14 in ipairs(v6) do
            table.insert(v10, v14);
        end;
    end;
    return v1.provide(v10, v7);
end;