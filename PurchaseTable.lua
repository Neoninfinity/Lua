local MarketplaceService = game:GetService("MarketplaceService")
local PurchaseHistory = game:GetService("DataStoreService"):GetDataStore("PurchaseHistory")


--[[
	This is how the table below has to be set up:
		[productId] = function(receipt,player) return allow end
			receipt is the receiptInfo, as called by ProcessReceipt
			player is the player that is doing the purchase
		If your function returns 'true', the purchase is approved.
		If your function doesn't return 'true', or errors, the purchase is cancelled.
--]]
local Products = {
	-- productId 1111 for a heal up
	[38498573] = function(receipt,player)
		-- Give credits and return true indicating successful purchase
		local credits = game.ServerScriptService.CREDITS:FindFirstChild(player.Name)
		local value = credits.plrCRED
		if not credits then return end
		value.Value = value.Value + 1000
		return true
	end;
	-- productId 2222 for 100 gold
	[38498584] = function(receipt,player)
		local credits = game.ServerScriptService.CREDITS:FindFirstChild(player.Name)
		local value = credits.plrCRED
		if not credits then return end
		value.Value = value.Value + 5000
		return true
	end;
	-- productId 3333 for 200 gold
	[38498590] = function(receipt,player)
		-- same thing as above, but now for 200 gold
		local credits = game.ServerScriptService.CREDITS:FindFirstChild(player.Name)
		local value = credits.plrCRED
		if not credits then return end
		value.Value = value.Value + 10000
		return true
	end;
	[38498594] = function(receipt,player)
		-- same thing as above, but now for 200 gold
		local credits = game.ServerScriptService.CREDITS:FindFirstChild(player.Name)
		local value = credits.plrCRED
		if not credits then return end
		value.Value = value.Value + 20000
		return true
	end;
	[37971170] = function(receipt,player)
		-- same thing as above, but now for 200 gold
		local neo1 = game.ServerScriptService.NEON:FindFirstChild(player.Name)
		local neo = neo1.plrNEON
		if not neo1 then return end
		neo.Value = neo.Value + 50
		return true
	end;
	[37971189] = function(receipt,player)
		-- same thing as above, but now for 200 gold
		local neo1 = game.ServerScriptService.NEON:FindFirstChild(player.Name)
		local neo = neo1.plrNEON
		if not neo1 then return end
		neo.Value = neo.Value + 100
		return true
	end;
	[37971200] = function(receipt,player)
		local neo1 = game.ServerScriptService.NEON:FindFirstChild(player.Name)
		local neo = neo1.plrNEON
		if not neo1 then return end
		neo.Value = neo.Value + 250
		return true
	end;
	[37971204] = function(receipt,player)
		-- same thing as above, but now for 200 gold
		local neo1 = game.ServerScriptService.NEON:FindFirstChild(player.Name)
		local neo = neo1.plrNEON
		if not neo1 then return end
		neo.Value = neo.Value + 500
		return true
	end;
	-- you can edit those above, or add your own
}
 
-- set MarketplaceService.ProcessReceipt to this function
-- (this is the same as doing: MarketplaceService.ProcessReceipt = function(recei... )
function MarketplaceService.ProcessReceipt(receiptInfo) 
	local playerData = PlayerDataStore:GetSaveDataById(receiptInfo.PlayerId)
    local playerProductKey = receiptInfo.PlayerId .. ":" .. receiptInfo.PurchaseId
    if PurchaseHistory:GetAsync(playerProductKey) then
        return Enum.ProductPurchaseDecision.PurchaseGranted --We already granted it.
    end
    -- find the player based on the PlayerId in receiptInfo
	local player = game:GetService("Players"):GetPlayerByUserId(receiptInfo.PlayerId)
	if not player then return Enum.ProductPurchaseDecision.NotProcessedYet end
	-- player left? don't process it
 
	local handler
	for productId,func in pairs(Products) do
		if productId == receiptInfo.ProductId then
			handler = func break -- found our handler
		end
	end
 
	-- apparently it's not our responsibility to handle this purchase
	-- if this happens, you should probably check your productIds etc
	-- let's just assume this is ment behavior, and let the purchase go through
	if not handler then return Enum.ProductPurchaseDecision.PurchaseGranted end
 
	-- call it safely with pcall, to catch any error
	local suc,err = pcall(handler,receiptInfo,player)
	if not suc then
		warn("An error occured while processing a product purchase")
		print("\t ProductId:",receiptInfo.ProductId,"\n","Player:",player)
		print("\t Error message:",err) -- log it to the output
		return Enum.ProductPurchaseDecision.NotProcessedYet
	end
 
	-- if the function didn't error, 'err' will be whatever the function returned
	-- if our handler didn't return anything (or it returned false/nil), it means
	-- that the purchase failed for some reason, so we have to cancel it
	if not err then
		return Enum.ProductPurchaseDecision.NotProcessedYet
	end
 
    -- record the transaction in a Data Store
    suc,err = pcall(function()
        PurchaseHistory:SetAsync(playerProductKey, true)
    end)
    if not suc then
        print("An error occured while saving a product purchase")
		print("\t ProductId:",receiptInfo.ProductId,"\n","Player:",player)
		print("\t Error message:",err) -- log it to the output
		print("\t Handler worked fine", "purchase granted") -- add a small note that the actual purchase has succeed
    end
    -- tell ROBLOX that we have successfully handled the transaction (required)
    return Enum.ProductPurchaseDecision.PurchaseGranted		
end