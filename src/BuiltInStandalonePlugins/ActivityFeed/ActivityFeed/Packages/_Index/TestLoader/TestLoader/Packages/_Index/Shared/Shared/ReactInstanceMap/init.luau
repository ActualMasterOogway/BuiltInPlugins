local l_Parent_0 = script.Parent.Parent;
local v1 = require(l_Parent_0.LuauPolyfill);
local l_Error_0 = v1.Error;
local l_inspect_0 = v1.util.inspect;
local v4 = require(script.Parent.getComponentName);
local _ = script:FindFirstAncestor("ReactUtils");
local l___DEV___0 = _G.__DEV__;
local v7 = require(l_Parent_0.SafeFlags).createGetFFlag("ReactInstanceMapDisableErrorChecking")();
local v8 = {};
local function _(v9) --[[ Line: 43 ]] --[[ Name: isValidFiber ]]
    local v10 = false;
    if v9.tag ~= nil then
        v10 = false;
        if v9.subtreeFlags ~= nil then
            v10 = false;
            if v9.lanes ~= nil then
                v10 = v9.childLanes ~= nil;
            end;
        end;
    end;
    return v10;
end;
v8.remove = function(v12) --[[ Line: 50 ]]
    v12._reactInternals = nil;
end;
if not v7 or l___DEV___0 then
    v8.get = function(v13) --[[ Line: 55 ]]
        -- upvalues: l_Error_0 (copy), v4 (copy), l_inspect_0 (copy)
        local l__reactInternals_0 = v13._reactInternals;
        local v15 = false;
        if l__reactInternals_0.tag ~= nil then
            v15 = false;
            if l__reactInternals_0.subtreeFlags ~= nil then
                v15 = false;
                if l__reactInternals_0.lanes ~= nil then
                    v15 = l__reactInternals_0.childLanes ~= nil;
                end;
            end;
        end;
        if not v15 then
            error(l_Error_0.new("invalid fiber in " .. (v4(v13) or "UNNAMED Component") .. " during get from ReactInstanceMap! " .. l_inspect_0(l__reactInternals_0)));
            return l__reactInternals_0;
        else
            if l__reactInternals_0.alternate ~= nil then
                local l_alternate_0 = l__reactInternals_0.alternate;
                v15 = false;
                if l_alternate_0.tag ~= nil then
                    v15 = false;
                    if l_alternate_0.subtreeFlags ~= nil then
                        v15 = false;
                        if l_alternate_0.lanes ~= nil then
                            v15 = l_alternate_0.childLanes ~= nil;
                        end;
                    end;
                end;
                if not v15 then
                    error(l_Error_0.new("invalid alternate fiber (" .. (v4(v13) or "UNNAMED alternate") .. ") in " .. (v4(v13) or "UNNAMED Component") .. " during get from ReactInstanceMap! " .. l_inspect_0(l__reactInternals_0.alternate)));
                end;
            end;
            return l__reactInternals_0;
        end;
    end;
else
    v8.get = function(v17) --[[ Line: 81 ]]
        return v17._reactInternals;
    end;
end;
v8.has = function(v18) --[[ Line: 86 ]]
    return v18._reactInternals ~= nil;
end;
if not v7 or l___DEV___0 then
    v8.set = function(v19, v20) --[[ Line: 91 ]]
        -- upvalues: v4 (copy), l_inspect_0 (copy), l_Error_0 (copy)
        local l_v20_0 = v20;
        local v22 = nil;
        while l_v20_0 ~= nil do
            local l_l_v20_0_0 = l_v20_0;
            local v24 = false;
            if l_l_v20_0_0.tag ~= nil then
                v24 = false;
                if l_l_v20_0_0.subtreeFlags ~= nil then
                    v24 = false;
                    if l_l_v20_0_0.lanes ~= nil then
                        v24 = l_l_v20_0_0.childLanes ~= nil;
                    end;
                end;
            end;
            if not v24 then
                v22 = "invalid fiber in " .. (v4(v19) or "UNNAMED Component") .. " being set in ReactInstanceMap! " .. l_inspect_0(l_v20_0) .. "\n";
                if v20 ~= l_v20_0 then
                    v22 = v22 .. " (from original fiber " .. (v4(v19) or "UNNAMED Component") .. ")";
                end;
                error(l_Error_0.new(v22));
            elseif l_v20_0.alternate ~= nil then
                l_l_v20_0_0 = l_v20_0.alternate;
                v24 = false;
                if l_l_v20_0_0.tag ~= nil then
                    v24 = false;
                    if l_l_v20_0_0.subtreeFlags ~= nil then
                        v24 = false;
                        if l_l_v20_0_0.lanes ~= nil then
                            v24 = l_l_v20_0_0.childLanes ~= nil;
                        end;
                    end;
                end;
                if not v24 then
                    v22 = "invalid alternate fiber (" .. (v4(v19) or "UNNAMED alternate") .. ") in " .. (v4(v19) or "UNNAMED Component") .. " being set in ReactInstanceMap! " .. l_inspect_0(l_v20_0.alternate) .. "\n";
                    if v20 ~= l_v20_0 then
                        v22 = v22 .. " (from original fiber " .. (v4(v19) or "UNNAMED Component") .. ")";
                    end;
                    error(l_Error_0.new(v22));
                end;
            end;
            l_v20_0 = l_v20_0.return_;
        end;
        v19._reactInternals = v20;
    end;
    return v8;
else
    v8.set = function(v25, v26) --[[ Line: 128 ]]
        v25._reactInternals = v26;
    end;
    return v8;
end;