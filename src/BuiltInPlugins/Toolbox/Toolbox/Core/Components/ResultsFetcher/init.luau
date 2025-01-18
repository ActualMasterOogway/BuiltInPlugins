local l_script_FirstAncestor_0 = script:FindFirstAncestor("Toolbox");
local l_Packages_0 = l_script_FirstAncestor_0.Packages;
local v2 = require(l_Packages_0.Roact);
local v3 = require(l_Packages_0.RoactRodux);
local v4 = require(l_Packages_0.Framework);
local l_deepEqual_0 = v4.Util.deepEqual;
local v6 = require(l_Packages_0.Dash);
local v7 = require(l_Packages_0.Cryo);
local l_Math_0 = v4.Util.Math;
local v9 = require(l_script_FirstAncestor_0.Core.Util.getUserId);
local _ = require(l_script_FirstAncestor_0.Core.Util.Constants);
local v11 = require(l_script_FirstAncestor_0.Core.Util.DebugFlags);
local _ = require(l_script_FirstAncestor_0.Core.Networking.NetworkInterface);
local _ = require(l_script_FirstAncestor_0.Libs.Http.HttpResponse);
local v14 = require(l_script_FirstAncestor_0.Core.Models.AssetInfo);
local _ = require(l_script_FirstAncestor_0.Core.Types.HomeTypes);
local l_Actions_0 = l_script_FirstAncestor_0.Core.Actions;
local v17 = require(l_Actions_0.GetAssetsVotingData);
local v18 = require(l_script_FirstAncestor_0.Core.Flags.getFFlagQualityFiltersInToolboxSearch);
local v19 = v2.PureComponent:extend("ResultsFetcher");
v19.init = function(v20, _) --[[ Line: 68 ]] --[[ Name: init ]]
    v20.loadingMutex = false;
    v20.fetchNextPage = function(v22) --[[ Line: 71 ]]
        -- upvalues: v20 (copy)
        v20:fetchResults({
            pageSize = v22
        });
    end;
    local v23 = {
        loading = false, 
        error = nil, 
        total = nil, 
        fetchNextPage = nil, 
        assets = {}, 
        assetMap = {}, 
        assetIds = {}, 
        nextPageCursor = nil
    };
    v20.INITIAL_RESULTS_STATE = table.freeze(v23);
    v20.state = v20.INITIAL_RESULTS_STATE;
end;
v19.didUpdate = function(v24, v25) --[[ Line: 90 ]] --[[ Name: didUpdate ]]
    -- upvalues: v6 (copy), l_deepEqual_0 (copy)
    local function v28(_, v27) --[[ Line: 91 ]]
        return v27 ~= "render";
    end;
    local v29 = v6.filter(v25, v28);
    local v30 = v6.filter(v24.props, v28);
    if not l_deepEqual_0(v29, v30) then
        v24.canceled = v24.loadingMutex;
        v24.loadingMutex = false;
        v24:fetchResults({
            initialPage = true
        });
    end;
