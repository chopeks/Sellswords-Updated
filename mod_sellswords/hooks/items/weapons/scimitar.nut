::mods_hookExactClass("items/weapons/scimitar", function (o) {
	local ws_create = o.create;
	o.create = function()
	{
		ws_create()
		this.m.WeaponType = this.Const.Items.WeaponType.Sword | this.Const.Items.WeaponType.Cleaver;
	}
});