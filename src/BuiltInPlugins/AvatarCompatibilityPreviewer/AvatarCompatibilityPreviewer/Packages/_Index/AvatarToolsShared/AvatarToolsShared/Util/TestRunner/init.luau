local l_Parent_0 = script.Parent.Parent;
local l_Parent_1 = l_Parent_0.Parent;
local v2 = require(l_Parent_1.Roact);
local v3 = require(l_Parent_0.Resources);
local l_Components_0 = l_Parent_0.Components;
local v5 = require(l_Parent_1.Framework);
local l_ContextServices_0 = v5.ContextServices;
local l_Style_0 = v5.Style;
local l_makeTheme_0 = l_Style_0.makeTheme;
local l_StudioTheme_0 = l_Style_0.Themes.StudioTheme;
local l_provideMockContext_0 = v5.TestHelpers.provideMockContext;
local v11 = {};
local function v22(v12, v13, v14) --[[ Line: 21 ]] --[[ Name: run ]]
    -- upvalues: l_StudioTheme_0 (copy), l_makeTheme_0 (copy), l_Components_0 (copy), l_ContextServices_0 (copy), v3 (copy), l_provideMockContext_0 (copy), v2 (copy)
    local v15 = l_StudioTheme_0.mock({}, {});
    local v16 = l_makeTheme_0(l_Components_0, {}, v15)();
    local v17 = l_ContextServices_0.Localization.mock({
        libraries = {
            [v3.LOCALIZATION_PROJECT_NAME] = {
                stringResourceTable = v3.SourceStrings, 
                translationResourceTable = v3.LocalizedStrings
            }
        }
    });
    local v18 = l_provideMockContext_0({
        v16, 
        v17
    }, v12);
    local v19 = v2.mount(v18, v13);
    local l_status_0, l_result_0 = pcall(function() --[[ Line: 40 ]]
        -- upvalues: v14 (copy), v13 (copy)
        if v14 then
            v14(v13);
        end;
    end);
    v2.unmount(v19);
    v13:Destroy();
    if not l_status_0 then
        error(l_result_0);
    end;
end;
v11.runTestMinimal = function(v23) --[[ Line: 54 ]] --[[ Name: runTestMinimal ]]
    local l_status_1, l_result_1 = pcall(function() --[[ Line: 55 ]]
        -- upvalues: v23 (copy)
        if v23 then
            v23();
        end;
    end);
    if not l_status_1 then
        error(l_result_1);
    end;
end;
v11.runComponentTest = function(v26, v27) --[[ Line: 66 ]] --[[ Name: runComponentTest ]]
    -- upvalues: v22 (copy)
    v22({
        test = v26
    }, Instance.new("ScreenGui"), v27);
end;
local function _() --[[ Line: 70 ]] --[[ Name: makeContainer ]]
    local v28 = Instance.new("ScreenGui", game.CoreGui);
    v28.Name = "PluginMockGui";
    v28.ZIndexBehavior = Enum.ZIndexBehavior.Sibling;
    return v28;
end;
return v11;