end;
v19.fetchResults = function(v31, v32) --[[ Line: 105 ]] --[[ Name: fetchResults ]]
    -- upvalues: v7 (copy), v6 (copy), v2 (copy), v9 (copy), v18 (copy), v14 (copy), l_Math_0 (copy), v11 (copy)
    local l_props_0 = v31.props;
    local l_networkInterface_0 = l_props_0.networkInterface;
    local v35 = v32 and v32.pageSize or l_props_0.initialPageSize;
    local l_state_0 = v31.state;
    local v37 = if v32.initialPage then nil else l_state_0.nextPageCursor;
    if not v32.initialPage and (v37 == nil or v37 == v7.None) then
        return;
    elseif v31.loadingMutex then
        return;
    else
        v31.loadingMutex = true;
        v31:setState(function() --[[ Line: 123 ]]
            -- upvalues: v32 (copy), v6 (ref), v31 (copy), v2 (ref)
            local v38 = if v32.initialPage then v6.join(v31.INITIAL_RESULTS_STATE) else {};
            v38.loading = true;
            v38.error = v2.None;
            v38.fetchNextPage = v2.None;
            return v38;
        end);
        local function v64() --[[ Line: 131 ]]
            -- upvalues: v31 (copy), l_networkInterface_0 (copy), l_props_0 (copy), v9 (ref), v37 (copy), v35 (copy), v18 (ref), v14 (ref), v6 (ref), l_Math_0 (ref), v11 (ref), v2 (ref), v32 (copy), v7 (ref)
            local l_includeUnverifiedCreators_0 = v31.props.includeUnverifiedCreators;
            local v40 = nil;
            local v42 = l_networkInterface_0:getToolboxItems({
                categoryName = l_props_0.categoryName, 
                sectionName = l_props_0.sectionName, 
                keyword = l_props_0.searchTerm, 
                ownerId = v9(), 
                sortType = l_props_0.sortName, 
                tags = l_props_0.tags, 
                cursor = v37, 
                limit = v35, 
                includeOnlyVerifiedCreators = not l_includeUnverifiedCreators_0, 
                queryParams = l_props_0.queryParams, 
                searchSource = l_props_0.searchSource, 
                assetsInCameraViewport = l_props_0.assetsInCameraViewport, 
                assetsInCameraVicinity = l_props_0.assetsInCameraVicinity, 
                qualityFilterData = if v18() then l_props_0.qualityFilterData else nil
            }):catch(function(v41) --[[ Line: 152 ]]
                -- upvalues: v40 (ref), v31 (ref)
                v40 = true;
                v31.loadingMutex = false;
                v31:setState(function() --[[ Line: 155 ]]
                    -- upvalues: v41 (copy)
                    return {
                        loading = false, 
                        error = {
                            error = v41
                        }
                    };
                end);
            end):await();
            if v40 then
                return;
            else
                local l_responseBody_0 = v42.responseBody;
                local v44 = {};
                local v45 = {};
                for _, v47 in ipairs(l_responseBody_0.data) do
                    table.insert(v44, v47.id);
                    if v47.id then
                        v45[v47.id] = {
                            searchResultSource = v47.searchResultSource
                        };
                    end;
                end;
                local v49 = l_networkInterface_0:getItemDetailsAssetIds(v44):catch(function(v48) --[[ Line: 180 ]]
                    -- upvalues: v40 (ref), v31 (ref)
                    v40 = true;
                    v31.loadingMutex = false;
                    v31:setState(function() --[[ Line: 183 ]]
                        -- upvalues: v48 (copy)
                        return {
                            loading = false, 
                            error = {
                                error = v48
                            }
                        };
                    end);
                end):await();
                if v40 then
                    return;
                else
                    local l_responseBody_1 = v49.responseBody;
                    local v51 = {};
                    for _, v53 in pairs(l_responseBody_1.data) do
                        local v54 = v14.fromItemDetailsRequest(v53);
                        if v53.Asset and v53.Asset.id then
                            v54 = v14.AddContextToItemDetails(v54, v45[v53.Asset.id]);
                        end;
                        if v54.Asset then
                            v51[v54.Asset.Id] = v54;
                        end;
                    end;
                    v31.loadingMutex = false;
                    if v31.canceled then
                        v31.canceled = false;
                        return;
                    else
                        v31:setState(function(v55) --[[ Line: 216 ]]
                            -- upvalues: v6 (ref), v44 (copy), v51 (copy), l_Math_0 (ref), v35 (ref), v45 (copy), v11 (ref), v2 (ref), v32 (ref), v42 (copy), v31 (ref), v7 (ref)
                            local v56 = {
                                assetIds = v6.append({}, v55.assetIds, v44), 
                                assetMap = v6.join(v55.assetMap, v51)
                            };
                            local v57 = #v55.assets;
                            local v58 = {};
                            for v59, v60 in ipairs(v44) do
                                local v61 = v51[v60];
                                local v62 = v57 + v59;
                                local v63 = l_Math_0.round(v57 / v35) + 1;
                                if v61 then
                                    v61.Context = {
                                        page = v63, 
                                        pagePosition = v59, 
                                        position = v62, 
                                        searchResultSource = if v45[v60] then v45[v60].searchResultSource else nil
                                    };
                                    v58[v59] = v61;
                                elseif v11.shouldDebugWarnings() then
                                    warn((("asset with ID %* not found in asset map"):format(v60)));
                                end;
                            end;
                            v56.assets = v6.append({}, v55.assets, v58);
                            v56.loading = false;
                            v56.error = v2.None;
                            v56.total = v32.initialPage and v42.responseBody.totalResults or nil;
                            v56.nextPageCursor = v42.responseBody.nextPageCursor;
                            v56.fetchNextPage = v31.fetchNextPage;
                            if v56.nextPageCursor == nil then
                                v56.nextPageCursor = v7.None;
                            end;
                            if v31.props.dispatchGetAssetsVotingData then
                                v31.props.dispatchGetAssetsVotingData(v56.assets);
                            end;
                            return v56;
                        end);
                        return;
                    end;
                end;
            end;
        end;
        task.spawn(function() --[[ Line: 264 ]]
            -- upvalues: v64 (copy), v31 (copy)
            local l_status_0, l_result_0 = pcall(v64);
            if not l_status_0 then
                v31.loadingMutex = false;
                v31:setState(function() --[[ Line: 268 ]]
                    -- upvalues: l_result_0 (copy)
                    return {
                        loading = false, 
                        error = {
                            message = tostring(l_result_0)
                        }
                    };
                end);
            end;
        end);
        return;
    end;
end;
v19.render = function(v67) --[[ Line: 278 ]] --[[ Name: render ]]
    return v67.props.render(v67.state);
end;
v19.didMount = function(v68) --[[ Line: 282 ]] --[[ Name: didMount ]]
    v68:fetchResults({
        initialPage = true
    });
end;
local v69 = v2.PureComponent:extend("ResultsFetcherRoduxWrapper");
v69.render = function(v70) --[[ Line: 288 ]] --[[ Name: render ]]
    -- upvalues: v2 (copy), v19 (copy)
    return v2.createElement(v19, v70.props);
end;
local function v73(v71) --[[ Line: 292 ]] --[[ Name: mapDispatchToProps ]]
    -- upvalues: v17 (copy)
    return {
        dispatchGetAssetsVotingData = function(v72) --[[ Line: 294 ]] --[[ Name: dispatchGetAssetsVotingData ]]
            -- upvalues: v71 (copy), v17 (ref)
            v71(v17(v72));
        end
    };
end;
TypedResultsFetcher = function(v74, v75) --[[ Line: 300 ]] --[[ Name: TypedResultsFetcher ]]
    -- upvalues: v2 (copy), v69 (ref)
    return v2.createElement(v69, v74, v75);
end;
NoRoduxTypedResultsFetcher = function(v76, v77) --[[ Line: 304 ]] --[[ Name: NoRoduxTypedResultsFetcher ]]
    -- upvalues: v2 (copy), v19 (copy)
    return v2.createElement(v19, v76, v77);
end;
v69 = v3.connect(nil, v73)(v69);
return {
    Component = v19, 
    Generator = TypedResultsFetcher, 
    NoRoduxGenerator = NoRoduxTypedResultsFetcher
};