local l_Parent_0 = script.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Packages.Rodux);
local v2 = require(l_Parent_0.Packages.Cryo);
local v3 = require(l_Parent_0.Src.Symbols.DraftState);
local v4 = require(l_Parent_0.Src.Symbols.CommitState);
local v5 = require(l_Parent_0.Src.Symbols.AutosaveState);
local function _(v6) --[[ Line: 15 ]] --[[ Name: getDraftDefaultState ]]
    -- upvalues: v3 (copy), v4 (copy), v5 (copy)
    return {
        [v3.Outdated] = false, 
        [v3.Deleted] = v6.Parent == nil, 
        [v3.Committed] = v4.Uncommitted, 
        [v3.Autosaved] = v5.Saved
    };
end;
return (v1.createReducer({}, {
    DraftAddedAction = function(v8, v9) --[[ Line: 25 ]] --[[ Name: DraftAddedAction ]]
        -- upvalues: v2 (copy), v3 (copy), v4 (copy), v5 (copy)
        local l_Draft_0 = v9.Draft;
        return v2.Dictionary.join(v8, {
            [l_Draft_0] = {
                [v3.Outdated] = false, 
                [v3.Deleted] = l_Draft_0.Parent == nil, 
                [v3.Committed] = v4.Uncommitted, 
                [v3.Autosaved] = v5.Saved
            }
        });
    end, 
    DraftRemovedAction = function(v11, v12) --[[ Line: 33 ]] --[[ Name: DraftRemovedAction ]]
        -- upvalues: v2 (copy)
        local l_Draft_1 = v12.Draft;
        return v2.Dictionary.join(v11, {
            [l_Draft_1] = v2.None
        });
    end, 
    DraftsLoadedAction = function(v14, v15) --[[ Line: 41 ]] --[[ Name: DraftsLoadedAction ]]
        -- upvalues: v3 (copy), v4 (copy), v5 (copy), v2 (copy)
        local l_Drafts_0 = v15.Drafts;
        local v17 = {};
        for _, v19 in ipairs(l_Drafts_0) do
            v17[v19] = {
                [v3.Outdated] = false, 
                [v3.Deleted] = v19.Parent == nil, 
                [v3.Committed] = v4.Uncommitted, 
                [v3.Autosaved] = v5.Saved
            };
        end;
        return v2.Dictionary.join(v14, v17);
    end, 
    DraftStateChangedAction = function(v20, v21) --[[ Line: 52 ]] --[[ Name: DraftStateChangedAction ]]
        -- upvalues: v2 (copy)
        local l_Draft_2 = v21.Draft;
        local l_StateType_0 = v21.StateType;
        local l_StateValue_0 = v21.StateValue;
        if v20[l_Draft_2] == nil then
            return v20;
        else
            return v2.Dictionary.join(v20, {
                [l_Draft_2] = v2.Dictionary.join(v20[l_Draft_2], {
                    [l_StateType_0] = l_StateValue_0
                })
            });
        end;
    end
}));