::Mod_Sellswords.HooksMod.hook("scripts/skills/actives/legend_grapple", function ( q ) {

	q.create = @(__original) function()
	{
		__original();
		this.m.FatigueCost = 15;
	}
	
});