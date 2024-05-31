::Mod_Sellswords.HooksMod.hook("scripts/items/ammo/legend_large_armor_piercing_arrows", function ( q ) {

	q.create = @(__original) function()
	{
		__original();

		this.m.Description = "A large quiver of arrows thin piercing tips, designed for punching through thick armour.\nIs automatically refilled after each battle if you have enough ammunition.\nGrants [color=" + ::Const.UI.Color.PositiveValue + "]+15%[/color] Armour Piercing but [color=" + ::Const.UI.Color.NegativeValue + "]-5%[/color] Damage";
	}

	q.onUpdateProperties = @(__original) function( _properties )
	{
		this.ammo.onUpdateProperties(_properties);
		local actor = this.getContainer().getActor();
		local item = actor.getItems().getItemAtSlot(this.Const.ItemSlot.Mainhand);

		if (item == null || !item.isWeaponType(this.Const.Items.WeaponType.Bow))
		{
			return;
		}

		_properties.DamageDirectMult += 0.15;
		_properties.RangedDamageMult *= 0.95;
	}
});
