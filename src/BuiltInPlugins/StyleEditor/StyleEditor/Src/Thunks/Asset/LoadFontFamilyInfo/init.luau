local l_TextService_0 = game:GetService("TextService");
local l_Parent_0 = script.Parent.Parent.Parent.Parent;
local v2 = require(l_Parent_0.Packages.Promise);
local l_startsWith_0 = require(l_Parent_0.Packages.Dash).startsWith;
local _ = require(l_Parent_0.Src.Reducers.RootReducer);
local l_Actions_0 = l_Parent_0.Src.Actions;
local v6 = require(l_Actions_0.Asset.SaveFontMetadata);
local _ = require(l_Parent_0.Src.Types);
local _ = require(l_Parent_0.Src.Thunks.Types);
return function(v9) --[[ Line: 26 ]] --[[ Name: LoadFontFamilyInfo ]]
    -- upvalues: v2 (copy), l_TextService_0 (copy), l_startsWith_0 (copy), v6 (copy)
    return function(v10, _) --[[ Line: 27 ]]
        -- upvalues: v9 (copy), v2 (ref), l_TextService_0 (ref), l_startsWith_0 (ref), v6 (ref)
        local v12 = 0;
        local v13 = #v9;
        local v14 = {};
        for _, v16 in v9 do
            v2.new(function(v17, v18) --[[ Line: 35 ]]
                -- upvalues: l_TextService_0 (ref), v16 (copy), l_startsWith_0 (ref)
                local l_status_0, l_result_0 = pcall(function() --[[ Line: 36 ]]
                    -- upvalues: l_TextService_0 (ref), v16 (ref)
                    return l_TextService_0:GetFamilyInfoAsync(v16);
                end);
                if not l_status_0 then
                    v18({
                        Error = l_result_0
                    });
                    return;
                else
                    local v21 = l_startsWith_0(v16, "rbxasset://");
                    v17({
                        AssetId = v16, 
                        Name = l_result_0.Name, 
                        Builtin = v21, 
                        Faces = l_result_0.Faces
                    });
                    return;
                end;
            end):andThen(function(v22) --[[ Line: 58 ]]
                -- upvalues: v14 (copy)
                v14[v22.AssetId] = v22;
            end):catch(function(v23) --[[ Line: 61 ]]
                warn("Failed to load font family info:", v23);
            end):andThen(function() --[[ Line: 64 ]]
                -- upvalues: v12 (ref), v13 (copy), v10 (copy), v6 (ref), v14 (copy)
                v12 = v12 + 1;
                if v13 <= v12 then
                    v10:dispatch(v6(v14));
                end;
            end);
        end;
    end;
end;