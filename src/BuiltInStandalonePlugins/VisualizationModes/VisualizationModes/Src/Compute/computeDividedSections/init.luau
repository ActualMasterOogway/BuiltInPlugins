local l_script_FirstAncestor_0 = script:FindFirstAncestor("VisualizationModes");
local v1 = require(l_script_FirstAncestor_0.Packages.Framework);
local v2 = require(l_script_FirstAncestor_0.Packages.React);
local _ = require(l_script_FirstAncestor_0.Src.Types);
local v4 = require(l_script_FirstAncestor_0.Src.Components.Sections.VisualizationModeSectionDivider);
local l_LayoutOrderIterator_0 = v1.Util.LayoutOrderIterator;
return function() --[[ Line: 19 ]] --[[ Name: computeDividedSections ]]
    -- upvalues: l_LayoutOrderIterator_0 (copy), v2 (copy), v4 (copy)
    local v6 = l_LayoutOrderIterator_0.new();
    local v7 = {};
    local v8 = {};
    local function _() --[[ Line: 25 ]] --[[ Name: addDivider ]]
        -- upvalues: v7 (copy), v2 (ref), v4 (ref), v6 (copy)
        table.insert(v7, v2.createElement(v4, {
            LayoutOrder = v6:getNextOrder()
        }));
    end;
    local function v11(v10) --[[ Line: 34 ]] --[[ Name: addSection ]]
        -- upvalues: v8 (copy), v6 (copy), v7 (copy), v2 (ref), v4 (ref)
        v8[v10.key] = v10.renderContent(v6:getNextOrder(), v10.visible);
        if v10.visible ~= false then
            table.insert(v7, v2.createElement(v4, {
                LayoutOrder = v6:getNextOrder()
            }));
        end;
    end;
    local function v13() --[[ Line: 42 ]] --[[ Name: getSections ]]
        -- upvalues: v7 (copy), v2 (ref), v8 (copy)
        local v12 = table.clone(v7);
        table.remove(v12);
        return v2.createElement(v2.Fragment, {}, {
            Sections = v2.createElement(v2.Fragment, {}, v8), 
            Dividers = v2.createElement(v2.Fragment, {}, v12)
        });
    end;
    return table.freeze({
        addSection = v11, 
        getSections = v13
    });
end;