::Mod_Sellswords.HooksMod.hook("scripts/items/weapons/legend_swordstaff", function ( q ) {
	
	q.create = @(__original) function()
	{
		__original();

		this.m.Condition = 92.0;
		this.m.ConditionMax = 92.0;
		this.m.RegularDamage = 65;
		this.m.RegularDamageMax = 80;
		this.m.ArmorDamageMult = 1.1;		
		this.m.Value = 2900;
	}

	q.onEquip = @(__original) function()
	{
		if (!::Is_PTR_Exist)
		{
			this.weapon.onEquip();			
			local prong = this.new("scripts/skills/actives/prong_skill");
			this.addSkill(prong);
			local overheadStrike = this.new("scripts/skills/actives/overhead_strike");
			overheadStrike.m.IsIgnoredAsAOO = true;
			this.addSkill(overheadStrike);
			local spearwall = this.new("scripts/skills/actives/spearwall");
			spearwall.m.Icon = "skills/active_124.png";
			spearwall.m.IconDisabled = "skills/active_124_sw.png";
			spearwall.m.Overlay = "active_124";
			spearwall.m.BaseAttackName = prong.getName();
			spearwall.setFatigueCost(spearwall.getFatigueCostRaw() + 5);
			spearwall.m.ActionPointCost = 6;
			this.addSkill(spearwall);
		}
		else
		{
			__original();
		}
		
		this.addSkill(this.new("scripts/skills/actives/repel"));	
	}		
});
