if getgenv().Key == nil then
	getgenv().Key = ""
end

if getgenv().DiscordId == nil then
	getgenv().DiscordId = ""
end

local Server = request({
	Url = "http://43.133.57.235/Whitelist.php?CheckKey="..getgenv().Key.."&discord_id="..getgenv().DiscordId,
	Method = "GET"
}).Body

if string.find(Server,"WHITELIST !") then
	if game.CoreGui:FindFirstChild("Maruko Hub Free Script") then
		game.CoreGui:FindFirstChild("Maruko Hub Free Script"):Destroy()
	end
	else
	if getgenv().Key == nil or getgenv().Key == "" then
		game.Players.LocalPlayer:Kick("\n ❌You Not Whitelist [854-998L]❌")
	elseif getgenv().DiscordId == nil or getgenv().DiscordId == "" then
		game.Players.LocalPlayer:Kick("\n ❌You Not Whitelist [253-678R]❌")
	elseif getgenv().HWID == nil or getgenv().HWID == "" then
		game.Players.LocalPlayer:Kick("\n ❌ Check HWID [478-12T]❌")
	else
		game.Players.LocalPlayer:Kick("\n ❌You Not Whitelist [89-74G]❌")
	end
end
loadstring(game:HttpGet("https://raw.githubusercontent.com/WETHUBv1/Kumascripter/main/Protected_8969167394617507.lua"))();
